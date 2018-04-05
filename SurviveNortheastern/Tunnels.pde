int GRID_WIDTH_LINES = 7; //number of vertical lines
int GRID_HEIGHT_LINES = 8; //number of horizontal lines
int GRID_WIDTH_SIZE = (GAME_SIZE / GRID_WIDTH_LINES); // space between vertical lines
int GRID_HEIGHT_SIZE =(GAME_SIZE / GRID_HEIGHT_LINES); // space between horizontal lines

int SQUARE_SIZE = 20;
int NUM_SQUARES_LENGTH = GAME_SIZE / SQUARE_SIZE; 

PVector grey = new PVector(193,193,193);
  
class Tunnels {
  
  ArrayList<Building> buildings;
  ArrayList<Path> paths;
  Drawing drawer;
 
  Tunnels() {
    this.drawer = new Drawing();
    
    this.buildings = new ArrayList<Building>();
    
    addForsyth();
    addSnellEngineering();
    addCabot();
    addChurchill();
    addSnell();
    addHayden();
    addRichard();
    addEll();
    addCurry();
    addDodge();
    addMugar();
   
    
    this.paths = new ArrayList<Path>();
    
    addFtoSE();
    addFtoSNE();
 
  }
  
  void drawTunnels() {
    drawBuildings();
    drawPaths();
  }
  
  void drawBuildings() {
    for (Building b : this.buildings) {
      this.drawer.drawSquare(b.x, b.y, b.c);
      //text(b.name, 50, 50);
    }
  }
  
  void drawPaths() {
    for (Path p : this.paths) {
      this.drawer.drawSquare(p.x, p.y, p.c);
    }
  }
  
  // Building Additions
  
  private void addForsyth() {
    String forsythLabel = "F";
    
    this.buildings.add(new Building(1, 23, new PVector(0, 255, 0), forsythLabel));
    this.buildings.add(new Building(2, 23, new PVector(0, 255, 0), forsythLabel));
    this.buildings.add(new Building(1, 24, new PVector(0, 255, 0), forsythLabel));
    this.buildings.add(new Building(2, 24, new PVector(0, 255, 0), forsythLabel));
  }
  
    private void addCabot() {
      String cabotLabel = "CA";
      PVector orange = new PVector (255,165,0);
      
      this.buildings.add(new Building(12, 13, orange, cabotLabel));
      this.buildings.add(new Building(13, 13, orange, cabotLabel));
      this.buildings.add(new Building(12, 12, orange, cabotLabel));
      this.buildings.add(new Building(13, 12, orange, cabotLabel));
  }
  
    private void addChurchill() {
      String churchLabel = "Cu";
      PVector orange = new PVector (255,105,0);
      
      this.buildings.add(new Building(12, 23, orange, churchLabel));
      this.buildings.add(new Building(13, 23, orange, churchLabel));
      this.buildings.add(new Building(12, 24, orange, churchLabel));
      this.buildings.add(new Building(13, 24, orange, churchLabel));
  }
  
   private void addSnell() {
    String snellLabel = "SE";
    
    PVector blue = new PVector(66, 134, 244);
    
    this.buildings.add(new Building(20, 33, blue, snellLabel));
    this.buildings.add(new Building(20, 32, blue, snellLabel));
    this.buildings.add(new Building(21, 32, blue, snellLabel));
    this.buildings.add(new Building(21, 33, blue, snellLabel));
    
   }
   
    private void addHayden() {
      String haydenLabel = "HA";
      
      PVector blue = new PVector(194, 137, 255);
      
      this.buildings.add(new Building(24, 17, blue, haydenLabel));
      this.buildings.add(new Building(24, 18, blue, haydenLabel));
      this.buildings.add(new Building(25, 17, blue, haydenLabel));
      this.buildings.add(new Building(25, 18, blue, haydenLabel));
    
   }
   
   private void addRichard() {
      String haydenLabel = "RI";
      
      PVector blue = new PVector(137, 215, 255);
      
      this.buildings.add(new Building(24, 5, blue, haydenLabel));
      this.buildings.add(new Building(24, 4, blue, haydenLabel));
      this.buildings.add(new Building(25, 5, blue, haydenLabel));
      this.buildings.add(new Building(25, 4, blue, haydenLabel));
    
   }
   
      private void addCurry() {
      String haydenLabel = "HA";
      
      PVector blue = new PVector(250, 2, 2);
      
      this.buildings.add(new Building(32, 28, blue, haydenLabel));
      this.buildings.add(new Building(31, 28, blue, haydenLabel));
      this.buildings.add(new Building(32, 29, blue, haydenLabel));
      this.buildings.add(new Building(31, 29, blue, haydenLabel));
    
   }
   
   private void addEll() {
      String haydenLabel = "HA";
      
      PVector blue = new PVector(137, 215, 255);
      
      this.buildings.add(new Building(32, 13, blue, haydenLabel));
      this.buildings.add(new Building(32, 12, blue, haydenLabel));
      this.buildings.add(new Building(31, 13, blue, haydenLabel));
      this.buildings.add(new Building(31, 12, blue, haydenLabel));
    
   }
   
   private void addDodge() {
      String haydenLabel = "HA";
      
      PVector blue = new PVector(137, 215, 255);
      
      this.buildings.add(new Building(40, 5, blue, haydenLabel));
      this.buildings.add(new Building(39, 5, blue, haydenLabel));
      this.buildings.add(new Building(39, 4, blue, haydenLabel));
      this.buildings.add(new Building(40, 4, blue, haydenLabel));
    
   }
   private void addMugar() {
      String haydenLabel = "HA";
      
      PVector blue = new PVector(76, 34, 1);
      
      this.buildings.add(new Building(40, 17, blue, haydenLabel));
      this.buildings.add(new Building(39, 18, blue, haydenLabel));
      this.buildings.add(new Building(39, 17, blue, haydenLabel));
      this.buildings.add(new Building(40, 18, blue, haydenLabel));
    
   }
  // Where all the buildings are:
  /*
  1, 23 = Forsyth
  8, 34 = Sneg
  12, 23 = Church
  20, 33 = Snell
  24, 17 = Hayden
  12, 13 = Cabot
  25, 5 = Richard
  32, 13 = Ell
  32, 28 = curry
  40, 5 = dodge
  40, 17 = mugar
  */
  
  private void addSnellEngineering() {
    String snellEngineeringLabel = "SE";
    
    PVector blue = new PVector (0, 0, 255);
    
    this.buildings.add(new Building(8, 34, blue, snellEngineeringLabel));
    this.buildings.add(new Building(8, 35, blue, snellEngineeringLabel));
    this.buildings.add(new Building(8, 36, blue, snellEngineeringLabel));
    this.buildings.add(new Building(8, 37, blue, snellEngineeringLabel));
    this.buildings.add(new Building(8, 38, blue, snellEngineeringLabel));
    this.buildings.add(new Building(8, 39, blue, snellEngineeringLabel));
    this.buildings.add(new Building(8, 40, blue, snellEngineeringLabel));
    
    this.buildings.add(new Building(7, 35, new PVector(0, 0, 255), snellEngineeringLabel));
    this.buildings.add(new Building(7, 34, new PVector(0, 0, 255), snellEngineeringLabel));
    this.buildings.add(new Building(7, 36, new PVector(0, 0, 255), snellEngineeringLabel));
    this.buildings.add(new Building(7, 37, new PVector(0, 0, 255), snellEngineeringLabel));
    this.buildings.add(new Building(7, 38, new PVector(0, 0, 255), snellEngineeringLabel));
    this.buildings.add(new Building(7, 39, new PVector(0, 0, 255), snellEngineeringLabel));
    this.buildings.add(new Building(7, 40, new PVector(0, 0, 255), snellEngineeringLabel));
    
    this.buildings.add(new Building(12, 36, new PVector(0, 0, 255), snellEngineeringLabel));
    this.buildings.add(new Building(11, 36, new PVector(0, 0, 255), snellEngineeringLabel));
    this.buildings.add(new Building(10, 36, new PVector(0, 0, 255), snellEngineeringLabel));
    this.buildings.add(new Building(9, 36, new PVector(0, 0, 255), snellEngineeringLabel));
    this.buildings.add(new Building(6, 36, new PVector(0, 0, 255), snellEngineeringLabel));
    this.buildings.add(new Building(5, 36, new PVector(0, 0, 255), snellEngineeringLabel));
    this.buildings.add(new Building(4, 36, new PVector(0, 0, 255), snellEngineeringLabel));
    this.buildings.add(new Building(3, 36, new PVector(0, 0, 255), snellEngineeringLabel));
    
    this.buildings.add(new Building(12, 35, new PVector(0, 0, 255), snellEngineeringLabel));
    this.buildings.add(new Building(11, 35, new PVector(0, 0, 255), snellEngineeringLabel));
    this.buildings.add(new Building(10, 35, new PVector(0, 0, 255), snellEngineeringLabel));
    this.buildings.add(new Building(9, 35, new PVector(0, 0, 255), snellEngineeringLabel));
    this.buildings.add(new Building(6, 35, new PVector(0, 0, 255), snellEngineeringLabel));
    this.buildings.add(new Building(5, 35, new PVector(0, 0, 255), snellEngineeringLabel));
    this.buildings.add(new Building(4, 35, new PVector(0, 0, 255), snellEngineeringLabel));
    this.buildings.add(new Building(3, 35, new PVector(0, 0, 255), snellEngineeringLabel));
  }
  
  // Path Additions
  
  private void addFtoSE() {
    
    // Forsyth to Snell Engineering
    this.paths.add(new Path(4, 28, grey));
    this.paths.add(new Path(4, 27, grey));
    this.paths.add(new Path(4, 26, grey));
    this.paths.add(new Path(4, 25, grey));
    this.paths.add(new Path(4, 24, grey));
    this.paths.add(new Path(4, 23, grey));
    this.paths.add(new Path(4, 22, grey));
    this.paths.add(new Path(4, 21, grey));
    this.paths.add(new Path(4, 21, grey));
    this.paths.add(new Path(4, 20, grey));
    
    this.paths.add(new Path(3, 28, grey));
    this.paths.add(new Path(3, 27, grey));
    this.paths.add(new Path(3, 26, grey));
    this.paths.add(new Path(3, 25, grey));
    this.paths.add(new Path(3, 24, grey));
    this.paths.add(new Path(3, 23, grey));
    this.paths.add(new Path(3, 22, grey));
    this.paths.add(new Path(3, 21, grey));
    this.paths.add(new Path(3, 20, grey));
    
    this.paths.add(new Path(5, 28, grey));
    this.paths.add(new Path(6, 28, grey));
    this.paths.add(new Path(7, 28, grey));
    
    this.paths.add(new Path(5, 27, grey));
    this.paths.add(new Path(6, 27, grey));
    this.paths.add(new Path(7, 27, grey));
    this.paths.add(new Path(8, 27, grey));
    
    this.paths.add(new Path(8, 28, grey));
    this.paths.add(new Path(8, 29, grey));
    this.paths.add(new Path(8, 30, grey));
    this.paths.add(new Path(8, 31, grey));
    this.paths.add(new Path(8, 32, grey));
    this.paths.add(new Path(8, 33, grey));
    
    this.paths.add(new Path(7, 28, grey));
    this.paths.add(new Path(7, 29, grey));
    this.paths.add(new Path(7, 30, grey));
    this.paths.add(new Path(7, 31, grey));
    this.paths.add(new Path(7, 32, grey));
    this.paths.add(new Path(7, 33, grey));
    
  }
  
  private void addFtoSNE() {
    this.paths.add(new Path(4, 21, grey));
    this.paths.add(new Path(5, 21, grey));
    this.paths.add(new Path(6, 21, grey));
    this.paths.add(new Path(7, 21, grey));
    this.paths.add(new Path(8, 21, grey));
    this.paths.add(new Path(9, 21, grey));
    this.paths.add(new Path(10, 21, grey));
    this.paths.add(new Path(11, 21, grey));
    this.paths.add(new Path(12, 21, grey));
    this.paths.add(new Path(13, 21, grey));
    this.paths.add(new Path(14, 21, grey));
    this.paths.add(new Path(15, 21, grey));
    this.paths.add(new Path(16, 21, grey));
    this.paths.add(new Path(17, 21, grey));
    this.paths.add(new Path(18, 21, grey));
    
    this.paths.add(new Path(5, 20, grey));
    this.paths.add(new Path(6, 20, grey));
    this.paths.add(new Path(7, 20, grey));
    this.paths.add(new Path(8, 20, grey));
    this.paths.add(new Path(9, 20, grey));
    this.paths.add(new Path(10, 20, grey));
    this.paths.add(new Path(11, 20, grey));
    this.paths.add(new Path(12, 20, grey));
    this.paths.add(new Path(13, 20, grey));
    this.paths.add(new Path(14, 20, grey));
    this.paths.add(new Path(15, 20, grey));
    this.paths.add(new Path(16, 20, grey));
    this.paths.add(new Path(17, 20, grey));
    this.paths.add(new Path(18, 20, grey));
  }
}

class Building extends Path { 
  String name;
  
  Building(int x, int y, PVector c, String name) {
    super(x, y, c);
    this.name = name;
  }
  
}

class Path {
  int x;
  int y;
  PVector c;
  
  Path(int x, int y, PVector c) {
    this.x = x;
    this.y = y;
    this.c = c;
  }
  
}
