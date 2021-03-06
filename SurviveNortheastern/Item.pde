

class Item {
  String name;
  int x;
  int y;
  PShape s;
  
  Item(String name, int x, int y, PVector c) {
    this.name = name;
    this.x = x;
    this.y = y;
    fill(c.x, c.y, c.z);
    stroke(0, 0, 0);
    this.s = createShape(ELLIPSE, -SQUARE_SIZE/2, -SQUARE_SIZE/2, PLAYER_SIZE, PLAYER_SIZE);
  }
  
  Item(String name, int x, int y, PShape s) {
    this.name = name;
    this.x = x;
    this.y = y;
    this.s = s;
  }
  
  void drawItem() {
    drawShapeCenter(this.s, this.x * SQUARE_SIZE, this.y * SQUARE_SIZE, 0);
  }
  
}
  