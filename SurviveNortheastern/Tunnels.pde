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
  
  private void addSnellEngineering() {
    String snellEngineeringLabel = "SE";
    
    this.buildings.add(new Building(8, 34, new PVector(0, 0, 255), snellEngineeringLabel));
    this.buildings.add(new Building(8, 35, new PVector(0, 0, 255), snellEngineeringLabel));
    this.buildings.add(new Building(8, 36, new PVector(0, 0, 255), snellEngineeringLabel));
    this.buildings.add(new Building(8, 37, new PVector(0, 0, 255), snellEngineeringLabel));
    this.buildings.add(new Building(8, 38, new PVector(0, 0, 255), snellEngineeringLabel));
    this.buildings.add(new Building(8, 39, new PVector(0, 0, 255), snellEngineeringLabel));
    this.buildings.add(new Building(8, 40, new PVector(0, 0, 255), snellEngineeringLabel));
    
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