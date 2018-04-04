
class Tunnels {
  
  int GRID_WIDTH_LINES = 7; //number of vertical lines
  int GRID_HEIGHT_LINES = 8; //number of horizontal lines
  int GRID_WIDTH_SIZE = (GAME_SIZE / GRID_WIDTH_LINES); // space between vertical lines
  int GRID_HEIGHT_SIZE =(GAME_SIZE / GRID_HEIGHT_LINES); // space between horizontal lines
 
  public Tunnels() {}
  
  public void drawTunnels() {
    drawGrid();
    drawForsyth();
  }
  
  //public void drawForsyth(){
  //  new Drawing().drawBuilding(1 * GRID_HEIGHT_SIZE,
  //                             5 * GRID_WIDTH_SIZE);
  //}

    public void drawCabot(){
    new Drawing().drawBuilding(1 * GRID_HEIGHT_SIZE,
                               5 * GRID_WIDTH_SIZE);
  }
  
    public void drawChurchill(){
    new Drawing().drawBuilding(1 * GRID_HEIGHT_SIZE,
                               5 * GRID_WIDTH_SIZE);
  }
  
    public void drawEgan(){
    new Drawing().drawBuilding(1 * GRID_HEIGHT_SIZE,
                               5 * GRID_WIDTH_SIZE);
  }
  
    public void drawForsyth(){
    new Drawing().drawBuilding(1 * GRID_HEIGHT_SIZE,
                               5 * GRID_WIDTH_SIZE);
  }
  
  
  public void drawGrid() {
    for (int i = 0; i < GRID_WIDTH_LINES; i++) {
       new Drawing().drawVerticalLine(i * GRID_WIDTH_SIZE); 
    }
    
    for (int i = 0; i < GRID_HEIGHT_LINES; i++) {
       new Drawing().drawHorizontalLine(i * GRID_HEIGHT_SIZE); 
    }
        
  }
}