import java.util.Arrays;

static final int GAME_SIZE = 700;

Game game;

void settings() {
  size(GAME_SIZE, GAME_SIZE);
}

void setup() {
  game = new Game(new ArrayList<Level>());
}

void draw() {
  background(255, 255, 255);
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