int GRID_WIDTH_LINES = 7; //number of vertical lines
int GRID_HEIGHT_LINES = 8; //number of horizontal lines
int GRID_WIDTH_SIZE = (GAME_SIZE / GRID_WIDTH_LINES); // space between vertical lines
int GRID_HEIGHT_SIZE =(GAME_SIZE / GRID_HEIGHT_LINES); // space between horizontal lines

PVector grey = new PVector(193,193,193);
  
class Tunnels {
  HashMap<PVector, ArrayList<PVector>> adjacencyList;
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
    addCH();
    
    this.generateAdjacencyList();
 
  }
  
  boolean isValidMove(PVector loc, PVector newLoc) {
    ArrayList<PVector> validMoves = this.adjacencyList.get(loc);
    return validMoves.contains(newLoc);
  }
  
  ArrayList<PVector> adjacentSpaces(PVector loc) {
    return this.adjacencyList.get(loc);
  }
  
  void generateAdjacencyList() {
    this.adjacencyList = new HashMap<PVector, ArrayList<PVector>>();
    for (Building b : this.buildings) {
      PVector pos = new PVector(b.x, b.y);
      ArrayList<PVector> adj = this.findAdjacentMoves(pos);
      this.adjacencyList.put(pos, adj);
    }
    
    for (Path p : this.paths) {
      PVector pos = new PVector(p.x, p.y);
      ArrayList<PVector> adj = this.findAdjacentMoves(pos);
      this.adjacencyList.put(pos, adj);
    }
  }
  
  private ArrayList<PVector> findAdjacentMoves(PVector position) {
    ArrayList<PVector> results = new ArrayList<PVector>();
    
    // Check buildings
    for (Building b : this.buildings) {
      PVector n =  new PVector(b.x, b.y);
      if (this.isNeighbor(position, n)) {
        results.add(n);
        if (results.size() == 4) {
          return results;
        }
      }
    }
    
    // Check paths
    for (Path p : this.paths) {
      PVector n =  new PVector(p.x, p.y);
      if (this.isNeighbor(position, n)) {
        results.add(n);
        if (results.size() == 4) {
          return results;
        }
      }
    }
    
    return results;
  }
  
  private boolean isNeighbor(PVector a, PVector b) {
    return (abs(a.x - b.x) == 0 && abs(a.y - b.y) == 1) || (abs(a.x - b.x) == 1 && abs(a.y - b.y) == 0);
  }
  
  void drawTunnels() {
    drawBuildings();
    drawPaths();
  }
  
  void drawBuildings() {
    for (Building b : this.buildings) {
      this.drawer.drawSquare(b.s, b.x, b.y);
      //text(b.name, 50, 50);
    }
  }
  
  void drawPaths() {
    for (Path p : this.paths) {
      this.drawer.drawSquare(p.s, p.x, p.y);
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
      String churchLabel = "CH";
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
      String haydenLabel = "CU";
      
      PVector blue = new PVector(250, 2, 2);
      
      this.buildings.add(new Building(32, 28, blue, haydenLabel));
      this.buildings.add(new Building(31, 28, blue, haydenLabel));
      this.buildings.add(new Building(32, 29, blue, haydenLabel));
      this.buildings.add(new Building(31, 29, blue, haydenLabel));
    
   }
   
   private void addEll() {
      String haydenLabel = "EL";
      
      PVector blue = new PVector(137, 215, 255);
      
      this.buildings.add(new Building(32, 13, blue, haydenLabel));
      this.buildings.add(new Building(32, 12, blue, haydenLabel));
      this.buildings.add(new Building(31, 13, blue, haydenLabel));
      this.buildings.add(new Building(31, 12, blue, haydenLabel));
    
   }
   
   private void addDodge() {
      String haydenLabel = "DO";
      
      PVector blue = new PVector(137, 215, 255);
      
      this.buildings.add(new Building(40, 5, blue, haydenLabel));
      this.buildings.add(new Building(39, 5, blue, haydenLabel));
      this.buildings.add(new Building(39, 4, blue, haydenLabel));
      this.buildings.add(new Building(40, 4, blue, haydenLabel));
    
   }
   private void addMugar() {
      String haydenLabel = "MU";
      
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
  
  private void addCH() {
    //add churchill
    this.paths.add(new Path(12, 22, grey));
    this.paths.add(new Path(13, 22, grey));
    
    //add snell
    this.paths.add(new Path(20, 31, grey));
    this.paths.add(new Path(21, 30, grey));
    this.paths.add(new Path(20, 30, grey));
    this.paths.add(new Path(21, 31, grey));
    this.paths.add(new Path(21, 29, grey));
    this.paths.add(new Path(20, 29, grey));
    this.paths.add(new Path(21, 28, grey));
    this.paths.add(new Path(20, 28, grey));
    this.paths.add(new Path(21, 27, grey));
    this.paths.add(new Path(21, 26, grey));
    this.paths.add(new Path(21, 25, grey));
    this.paths.add(new Path(21, 24, grey));
    this.paths.add(new Path(21, 23, grey));
    this.paths.add(new Path(21, 22, grey));
    this.paths.add(new Path(21, 21, grey));
    this.paths.add(new Path(21, 20, grey));
    this.paths.add(new Path(20, 27, grey));
    this.paths.add(new Path(20, 26, grey));
    this.paths.add(new Path(20, 25, grey));
    this.paths.add(new Path(20, 24, grey));
    this.paths.add(new Path(20, 23, grey));
    this.paths.add(new Path(20, 22, grey));
    this.paths.add(new Path(20, 21, grey));
    this.paths.add(new Path(20, 20, grey));
    this.paths.add(new Path(19, 20, grey));
    this.paths.add(new Path(19, 21, grey));
    
    //addHayden
    this.paths.add(new Path(20, 19, grey));
    this.paths.add(new Path(20, 18, grey));
    this.paths.add(new Path(20, 17, grey));
    this.paths.add(new Path(20, 16, grey));
    this.paths.add(new Path(20, 15, grey));
    this.paths.add(new Path(21, 19, grey));
    this.paths.add(new Path(21, 18, grey));
    this.paths.add(new Path(21, 17, grey));
    this.paths.add(new Path(21, 16, grey));
    this.paths.add(new Path(21, 15, grey));
    
    this.paths.add(new Path(22, 15, grey));
    this.paths.add(new Path(23, 15, grey));
    this.paths.add(new Path(24, 15, grey));
    this.paths.add(new Path(24, 16, grey));
    this.paths.add(new Path(25, 15, grey));
    this.paths.add(new Path(25, 16, grey));

    this.paths.add(new Path(25, 14, grey));
    this.paths.add(new Path(25, 13, grey));
    this.paths.add(new Path(25, 12, grey));
    this.paths.add(new Path(24, 14, grey));
    this.paths.add(new Path(24, 13, grey));
    this.paths.add(new Path(24, 12, grey));
    
    this.paths.add(new Path(23, 13, grey));
    this.paths.add(new Path(22, 13, grey));
    this.paths.add(new Path(21, 13, grey));
    this.paths.add(new Path(20, 13, grey));
    this.paths.add(new Path(19, 13, grey));
    this.paths.add(new Path(18, 13, grey));
    this.paths.add(new Path(17, 13, grey));
    this.paths.add(new Path(16, 13, grey));
    this.paths.add(new Path(15, 13, grey));
    this.paths.add(new Path(14, 13, grey));
    this.paths.add(new Path(23, 12, grey));
    this.paths.add(new Path(22, 12, grey));
    this.paths.add(new Path(21, 12, grey));
    this.paths.add(new Path(20, 12, grey));
    this.paths.add(new Path(19, 12, grey));
    this.paths.add(new Path(18, 12, grey));
    this.paths.add(new Path(17, 12, grey));
    this.paths.add(new Path(16, 12, grey));
    this.paths.add(new Path(15, 12, grey));
    this.paths.add(new Path(14, 12, grey));
    
    //add ell
    this.paths.add(new Path(26, 12, grey));
    this.paths.add(new Path(27, 12, grey));
    this.paths.add(new Path(28, 12, grey));
    this.paths.add(new Path(29, 12, grey));
    this.paths.add(new Path(30, 12, grey));
    this.paths.add(new Path(26, 13, grey));
    this.paths.add(new Path(27, 13, grey));  
    this.paths.add(new Path(28, 13, grey));
    this.paths.add(new Path(29, 13, grey));
    this.paths.add(new Path(30, 13, grey));
    
    //add curry
    this.paths.add(new Path(31, 14, grey));
    this.paths.add(new Path(31, 15, grey));
    this.paths.add(new Path(31, 16, grey));
    this.paths.add(new Path(31, 17, grey));
    this.paths.add(new Path(31, 18, grey));
    this.paths.add(new Path(31, 19, grey)); 
    this.paths.add(new Path(31, 20, grey)); 
    this.paths.add(new Path(31, 21, grey)); 
    this.paths.add(new Path(31, 22, grey)); 
    this.paths.add(new Path(31, 23, grey)); 
    this.paths.add(new Path(31, 24, grey)); 
    this.paths.add(new Path(31, 25, grey)); 
    this.paths.add(new Path(31, 26, grey)); 
    this.paths.add(new Path(31, 27, grey)); 
    this.paths.add(new Path(32, 14, grey));
    this.paths.add(new Path(32, 15, grey));
    this.paths.add(new Path(32, 16, grey));
    this.paths.add(new Path(32, 17, grey));
    this.paths.add(new Path(32, 18, grey));
    this.paths.add(new Path(32, 19, grey)); 
    this.paths.add(new Path(32, 20, grey)); 
    this.paths.add(new Path(32, 21, grey)); 
    this.paths.add(new Path(32, 22, grey)); 
    this.paths.add(new Path(32, 23, grey)); 
    this.paths.add(new Path(32, 24, grey)); 
    this.paths.add(new Path(32, 25, grey)); 
    this.paths.add(new Path(32, 26, grey)); 
    this.paths.add(new Path(32, 27, grey)); 


    // add Mugar
    this.paths.add(new Path(33, 12, grey));
    this.paths.add(new Path(34, 12, grey));
    this.paths.add(new Path(35, 12, grey));
    this.paths.add(new Path(36, 12, grey));
    this.paths.add(new Path(33, 13, grey));
    this.paths.add(new Path(34, 13, grey));  
    this.paths.add(new Path(35, 13, grey));
    this.paths.add(new Path(36, 13, grey));
    this.paths.add(new Path(38, 13, grey));
    this.paths.add(new Path(38, 12, grey));
    
     
    this.paths.add(new Path(37, 12, grey));
    this.paths.add(new Path(37, 13, grey));
    this.paths.add(new Path(37, 14, grey));
    this.paths.add(new Path(37, 15, grey));
    this.paths.add(new Path(37, 16, grey));
    this.paths.add(new Path(37, 17, grey));
    this.paths.add(new Path(37, 18, grey));    
    this.paths.add(new Path(38, 12, grey));
    this.paths.add(new Path(38, 13, grey));
    this.paths.add(new Path(38, 14, grey));
    this.paths.add(new Path(38, 15, grey));
    this.paths.add(new Path(38, 16, grey));
    this.paths.add(new Path(38, 17, grey));
    this.paths.add(new Path(38, 18, grey));
    
    // add richard
    this.paths.add(new Path(26, 11, grey));
    this.paths.add(new Path(26, 10, grey));
    this.paths.add(new Path(26, 9, grey));
    this.paths.add(new Path(26, 8, grey));
    this.paths.add(new Path(26, 7, grey));
    this.paths.add(new Path(26, 6, grey));
    this.paths.add(new Path(26, 5, grey));
    this.paths.add(new Path(26, 4, grey));   
    this.paths.add(new Path(27, 11, grey));
    this.paths.add(new Path(27, 10, grey));
    this.paths.add(new Path(27, 9, grey));
    this.paths.add(new Path(27, 8, grey));
    this.paths.add(new Path(27, 7, grey));
    this.paths.add(new Path(27, 6, grey));
    this.paths.add(new Path(27, 5, grey));
    this.paths.add(new Path(27, 4, grey));
    
    // add dodge
    this.paths.add(new Path(38, 11, grey));
    this.paths.add(new Path(38, 10, grey));
    this.paths.add(new Path(38, 9, grey));
    this.paths.add(new Path(38, 8, grey));
    this.paths.add(new Path(38, 7, grey));
    this.paths.add(new Path(38, 6, grey));
    this.paths.add(new Path(38, 5, grey));
    this.paths.add(new Path(38, 4, grey));
    this.paths.add(new Path(37, 11, grey));
    this.paths.add(new Path(37, 10, grey));
    this.paths.add(new Path(37, 9, grey));
    this.paths.add(new Path(37, 8, grey));
    this.paths.add(new Path(37, 7, grey));
    this.paths.add(new Path(37, 6, grey));
    this.paths.add(new Path(37, 5, grey));
    this.paths.add(new Path(37, 4, grey));
        

    

}
  
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
  PShape s;
  
  Path(int x, int y, PVector c) {
    this.x = x;
    this.y = y;
    stroke(c.x, c.y, c.z);
    fill(c.x, c.y, c.z);
    this.s = createShape(RECT, -SQUARE_SIZE/2, -SQUARE_SIZE/2, SQUARE_SIZE, SQUARE_SIZE);
  }
  
}