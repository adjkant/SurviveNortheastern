

class Level { 
  ArrayList<String> cutScenes;
  int cutScenePlace;
  PVector playerLocation;
  ArrayList<Enemy> enemies;
  ArrayList<Item> items;
  public Tunnels tunnels;
  PShape playerShape;
  
  Level(ArrayList<String> cutScenes, int playerX, int playerY, ArrayList<Enemy> enemies, ArrayList<Item> items, Tunnels tunnels) {
    this.cutScenes = cutScenes;
    this.cutScenePlace = 0;
    this.playerLocation = new PVector(playerX, playerY);
    this.enemies = enemies;
    this.items = items;
    this.tunnels = tunnels;
    fill(120, 20, 30);
    this.playerShape = createShape(ELLIPSE, -SQUARE_SIZE/2, -SQUARE_SIZE/2, PLAYER_SIZE, PLAYER_SIZE);
  }
  
  void drawLevel() {
    if (this.isPlaying()) {
      this.tunnels.drawTunnels();
      this.drawPlayer();
      this.drawEnemies();
    } else {
      this.drawCutScene();
    }
    
  }
  
  void drawPlayer() {
    new Drawing().drawShapeCenter(this.playerShape, (int) playerLocation.x * SQUARE_SIZE, (int) playerLocation.y * SQUARE_SIZE, 0);
  }
  
  void drawEnemies() {
    for(Enemy e : enemies) {
      e.drawEnemy();
    }
  }
  
  void actEnemies() {
    for(Enemy e : enemies) {
      e.act(this);
    }
  }
  
  void drawCutScene() {
    background(0, 0, 0);
    fill(255);
    text(this.cutScenes.get(this.cutScenePlace), GAME_SIZE/2,GAME_SIZE/2);
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
  
}