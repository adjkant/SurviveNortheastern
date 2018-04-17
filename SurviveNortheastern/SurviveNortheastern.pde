import java.util.*;
import java.time.Instant;

static final int GAME_SIZE = 800;
int PLAYER_SIZE = 15;
int SQUARE_SIZE = 20;
int NUM_SQUARES_LENGTH = GAME_SIZE / SQUARE_SIZE; 

Game game;

long endTimer = 0;
int WIN_SHOW_TIME = 30;

void settings() {
  size(GAME_SIZE, GAME_SIZE);
}

void setup() {
  JSONArray levelsJSON = loadJSONArray("game-levels.json");
  ArrayList<Level> levels = new ArrayList<Level>();
  
  int index = 0;
  while (!levelsJSON.isNull(index)) {
    JSONObject levelJSON = levelsJSON.getJSONObject(index);
    ArrayList<String> cutScenes = StringsToArrayList(levelJSON.getJSONArray("Cut Scenes"));
    int playerX = levelJSON.getInt("Player X");
    int playerY = levelJSON.getInt("Player Y");
    JSONArray enemiesJSON = levelJSON.getJSONArray("Enemies");
    ArrayList<Enemy> enemies = new ArrayList<Enemy>();
    JSONArray itemsJSON = levelJSON.getJSONArray("Items");
    ArrayList<Item> items = new ArrayList<Item>();
    
    // Parse enemies
    int eIndex = 0;
    while (!enemiesJSON.isNull(eIndex)) {
      JSONObject enemyJSON = enemiesJSON.getJSONObject(eIndex);
      int x = enemyJSON.getInt("X");
      int y = enemyJSON.getInt("Y");
      
      // Add enemy
      if (enemyJSON.getString("Type").equals("PROF")) {
        enemies.add(new ProfessorEnemy(x, y, enemyJSON.getInt("Speed"), enemyJSON.getInt("Range"), enemyJSON.getFloat("HurtPower"), enemyJSON.getFloat("SlowPower")));
      } else if (enemyJSON.getString("Type").equals("HUSKY")) {
        enemies.add(new HuskyEnemy(x, y));
      } else if (enemyJSON.getString("Type").equals("NUWAVE")) {
        enemies.add(new NUWaveEnemy(x, y));
      } else if (enemyJSON.getString("Type").equals("RA")) {
        enemies.add(new RAEnemy(x, y));
      } else if (enemyJSON.getString("Type").equals("DRAGAOUN")) {
        enemies.add(new DragaounEnemy(x, y));
      } else {
        println("Invalid Enemy");
        println(enemyJSON.getString("Type"));
      }
      
      eIndex++;
    }
    
    // Parse items
    int iIndex = 0;
    while (!itemsJSON.isNull(iIndex)) {
      JSONObject itemJSON = itemsJSON.getJSONObject(iIndex);
      int x = itemJSON.getInt("X");
      int y = itemJSON.getInt("Y");
      ArrayList<Integer> c = NumbersToArrayList(itemJSON.getJSONArray("Color"));
      Item i = new Item(itemJSON.getString("Name"), x, y, new PVector(c.get(0), c.get(1), c.get(2)));
      items.add(i);
      
      iIndex++;
    }
    
    // Create and add new level
    Level level = new Level(cutScenes, playerX, playerY, enemies, items, new Tunnels());
    levels.add(level);
    
    // Next Level Load
    index++;
  }
  
  // Create full game from levels
  game = new Game(levels);
}

void draw() {
  try {
    Level l = game.getCurrentLevel();
    
    if (l.isPlaying() && !l.isOver()) {
      // Enemy Actions
      l.actEnemies();
    } else {
      // Game Ended or In Cutscene Mode
    }
    
    // Drawing
    if (game.isWon()) {
      background(0, 0, 0);
      fill(255);
      stroke(255);
      textSize(30);
      text("You Graduated!", 300, 400);
      if (endTimer == 0) {
        endTimer = Instant.now().getEpochSecond() + WIN_SHOW_TIME;
      } else {
        if (endTimer < Instant.now().getEpochSecond()) {
          System.exit(0);
        }
      }
    } else {
      background(0, 0, 0);
      game.drawGame();
    }
    
  } catch (LevelNotFoundException e) {
    e.printStackTrace();
  }
}

void keyPressed() {
  try {
    Level curLevel = game.getCurrentLevel();
    if (key == CODED && curLevel.isPlaying() && !curLevel.isOver()) { 
      if (keyCode == UP || keyCode == DOWN || keyCode == LEFT || keyCode == RIGHT) {
        if (curLevel.playerMoveStall < 1) {
          curLevel.attemptMove(keyCode);
          curLevel.removeItems();
        } else {
          curLevel.playerMoveStall -= 1;
        }
        
      }
    }
    
    if (key == ' ') {
      if (curLevel.isOver() && curLevel.isWon()) {
        game.nextLevel();
      } else if (curLevel.isOver()) {
        curLevel.restartLevel();
      } else {
        curLevel.nextLevelScene();
      }
    }
    
    if (key == 'r') {
      curLevel.restartLevel();
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
  
  void drawGame() throws LevelNotFoundException {
    this.drawCurrentLevel();
  }
  
  private void drawCurrentLevel() {
    try {
      this.getCurrentLevel().drawLevel();
    } catch (LevelNotFoundException e) {
      e.printStackTrace();
    }
  }
  
  Level getCurrentLevel() throws LevelNotFoundException {
    if (this.levels.size() >= this.currentLevel) {
      return this.levels.get(this.currentLevel - 1);
    } else {
      throw new LevelNotFoundException();
    }
  }
  
  boolean nextLevel() {
    if (this.currentLevel < this.levels.size()) {
      this.currentLevel += 1;
      return true;
    } else {
      return false;
    }
  }
  
  boolean isWon() throws LevelNotFoundException {
    return this.levels.size() == this.currentLevel && this.getCurrentLevel().isWon();
  }

}
