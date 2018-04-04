class Selector extends Task {
  ArrayList<Task> options;
  
  Selector(ArrayList<Task> options) {
    this.options = options;
  }
  
  int execute(Game g) {
    int result = FAIL;
    int option = 0;
    while (result == FAIL && option < this.options.size()) {
      result = this.options.get(option).execute(g);
      option += 1;
    }

    return result;
  }
}

class Sequence extends Task {
  ArrayList<Task> tasks;
  
  Sequence(ArrayList<Task> tasks) {
    this.tasks = tasks;
  }
  
  int execute(Game g) {
    int option = 0;
    while (option < this.tasks.size()) {
      int result = this.tasks.get(option).execute(g);
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
  
  int execute(Game g) {
    if (this.pred.evaluate(g)) {
      return trueTask.execute(g);
    } else {
      return falseTask.execute(g);
    }
  }
}