

class Item {
  int x;
  int y;
  PShape s;
  
  Item(int x, int y, PVector c) {
    this.x = x;
    this.y = y;
    fill(c.x, c.y, c.z);
    stroke(0, 0, 0);
    this.s = createShape(ELLIPSE, -SQUARE_SIZE/2, -SQUARE_SIZE/2, PLAYER_SIZE, PLAYER_SIZE);
  }
  
  void drawItem() {
    new Drawing().drawShapeCenter(this.s, this.x * SQUARE_SIZE, this.y * SQUARE_SIZE, 0);
  }
  
}
  