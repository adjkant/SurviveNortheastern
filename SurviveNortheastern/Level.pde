int MAX_HEALTH = 100;
int LINE_LENGTH = 80;

class Level { 
  Level originalLevel;
  
  ArrayList<String> cutScenes;
  int cutScenePlace;
  
  PVector playerLocation;
  float playerHealth;
  float playerMoveStall;
  
  ArrayList<Enemy> enemies;
  ArrayList<Item> items;
  
  public Tunnels tunnels;
  PShape playerShape;
  
  Level() {
    this.originalLevel = null;
    this.enemies = new ArrayList<Enemy>();
    this.items = new ArrayList<Item>();
  }
  
  Level(ArrayList<String> cutScenes, int playerX, int playerY, ArrayList<Enemy> enemies, ArrayList<Item> items, Tunnels tunnels) {
    
    this.cutScenes = cutScenes;
    this.cutScenePlace = 0;
    
    this.playerLocation = new PVector(playerX, playerY);
    this.playerHealth = MAX_HEALTH;
    this.playerMoveStall = 0;
    
    this.enemies = enemies;
    this.items = items;
    
    this.tunnels = tunnels;
    fill(0, 0, 255);
    stroke(255);
    this.playerShape = createShape(ELLIPSE, -SQUARE_SIZE/2, -SQUARE_SIZE/2, PLAYER_SIZE, PLAYER_SIZE);
    
    // Make a level copy
    this.originalLevel = new Level();
    this.originalLevel.copyValues(this);
  }
  
  // ---------------------------------------------------------------------------------------------------------------------
  // Drawing
  
  void drawLevel() {
    if (this.isPlaying() && !this.isOver()) {
      this.tunnels.drawTunnels();
      this.drawPlayer();
      this.drawEnemies();
      this.drawItems();
      this.drawHealth();
      this.drawItemKey();
    } else if (this.isPlaying() && this.isWon()) {
      this.drawLevelWon();
    } else if (this.isOver() && !this.isWon()) {
      this.drawLevelLost();
    } else {
      this.drawCutScene();
    }
    
  }
  
  void drawPlayer() {
    drawShapeCenter(this.playerShape, (int) playerLocation.x * SQUARE_SIZE, (int) playerLocation.y * SQUARE_SIZE, 0);
  }
  
  void drawEnemies() {
    for(Enemy e : this.enemies) {
      e.drawEnemy();
    }
  }
  
  void drawItems() {
    for (Item i : this.items) {
      i.drawItem();
    }
  }
  
  void drawHealth() {
    textSize(15);
    fill(255);
    stroke(255);
    text("Health", 20, 20);
    drawShapeCenter(createShape(RECT, -1, -1, MAX_HEALTH*3+2, 12), 20, 30, 0);
    
    if (this.playerHealth >= 0) {
      fill(255, 0, 0);
      stroke(255, 0, 0);
      drawShapeCenter(createShape(RECT, 0, 0, this.playerHealth*3, 10), 20, 30, 0);
    }
    
  }
  
  void drawItemKey() {
    textSize(15);
    fill(255);
    text("Items Remaining:", 20, 60);
    textSize(12);
    fill(255);
    int h = 80;
    for (Item i : items) {
      drawShapeCenter(i.s, 35, h+6, 0);
      text(i.name, 37, h);
      h += 20;
    }
  }
  
  void drawCutScene() {
    background(0, 0, 0);
    String content = this.cutScenes.get(this.cutScenePlace);
    
    int place = 0;
    int lastWord = 0;
    ArrayList<String> lines = new ArrayList<String>();
    while (place < content.length()) {
      if (place - lastWord > LINE_LENGTH && content.charAt(place) == ' ') {
        lines.add(content.substring(lastWord, place));
        lastWord = place + 1;
      } else if (place == content.length() - 1) {
        lines.add(content.substring(lastWord, place+1));
      }
      
      // next place
      place++;
    }
    
    textSize(15);
    fill(255);
    for (int l = 0; l < lines.size(); l++) {
      text(lines.get(l), 80, GAME_SIZE/2 - 100 + l * 20);
    }
    
    drawContinuePrompt();
  }
  
  void drawLevelWon() {
    textSize(30);
    fill(255);
    text("Level Complete", GAME_SIZE/2 - 120, GAME_SIZE/3);
    drawContinuePrompt();
  }
  
  void drawLevelLost() {
    textSize(30);
    fill(255);
    text("Level Lost", GAME_SIZE/2 - 90, GAME_SIZE/3);
    drawContinuePrompt();
  }
  
  void drawContinuePrompt() {
    textSize(15);
    fill(255);
    text("Press Space To Continue", GAME_SIZE/2 - 100, GAME_SIZE - 100);
  }
  
  // ---------------------------------------------------------------------------------------------------------------------
  // Gameplay
  
  void actEnemies() {
    for(Enemy e : this.enemies) {
      e.act(this);
    }
  }
  
  void removeItems() {
    Iterator<Item> iter = this.items.iterator();
    while (iter.hasNext()) {
      Item i = iter.next();
      if (i.x == this.playerLocation.x && i.y == this.playerLocation.y) {
          iter.remove();
      }
    }
  }
  
  void attemptMove(int keyCode) {
    if (keyCode == UP) {
      PVector attemptLoc = new PVector (playerLocation.x, playerLocation.y - 1);
      if (this.tunnels.isValidMove(playerLocation, attemptLoc) && spaceFree(attemptLoc)) {
          this.playerLocation = attemptLoc;
          drawLevel();
      }
    }
      if (keyCode == DOWN) {
      PVector attemptLoc = new PVector (playerLocation.x, playerLocation.y + 1);
      if (this.tunnels.isValidMove(playerLocation, attemptLoc) && spaceFree(attemptLoc)) {
          this.playerLocation = attemptLoc;
          drawLevel();
      }
      }
      if (keyCode == LEFT) {
      PVector attemptLoc = new PVector (playerLocation.x - 1, playerLocation.y);
      if (this.tunnels.isValidMove(playerLocation, attemptLoc) && spaceFree(attemptLoc)) {
          this.playerLocation = attemptLoc;
          drawLevel();
      }
      }
      if (keyCode == RIGHT) {
      PVector attemptLoc = new PVector (playerLocation.x + 1, playerLocation.y);
      if (this.tunnels.isValidMove(playerLocation, attemptLoc) && spaceFree(attemptLoc)) {
          this.playerLocation = attemptLoc;
          drawLevel();
      }
    }
  }
  
  // ---------------------------------------------------------------------------------------------------------------------
  // Level Cutscene, Start, Restart
 
  boolean nextLevelScene() {
    if (this.cutScenes.size() > this.cutScenePlace) {
      this.cutScenePlace++;
      return true;
    } else {
       return false;
    }
  }
  
  boolean isPlaying() {
    return this.cutScenePlace == this.cutScenes.size();
  }
  
  void restartLevel() {
    this.copyValues(this.originalLevel);
  }
  
  void copyValues(Level l) {
    this.playerLocation = new PVector(l.playerLocation.x, l.playerLocation.y);
    this.playerHealth = l.playerHealth;
    this.cutScenePlace = l.cutScenePlace;
    
    while (l.enemies.size() != this.enemies.size()) {
      this.enemies.add(new Enemy());
    }
    
    for(int i = 0; i < l.enemies.size(); i++) {
      Enemy e = this.enemies.get(i);
      Enemy ce = l.enemies.get(i);
      e.x = ce.x;
      e.y = ce.y;
    }
    
    this.items = new ArrayList<Item>();
    for(Item i : l.items) {
      this.items.add(new Item(i.name, i.x, i.y, i.s));
    }
    
  }
  
  // ---------------------------------------------------------------------------------------------------------------------
  // Level Checks
  
  boolean isOver() {
    return this.playerHealth <= 0 || this.items.size() == 0;
  }
  
  boolean isWon() {
    return this.items.size() == 0 && this.playerHealth > 0;
  }
  
  boolean spaceFree(PVector s) {
    for (Enemy e : this.enemies) {
      if (e.x == s.x && e.y == s.y) {
        return false;
      }
    }
    return !(this.playerLocation.x == s.x && this.playerLocation.y == s.y);
  }
  
  ArrayList<PVector> freeSpaces(ArrayList<PVector> possible) {
    ArrayList<PVector> free = new ArrayList<PVector>();
    
    for (PVector p : possible) {
      if (spaceFree(p)) {
        free.add(p);
      }
    }
    
    return free;
  }
  
  ArrayList<PVector> freeSpacesOrPlayer(ArrayList<PVector> possible) {
    ArrayList<PVector> free = new ArrayList<PVector>();
    
    for (PVector p : possible) {
      if (spaceFree(p) || (this.playerLocation.x == p.x && this.playerLocation.y == p.y)) {
        free.add(p);
      }
    }
    
    return free;
  }
  
}