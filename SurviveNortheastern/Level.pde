

class Level { 
  int PLAYER_SIZE = 20;
  ArrayList<String> cutScenes;
  int cutScenePlace;
  PVector playerLocation;
  ArrayList<Enemy> enemies;
  ArrayList<Item> items;
  Tunnels tunnels;
  PShape playerShape;
  
  Level(ArrayList<String> cutScenes, int playerX, int playerY, ArrayList<Enemy> enemies, ArrayList<Item> items, Tunnels tunnels) {
    this.cutScenes = cutScenes;
    this.cutScenePlace = 0;
    this.playerLocation = new PVector(playerX, playerY);
    this.enemies = enemies;
    this.items = items;
    this.tunnels = tunnels;
    fill(120, 20, 30);
    this.playerShape = createShape(ELLIPSE, 0, 0, PLAYER_SIZE, PLAYER_SIZE);
  }
  
  void drawLevel() {
    // TODO
    drawPlayer();
  }
  
  void drawPlayer() {
    new Drawing().drawShapeCenter(this.playerShape, (int) playerLocation.x * PLAYER_SIZE, (int) playerLocation.y * PLAYER_SIZE, 0);
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
