

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
  
  void drawEnemy() {
    new Drawing().drawShapeCenter(this.enemyShape, (int) this.x * SQUARE_SIZE, (int) this.y * SQUARE_SIZE, 0);
  }
}

class ProfessorEnemy extends Enemy {
  ProfessorEnemy(int x, int y) {
    super(x, y, new ProfessorBehavior(), 80);
    fill(147, 165, 101);
    stroke(0);
    this.enemyShape = createShape(ELLIPSE, -SQUARE_SIZE/2, -SQUARE_SIZE/2, PLAYER_SIZE, PLAYER_SIZE);
  }
}

class HuskyEnemy extends Enemy {
  HuskyEnemy(int x, int y) {
    super(x, y, new HuskyBehavior(), 15);
    fill(181);
    stroke(0);
    this.enemyShape = createShape(ELLIPSE, -SQUARE_SIZE/2, -SQUARE_SIZE/2, PLAYER_SIZE, PLAYER_SIZE);
  }
}

class NUWaveEnemy extends Enemy {
  NUWaveEnemy(int x, int y) {
    super(x, y, new NUWaveBehavior(), 5);
    fill(255, 241, 48);
    stroke(0);
    this.enemyShape = createShape(ELLIPSE, -SQUARE_SIZE/2, -SQUARE_SIZE/2, PLAYER_SIZE, PLAYER_SIZE);
  }
}

class RAEnemy extends  Enemy {
  RAEnemy(int x, int y) {
    super(x, y, new RABehavior(), 20);
    fill(255, 0, 0);
    stroke(255);
    this.enemyShape = createShape(ELLIPSE, -SQUARE_SIZE/2, -SQUARE_SIZE/2, PLAYER_SIZE, PLAYER_SIZE);
  }
}

class DragaounEnemy extends Enemy {
  DragaounEnemy(int x, int y) {
    super(x, y, new DragaounBehavior(), 40);
    fill(0, 255, 0);
    stroke(0);
    this.enemyShape = createShape(ELLIPSE, -SQUARE_SIZE/2, -SQUARE_SIZE/2, PLAYER_SIZE, PLAYER_SIZE);
  }
}