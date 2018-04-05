
public class Drawing {
  
  public Drawing() {}
  
  void drawSquare(int xGrid, int yGrid, PVector c) {
    stroke(c.x, c.y, c.z);
    fill(c.x, c.y, c.z);
    drawShapeCenter(createShape(RECT, -SQUARE_SIZE/2, -SQUARE_SIZE/2, SQUARE_SIZE, SQUARE_SIZE), 
                    xGrid * SQUARE_SIZE - SQUARE_SIZE/2, 
                    yGrid * SQUARE_SIZE - SQUARE_SIZE/2, 
                    0);
  }
  
  // Draw a shape centered on x and y at angle degrees
  void drawShapeCenter(PShape s, int x, int y, int degrees) {
    pushMatrix();
    translate(x, y);
    rotate(radians(degrees));
    shape(s);
    popMatrix();
  }
  
  void drawVerticalLine(int pos) {   
    line(pos, GAME_SIZE, pos, 0);
  }
  void drawHorizontalLine(int pos) {   
    line(GAME_SIZE, pos, 0, pos);
  }
  
  void drawBuilding(int x, int y) {
    fill(255,200,200);
    ellipse(x, y, 20, 20);
  }
}