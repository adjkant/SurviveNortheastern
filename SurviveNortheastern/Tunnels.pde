
class Tunnels {
  
  int GRID_WIDTH_SIZE = 28; // space between vertical lines
  int GRID_HEIGHT_SIZE = 28; // space between horizontal lines
  int GRID_WIDTH_LINES = (GAME_SIZE / GRID_WIDTH_SIZE); //number of vertical lines
  int GRID_HEIGHT_LINES = (GAME_SIZE / GRID_HEIGHT_SIZE); //number of horizontal lines
  
  public Tunnels() {}
  
  public void drawTunnels() {
    
    for (int i = 0; i < GRID_WIDTH_LINES; i++) {
       new Drawing().drawVerticalLine(i * GRID_WIDTH_SIZE); 
    }
    
    for (int i = 0; i < GRID_HEIGHT_LINES; i++) {
       new Drawing().drawHorizontalLine(i * GRID_HEIGHT_SIZE); 
    }
        
  }
  
  
}
