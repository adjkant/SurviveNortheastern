static final int FAIL = 0;
static final int SUCCESS = 1;

abstract class Task {
  abstract int execute(Level l, Enemy e);  // returns FAIL = 0, SUCCESS = 1
}

class Selector extends Task {
  ArrayList<Task> options;
  
  Selector(ArrayList<Task> options) {
    this.options = options;
  }
  
  int execute(Level l, Enemy e) {
    int result = FAIL;
    int option = 0;
    while (result == FAIL && option < this.options.size()) {
      result = this.options.get(option).execute(l, e);
      option += 1;
    }

    return result;
  }
}

class RandomSelector extends Task {
  ArrayList<Task> options;
  
  RandomSelector(ArrayList<Task> options) {
    this.options = options;
  }
  
  int execute(Level l, Enemy e) {
    return this.options.get((int) (Math.random() * this.options.size())).execute(l, e);
  }
}

class Sequence extends Task {
  ArrayList<Task> tasks;
  
  Sequence(ArrayList<Task> tasks) {
    this.tasks = tasks;
  }
  
  int execute(Level l, Enemy e) {
    int option = 0;
    while (option < this.tasks.size()) {
      int result = this.tasks.get(option).execute(l, e);
      if (result == FAIL) {
        return FAIL;
      }
      option += 1;
    }

    return SUCCESS;
  }
}

class Condition extends Task {
  Predicate pred;
  Task trueTask;
  Task falseTask;
  
  Condition(Predicate pred, Task trueTask, Task falseTask) {
    this.pred = pred;
    this.trueTask = trueTask;
    this.falseTask = falseTask;
  }
  
  int execute(Level l, Enemy e) {
    if (this.pred.evaluate(l, e)) {
      return trueTask.execute(l, e);
    } else {
      return falseTask.execute(l, e);
    }
  }
}