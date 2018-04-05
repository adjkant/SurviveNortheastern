
public class Drawing {
  
  public Drawing() {}
  
  void drawSquare(int xGrid, int yGrid, PVector c) {
    drawShapeCenter(createShape(RECT, -SQUARE_SIZE/2, -SQUARE_SIZE/2, SQUARE_SIZE, SQUARE_SIZE), 
                    xGrid * SQUARE_SIZE - SQUARE_SIZE/2, 
                    yGrid * SQUARE_SIZE - SQUARE_SIZE/2, 
                    0, 
                    c, c);
  }
  
  // Draw black shape
  void drawShapeCenter(PShape s, int x, int y, int degrees) {
    drawShapeCenter(s, x, y, degrees, 0, 0);
  }

  // Draw shape with given stroke/fill greyscale
  void drawShapeCenter(PShape s, int x, int y, int degrees, int stroke, int fill) {
    PVector stroke3 = new PVector(stroke, stroke, stroke);
    PVector fill3 = new PVector(fill, fill, fill);
    drawShapeCenter(s, x, y, degrees, stroke3, fill3);
  }
  
  // Draw a shape centered on x and y at angle degrees with the given stroke and fill
  void drawShapeCenter(PShape s, int x, int y, int degrees, PVector stroke, PVector fill) {
    stroke(stroke.x, stroke.y, stroke.z);
    fill(fill.x, fill.y, fill.z);
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