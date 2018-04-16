

abstract class Enemy {
  int x;
  int y;
  Task behaviorTree;
  PShape enemyShape;
  
  int actTimer;
  int actRate;
  
  Enemy(int x, int y, Task behavior, int actRate) {
    this.x = x;
    this.y = y;
    this.behaviorTree = behavior;
    this.actRate = actRate;
    this.actTimer = 0;
  }
  
  Enemy(Task behavior) {
    this.behaviorTree = behavior;
    this.x = 0;
    this.y = 0;
  }
  
  void act(Level l) {
    if (this.actTimer >= this.actRate) {
      this.behaviorTree.execute(l, this);
      this.actTimer = 0;
    } else {
      this.actTimer += 1;
    }
  }
  
  abstract void powers(Level l);
  
  void drawEnemy() {
    new Drawing().drawShapeCenter(this.enemyShape, (int) this.x * SQUARE_SIZE, (int) this.y * SQUARE_SIZE, 0);
  }
}

class ProfessorEnemy extends Enemy {
  
  ProfessorEnemy(int x, int y) {
    super(x, y, new ProfessorBehavior(), 20);
    fill(0, 255, 0);
    stroke(0, 0, 0);
    this.enemyShape = createShape(ELLIPSE, -SQUARE_SIZE/2, -SQUARE_SIZE/2, PLAYER_SIZE, PLAYER_SIZE);
  }
  
  void powers(Level l) {
    
  }
}