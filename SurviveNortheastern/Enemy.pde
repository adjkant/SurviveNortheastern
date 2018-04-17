

class Enemy {
  int x;
  int y;
  Task behaviorTree;
  PShape enemyShape;
  
  int actTimer;
  int actRate;
  
  Enemy() {}
  
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
    this.behaviorTree.execute(l, this);
  }
  
  void drawEnemy() {
    drawShapeCenter(this.enemyShape, (int) this.x * SQUARE_SIZE, (int) this.y * SQUARE_SIZE, 0);
  }
}

class ProfessorEnemy extends Enemy {
  ProfessorEnemy(int x, int y, int speed, int range, float hurtPower, float slowPower) {
    super(x, y, new ProfessorBehavior(range, hurtPower, slowPower), speed);
    fill(147, 165, 101);
    stroke(0);
    this.enemyShape = createShape(ELLIPSE, -SQUARE_SIZE/2, -SQUARE_SIZE/2, PLAYER_SIZE, PLAYER_SIZE);
  }
}

class HuskyEnemy extends Enemy {
  HuskyEnemy(int x, int y, float bitePower) {
    super(x, y, new HuskyBehavior(bitePower), 15);
    fill(181);
    stroke(0);
    this.enemyShape = createShape(ELLIPSE, -SQUARE_SIZE/2, -SQUARE_SIZE/2, PLAYER_SIZE, PLAYER_SIZE);
  }
}

class NUWaveEnemy extends Enemy {
  NUWaveEnemy(int x, int y, int range, float power) {
    super(x, y, new NUWaveBehavior(range, power), 3);
    fill(255, 241, 48);
    stroke(0);
    this.enemyShape = createShape(ELLIPSE, -SQUARE_SIZE/2, -SQUARE_SIZE/2, PLAYER_SIZE, PLAYER_SIZE);
  }
}

class RAEnemy extends  Enemy {
  RAEnemy(int x, int y, int range, int powerRange, float power1, float power2, float power3) {
    super(x, y, new RABehavior(range, powerRange, power1, power2, power3), 30);
    fill(255, 0, 0);
    stroke(255);
    this.enemyShape = createShape(ELLIPSE, -SQUARE_SIZE/2, -SQUARE_SIZE/2, PLAYER_SIZE, PLAYER_SIZE);
  }
}

class DragaounEnemy extends Enemy {
  DragaounEnemy(int x, int y, int range, float power, int speed, int powerFrequency) {
    super(x, y, new DragaounBehavior(range, power, powerFrequency), speed);
    fill(0, 255, 0);
    stroke(0);
    this.enemyShape = createShape(ELLIPSE, -SQUARE_SIZE/2, -SQUARE_SIZE/2, PLAYER_SIZE, PLAYER_SIZE);
  }
}