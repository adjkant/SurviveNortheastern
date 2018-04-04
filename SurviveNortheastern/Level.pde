

class Level { 
  PVector playerLocation;
  ArrayList<Enemy> enemies;
  ArrayList<Item> items;
  
  Level(int playerX, int playerY, ArrayList<Enemy> enemies, ArrayList<Item> items) {
    this.playerLocation = new PVector(playerX, playerY);
    this.enemies = enemies;
    this.items = items;
  }
  
  void drawLevel() {
    // TODO
  }
  
}