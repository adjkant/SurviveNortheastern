int GRID_WIDTH_LINES = 7; //number of vertical lines
int GRID_HEIGHT_LINES = 8; //number of horizontal lines
int GRID_WIDTH_SIZE = (GAME_SIZE / GRID_WIDTH_LINES); // space between vertical lines
int GRID_HEIGHT_SIZE =(GAME_SIZE / GRID_HEIGHT_LINES); // space between horizontal lines

int SQUARE_SIZE = 20;
int NUM_SQUARES_LENGTH = GAME_SIZE / SQUARE_SIZE; 

PVector grey = new PVector(193,193,193);
  
class Tunnels {
  HashMap<PVector, ArrayList<PVector>> adjacencyList;
  ArrayList<Building> buildings;
  ArrayList<Path> paths;
  Drawing drawer;
 
  Tunnels() {
    this.drawer = new Drawing();
    
    this.buildings = new ArrayList<Building>();
    addAllBuildings();
    
    this.paths = new ArrayList<Path>();
    addAllPaths();
    
    this.generateAdjacencyList();
 
  }
  
  boolean isValidMove(PVector loc, PVector newLoc) {
    ArrayList<PVector> validMoves = this.adjacencyList.get(loc);
    return validMoves.contains(newLoc);
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
      this.drawer.drawSquare(b.x, b.y, b.c);
      //text(b.name, 50, 50);
    }
  }
  
  void drawPaths() {
    for (Path p : this.paths) {
      this.drawer.drawSquare(p.x, p.y, p.c);
    }
  }
  
  void addAllBuildings() {
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
  }
  
  void addAllPaths() {
    addFtoSE();
    addFtoSNE();
    addCH();
  }
  // Building Additions
  
  private void addBuilding(int x, int y, PVector buildingColor, String label) {
    this.buildings.add(new Building(x, y, buildingColor, label));
    this.buildings.add(new Building(x + 1, y, buildingColor, label));    
    this.buildings.add(new Building(x, y + 1, buildingColor, label));
    this.buildings.add(new Building(x + 1, y + 1, buildingColor, label));

  }
  private void addForsyth() {
    String forsythLabel = "F";
    PVector forColor = new PVector(0, 255, 0);
    addBuilding(1, 23, forColor, forsythLabel);
  }
  
    private void addCabot() {
      String cabotLabel = "CA";
      PVector orange = new PVector (255,165,0);
      addBuilding(12, 12, orange, cabotLabel);
  }
  
    private void addChurchill() {
      String churchLabel = "CH";
      PVector orange = new PVector (255,105,0);
      addBuilding(12, 23, orange, churchLabel);
  }
  
   private void addSnell() {
    String snellLabel = "SE";
    PVector blue = new PVector(66, 134, 244);
    addBuilding(20, 32, blue, snellLabel);
   }
   
    private void addHayden() {
      String haydenLabel = "HA";     
      PVector blue = new PVector(194, 137, 255);
      addBuilding(24, 17, blue, haydenLabel);
   }
   
   private void addRichard() {
      String haydenLabel = "RI";
      PVector blue = new PVector(137, 215, 255);
      addBuilding(24, 4, blue, haydenLabel);    
   }
   
      private void addCurry() {
      String haydenLabel = "CU";     
      PVector blue = new PVector(250, 2, 2);
      addBuilding(31, 28, blue, haydenLabel);   
   }
   
   private void addEll() {
      String haydenLabel = "EL";     
      PVector blue = new PVector(137, 215, 255);
      addBuilding(31, 12, blue, haydenLabel);
   }
   
   private void addDodge() {
      String haydenLabel = "DO";     
      PVector blue = new PVector(137, 215, 255);
      addBuilding(39, 4, blue, haydenLabel);    
   }
   private void addMugar() {
      String haydenLabel = "MU";      
      PVector blue = new PVector(76, 34, 1);
      addBuilding(39, 17, blue, haydenLabel);    
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
  
  private void addVerticalPath(int topLeft, int bottomLeft, int x) {
    for(int i = topLeft; i <= bottomLeft; i++) {
      this.paths.add(new Path(x, i, grey));
      this.paths.add(new Path(x + 1 , i, grey));
    }
  }
  
  private void addHorizontalPath(int bottomLeft, int bottomRight, int y) {
    for(int i = bottomLeft; i <= bottomRight; i++) {
      this.paths.add(new Path(i, y - 1, grey));
      this.paths.add(new Path(i, y, grey));
    }
  }
  
  private void addSnellEngineering() {
    String snellEngineeringLabel = "SE";
    
    PVector blue = new PVector (0, 0, 255);
    addBuilding(7, 34, blue, snellEngineeringLabel);
    addBuilding(7, 36, blue, snellEngineeringLabel);
    addBuilding(7, 38, blue, snellEngineeringLabel);
    addBuilding(3, 35, blue, snellEngineeringLabel);
    addBuilding(5, 35, blue, snellEngineeringLabel);
    addBuilding(7, 35, blue, snellEngineeringLabel);
    addBuilding(9, 35, blue, snellEngineeringLabel);
    addBuilding(11, 35, blue, snellEngineeringLabel);

    this.buildings.add(new Building(8, 40, blue, snellEngineeringLabel));
    this.buildings.add(new Building(7, 40, blue, snellEngineeringLabel));
   
  }
  
  // Path Additions
  
  private void addCH() {
    //add churchill
    addHorizontalPath(12, 13, 22);
    
    //add snell
    addVerticalPath(20, 31, 20);
    
    //addHayden
    addVerticalPath(15, 19, 20);
    addHorizontalPath(21, 25, 16);
    addVerticalPath(12, 14, 24);
    addHorizontalPath(14, 23, 13);
   
    //add ell
    addHorizontalPath(26, 30, 13);
    
    //add curry
    addVerticalPath(14, 27, 31);


    // add Mugar
    addHorizontalPath(33, 38, 13);
    addVerticalPath(12, 18, 37);
    
    // add richard
    addVerticalPath(4, 11, 26);
    
    // add dodge
    addVerticalPath(4, 11, 37);
}
  
  private void addFtoSE() {   
    // Forsyth to Snell Engineering
    addVerticalPath(20, 28, 3);
    addHorizontalPath(5, 8, 28);
    addVerticalPath(28, 33, 7);
  }
  
  private void addFtoSNE() {
    addHorizontalPath(4, 19, 21);
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
