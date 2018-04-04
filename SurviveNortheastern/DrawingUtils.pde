
public class Drawing {
  
  public Drawing() {}
  
  // Draw black shape
  void drawShapeCenter(PShape s, int x, int y, int degrees) {
    drawShapeCenter(s, x, y, degrees, 0, 0);
  }

  // Draw shape with given stroke/fill greyscale
  void drawShapeCenter(PShape s, int x, int y, int degrees, int stroke, int fill) {
    int[] stroke3 = {stroke, stroke, stroke};
    int[] fill3 = {fill, fill, fill};
    drawShapeCenter(s, x, y, degrees, stroke3, fill3);
  }
  
  // Draw a shape centered on x and y at angle degrees with the given stroke and fill
  void drawShapeCenter(PShape s, int x, int y, int degrees, int[] stroke, int[] fill) {
    stroke(stroke[0], stroke[1], stroke[2]);
    fill(fill[0], fill[1], fill[2]);
    pushMatrix();
    translate(x, y);
    rotate(radians(degrees));
    shape(s);
    popMatrix();
  }
  
  public void drawVerticalLine(int pos) {   
    line(pos, GAME_SIZE, pos, 0);
  }
  
  public void drawHorizontalLine(int pos) {   
    line(GAME_SIZE, pos, 0, pos);
  }
}
