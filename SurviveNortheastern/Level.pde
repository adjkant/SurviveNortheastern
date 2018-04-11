

class Level { 
  int PLAYER_SIZE = 20;
  PVector playerLocation;
  ArrayList<Enemy> enemies;
  ArrayList<Item> items;
  Tunnels tunnels;
  PShape playerShape;
  
  Level(int playerX, int playerY, ArrayList<Enemy> enemies, ArrayList<Item> items, Tunnels tunnels) {
    this.playerLocation = new PVector(playerX, playerY);
    this.enemies = enemies;
    this.items = items;
    this.tunnels = tunnels;
    fill(120, 20, 30);
    this.playerShape = createShape(ELLIPSE, 0, 0, PLAYER_SIZE, PLAYER_SIZE);
  }
  
  void setup() {
  }
  
  void drawLevel() {
    // TODO
    drawPlayer(this.playerLocation);
  }
  
  void drawPlayer(PVector newLoc) {
    new Drawing().drawShapeCenter(this.playerShape, (int) playerLocation.x * PLAYER_SIZE, (int) playerLocation.y * PLAYER_SIZE, 0);
  }
  
  void keyPressed() {
    if (key == CODED) {
      if (keyCode == UP) {
        PVector attemptLoc = new PVector (playerLocation.x, playerLocation.y - 1);
        if (this.tunnels.isValidMove(playerLocation, attemptLoc) {
            this.playerLocation = attemptLoc;
            drawLevel();
        }
      }
    }
  }
  
}
