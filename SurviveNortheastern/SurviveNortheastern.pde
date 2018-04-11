import java.util.*;

static final int GAME_SIZE = 800;

Game game;

void settings() {
  size(GAME_SIZE, GAME_SIZE);
}

void setup() {
  ArrayList<Level> levels = new ArrayList<Level>();
  levels.add(new Level(new ArrayList(Arrays.asList("Test 1", "Test 2")), 
             10, 10, 
             new ArrayList<Enemy>(), 
             new ArrayList<Item>()));
  game = new Game(levels);
}

void draw() {
  background(0, 0, 0);
  game.drawGame();
}


class Game {
  Tunnels tunnels;
  ArrayList<Level> levels;
  int currentLevel;
  
  Game(ArrayList<Level> levels) {
    this.tunnels = new Tunnels();
    this.levels = levels;
    this.currentLevel = 1;
  }
  
  void drawGame() {
    this.tunnels.drawTunnels();
    this.drawCurrentLevel();
  }
  
  private void drawCurrentLevel() {
    try {
      this.getCurrentLevel().drawLevel();
    } catch (LevelNotFoundException e) {
      e.printStackTrace();
    }
  }
  
  private Level getCurrentLevel() throws LevelNotFoundException {
    if (this.levels.size() >= this.currentLevel) {
      return this.levels.get(this.currentLevel - 1);
    } else {
      throw new LevelNotFoundException();
    }
  }
}