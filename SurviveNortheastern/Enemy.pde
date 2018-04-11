

class Enemy {
  int x;
  int y;
  Task behaviorTree;

  Enemy(Task behavior, int x, int y) {
    this.behaviorTree = behavior;
    this.x = x;
    this.y = y;
  }

  Enemy(Task behavior) {
    this.behaviorTree = behavior;
    this.x = 0;
    this.y = 0;
  }

  void act(Game g) {
    this.behaviorTree.execute(g);
  }
}
