

class Level { 
  ArrayList<String> cutScenes;
  int cutScenePlace;
  
  PVector playerLocation;
  ArrayList<Enemy> enemies;
  ArrayList<Item> items;
  
  Level(ArrayList<String> cutScenes, int playerX, int playerY, ArrayList<Enemy> enemies, ArrayList<Item> items) {
    this.cutScenes = cutScenes;
    this.cutScenePlace = 0;
    this.playerLocation = new PVector(playerX, playerY);
    this.enemies = enemies;
    this.items = items;
  }
  
  void drawLevel() {
    // TODO
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