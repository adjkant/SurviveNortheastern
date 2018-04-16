static final int FAIL = 0;
static final int SUCCESS = 1;

abstract class Task {
  abstract int execute(Level l, Enemy e);  // returns FAIL = 0, SUCCESS = 1
}

abstract class Predicate {
  abstract boolean evaluate(Level l, Enemy e); // returns if predicate is true  
  
}