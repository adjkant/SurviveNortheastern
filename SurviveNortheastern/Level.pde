int MAX_HEALTH = 100;

class Level { 
  Level originalLevel;
  
  ArrayList<String> cutScenes;
  int cutScenePlace;
  
  PVector playerLocation;
  int playerHealth;
  
  ArrayList<Enemy> enemies;
  ArrayList<Item> items;
  
  public Tunnels tunnels;
  PShape playerShape;
  
  Level() {
    this.originalLevel = null;
  }
  
  Level(ArrayList<String> cutScenes, int playerX, int playerY, ArrayList<Enemy> enemies, ArrayList<Item> items, Tunnels tunnels) {
    
    this.cutScenes = cutScenes;
    this.cutScenePlace = 0;
    
    this.playerLocation = new PVector(playerX, playerY);
    this.playerHealth = MAX_HEALTH;
    
    this.enemies = enemies;
    this.items = items;
    
    this.tunnels = tunnels;
    fill(120, 20, 30);
    stroke(0, 0, 0);
    this.playerShape = createShape(ELLIPSE, -SQUARE_SIZE/2, -SQUARE_SIZE/2, PLAYER_SIZE, PLAYER_SIZE);
    
    // Make a level copy
    this.originalLevel = new Level();
    this.originalLevel.copyValues(this);
  }
  
  // ---------------------------------------------------------------------------------------------------------------------
  // Drawing
  
  void drawLevel() {
    if (this.isPlaying()) {
      this.tunnels.drawTunnels();
      this.drawPlayer();
      this.drawEnemies();
      this.drawItems();
      this.drawHealth();
    } else {
      this.drawCutScene();
    }
    
  }
  
  void drawPlayer() {
    new Drawing().drawShapeCenter(this.playerShape, (int) playerLocation.x * SQUARE_SIZE, (int) playerLocation.y * SQUARE_SIZE, 0);
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
    fill(255);
    stroke(255);
    text("Health", 20, 20);
    new Drawing().drawShapeCenter(createShape(RECT, -1, -1, MAX_HEALTH*3+2, 12), 20, 30, 0);
    
    if (this.playerHealth >= 0) {
      fill(255, 0, 0);
      stroke(255, 0, 0);
      new Drawing().drawShapeCenter(createShape(RECT, 0, 0, this.playerHealth*3, 10), 20, 30, 0);
    }
    
  }
  
  void drawCutScene() {
    background(0, 0, 0);
    fill(255);
    text(this.cutScenes.get(this.cutScenePlace), GAME_SIZE/2,GAME_SIZE/2);
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
      if (this.tunnels.isValidMove(playerLocation, attemptLoc)) {
          this.playerLocation = attemptLoc;
          drawLevel();
      }
    }
      if (keyCode == DOWN) {
      PVector attemptLoc = new PVector (playerLocation.x, playerLocation.y + 1);
      if (this.tunnels.isValidMove(playerLocation, attemptLoc)) {
          this.playerLocation = attemptLoc;
          drawLevel();
      }
      }
      if (keyCode == LEFT) {
      PVector attemptLoc = new PVector (playerLocation.x - 1, playerLocation.y);
      if (this.tunnels.isValidMove(playerLocation, attemptLoc)) {
          this.playerLocation = attemptLoc;
          drawLevel();
      }
      }
      if (keyCode == RIGHT) {
      PVector attemptLoc = new PVector (playerLocation.x + 1, playerLocation.y);
      if (this.tunnels.isValidMove(playerLocation, attemptLoc)) {
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
    
    this.enemies = new ArrayList<Enemy>();
    for(Enemy e : l.enemies) {
      if (e instanceof ProfessorEnemy) {
        this.enemies.add(new ProfessorEnemy(e.x, e.y));
      }
    }
    
    this.items = new ArrayList<Item>();
    for(Item i : l.items) {
      this.items.add(new Item(i.x, i.y, i.s));
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
  
}