static final int FAIL = 0;
static final int SUCCESS = 1;

abstract class Task {
  abstract int execute(Game g);  // returns FAIL = 0, SUCCESS = 1
}

abstract class Predicate {
  abstract boolean evaluate(Game g); // returns if predicate is true  
  
}