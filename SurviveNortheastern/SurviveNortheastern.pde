import java.util.*;

static final int GAME_SIZE = 800;
int PLAYER_SIZE = 15;
int SQUARE_SIZE = 20;
int NUM_SQUARES_LENGTH = GAME_SIZE / SQUARE_SIZE; 

Game game;

void settings() {
  size(GAME_SIZE, GAME_SIZE);
}

void setup() {
  ArrayList<Level> levels = new ArrayList<Level>();
  levels.add(new Level(new ArrayList(Arrays.asList("Test 1", "Test 2")), 
             12, 20, 
             new ArrayList<Enemy>(Arrays.asList(new ProfessorEnemy(5, 27))), 
             new ArrayList<Item>(),
             new Tunnels()));
  game = new Game(levels);
}

void draw() {
  try {
    // Enemy Actions
    game.actEnemies();
    
    // Drawing
    background(0, 0, 0);
    game.drawGame();
  } catch (LevelNotFoundException e) {
    e.printStackTrace();
  }
}

void keyPressed() {
  try {
    Level curLevel = game.getCurrentLevel();
    if (key == CODED && curLevel.isPlaying()) { 
      if (keyCode == UP || keyCode == DOWN || keyCode == LEFT || keyCode == RIGHT) {
        curLevel.attemptMove(keyCode);
      }
    }
    
    if (key == ' ') {
        curLevel.nextLevelScene();
    }
    
  } catch (LevelNotFoundException e) {
      e.printStackTrace();
  }
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
  
  void actEnemies() throws LevelNotFoundException {
    getCurrentLevel().actEnemies();
  }
}