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
        enemies.add(new ProfessorEnemy(x, y));
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
      Item i = new Item(x, y, new PVector(c.get(0), c.get(1), c.get(2)));
      items.add(i);
      
      iIndex++;
    }
    
    // Create and add new level
    Level level = new Level(cutScenes, playerX, playerY, enemies, items, new Tunnels());
    levels.add(level);
    
    // Next Level Load
    index++;
  }
  
  game = new Game(levels);
  
  //ArrayList<Level> levelss = new ArrayList<Level>();
  //levelss.add(new Level(new ArrayList(Arrays.asList("Test 1", "Test 2")), 
  //           12, 20, 
  //           new ArrayList<Enemy>(Arrays.asList(new ProfessorEnemy(5, 27))), 
  //           new ArrayList<Item>(Arrays.asList(new Item(12, 12, new PVector(0, 0, 255)))),
  //           new Tunnels()));
  //game = new Game(levelss);
}

void draw() {
  try {
    Level l = game.getCurrentLevel();
    
    if (l.isPlaying() && !l.isOver()) {
      // Enemy Actions
      l.actEnemies();
    } else {
      // In Cutscene Modem
    }
    
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
  };}