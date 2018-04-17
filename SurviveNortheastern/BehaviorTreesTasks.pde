class ProfessorBehavior extends Task {
  Task behavior;
  
  ProfessorBehavior(int range, float hurtPower, float slowPower) {
    
    ArrayList<Task> seq = new ArrayList<Task>();
    seq.add(new ActTimerTick());
    seq.add(new RangeHurt(range, hurtPower));
    seq.add(new RangeSlow(range, slowPower));
    seq.add(new Condition(new InSight(), new MoveToPlayer(0), new RandomMove(0)));
    this.behavior = new Sequence(seq);
  }
  
  int execute(Level l, Enemy e) {
    return this.behavior.execute(l, e);
  }
}

class HuskyBehavior extends Task {
  Task behavior;
  
  HuskyBehavior(float bitePower) {
    
    ArrayList<Task> seq = new ArrayList<Task>();
    seq.add(new ActTimerTick());
    seq.add(new Condition(new WithinDistance(15), new AStarMove(0), new RandomMove(0)));
    seq.add(new NextToHurt(0, bitePower));
    this.behavior = new Sequence(seq);
  }
  
  int execute(Level l, Enemy e) {
    return this.behavior.execute(l, e);
  }
}

class NUWaveBehavior extends Task {
  int execute(Level l, Enemy e) {
    ArrayList<PVector> possibleMoves = l.tunnels.adjacentSpaces(new PVector(e.x, e.y));
    if (possibleMoves != null) {
      PVector selectedMove = possibleMoves.get((int) (Math.random() * possibleMoves.size()));
      e.x = (int)selectedMove.x;
      e.y = (int)selectedMove.y;
      return SUCCESS;
    } else {
      return FAIL;
    }
  }
}

class RABehavior extends Task {
  Task behavior;
  
  RABehavior(int range, int hurtRange, float hurtPower1, float hurtPower2, float hurtPower3) {
    
    ArrayList<Task> hurts = new ArrayList<Task>();
    hurts.add(new RangeHurt(0, hurtRange, hurtPower1));
    hurts.add(new RangeHurt(0, hurtRange, hurtPower2));
    hurts.add(new RangeHurt(0, hurtRange, hurtPower3));
    
    ArrayList<Task> seq = new ArrayList<Task>();
    seq.add(new ActTimerTick());
    seq.add(new Condition(new OrPredicate(new InSight(), new WithinDistance(range)), new MoveToPlayer(0), new RandomMove(0)));
    seq.add(new RandomSelector(hurts));
    this.behavior = new Sequence(seq);
  }
  
  int execute(Level l, Enemy e) {
    return this.behavior.execute(l, e);
  }
}

class DragaounBehavior extends Task {
  Task behavior;
  
  DragaounBehavior(int range, float power, int powerFrequency) {
    
    ArrayList<Task> seq = new ArrayList<Task>();
    seq.add(new ActTimerTick());
    seq.add(new RangeHurtMod(powerFrequency, range, power));
    seq.add(new AStarMove(0));
    this.behavior = new Sequence(seq);
  }
  
  int execute(Level l, Enemy e) {
    return this.behavior.execute(l, e);
  }
}



class ActTimerTick extends Task {
  int execute(Level l, Enemy e) {
    if (e.actTimer >= e.actRate) {
      e.actTimer = 0;
    } else {
      e.actTimer += 1;
    }
    
    return SUCCESS;
  }
}

class RandomMove extends Task {
  int moveTick;
  
  RandomMove(int moveTick) {
    this.moveTick = moveTick;
  }
  
  int execute(Level l, Enemy e) {
    if (e.actTimer == this.moveTick) {
      ArrayList<PVector> possibleMoves = l.freeSpaces(l.tunnels.adjacentSpaces(new PVector(e.x, e.y)));
      if (possibleMoves != null) {
        PVector selectedMove = possibleMoves.get((int) (Math.random() * possibleMoves.size()));
        e.x = (int)selectedMove.x;
        e.y = (int)selectedMove.y;
        return SUCCESS;
      } else {
        return FAIL;
      }
    }
    return SUCCESS;
  }
}

class MoveToPlayer extends Task {
  int moveTick;
  
  MoveToPlayer(int moveTick) {
    this.moveTick = moveTick;
  }
  
  int execute(Level l, Enemy e) {
    if (e.actTimer == this.moveTick) {
      ArrayList<PVector> possibleMoves = l.freeSpaces(l.tunnels.adjacentSpaces(new PVector(e.x, e.y)));
      PVector selectedMove = new PVector(e.x, e.y);
      for (PVector m : possibleMoves) {
        if (manhattanDistance(l.playerLocation, m) < manhattanDistance(l.playerLocation, selectedMove)) {
          selectedMove = m;
        }
      }
      
      // Move Player to closest position
      e.x = (int)selectedMove.x;
      e.y = (int)selectedMove.y;
      return SUCCESS;
    }
    return SUCCESS;
  }
}

class AStarMove extends Task {
  int moveTick;
  
  AStarMove(int moveTick) {
    this.moveTick = moveTick;
  }
  
  int execute(Level l, Enemy e) {
    if (e.actTimer == this.moveTick) {
      PVector selectedMove = aStarNextMove(l, new PVector(e.x, e.y), l.playerLocation);
      
      // Move Player to closest position
      if (selectedMove != null && !(selectedMove.x == l.playerLocation.x && selectedMove.y == l.playerLocation.y)) {
        e.x = (int)selectedMove.x;
        e.y = (int)selectedMove.y;
      }
    }
    return SUCCESS;
  }
}

class RangeHurt extends Task {
  int moveTick;
  boolean tick;
  int range;
  float severity;
  
  RangeHurt(int range, float severity) {
    this.tick = false;
    this.range = range;
    this.severity = severity;
  }
  
  RangeHurt(int moveTick, int range, float severity) {
    this.tick = true;
    this.moveTick = moveTick;
    this.range = range;
    this.severity = severity;
  }
  
  int execute(Level l, Enemy e) {
    if (!this.tick || e.actTimer == this.moveTick) {
      int distance = manhattanDistance(l.playerLocation, new PVector(e.x, e.y));
      if (distance <= this.range) {
        l.playerHealth -= this.severity * (this.range - distance);
      }
    }
    
    return SUCCESS;
  }
}

class RangeHurtMod extends Task {
  int moveTick;
  int range;
  float severity;
  
  RangeHurtMod(int moveTick, int range, float severity) {
    this.moveTick = moveTick;
    this.range = range;
    this.severity = severity;
  }
  
  int execute(Level l, Enemy e) {
    if (e.actTimer % this.moveTick == 0) {
      int distance = manhattanDistance(l.playerLocation, new PVector(e.x, e.y));
      if (distance <= this.range) {
        l.playerHealth -= this.severity * (this.range - distance);
      }
    }
    
    return SUCCESS;
  }
}

class NextToHurt extends Task {
  int moveTick;
  float severity;
  
  NextToHurt(int moveTick, float severity) {
    this.moveTick = moveTick;
    this.severity = severity;
  }
  
  int execute(Level l, Enemy e) {
    if (e.actTimer == this.moveTick) {
      int distance = manhattanDistance(l.playerLocation, new PVector(e.x, e.y));
      if (distance == 1) {
        l.playerHealth -= this.severity;
      }
    }
    
    return SUCCESS;
  }
}

class RangeSlow extends Task {
  int range;
  float slowFactor;
  
  RangeSlow(int range, float slowFactor) {
    this.range = range;
    this.slowFactor = slowFactor;
  }
  
  int execute(Level l, Enemy e) {
    
    int distance = manhattanDistance(l.playerLocation, new PVector(e.x, e.y));
    if (distance <= this.range) {
      l.playerMoveStall += slowFactor * (this.range - distance);
    }

    return SUCCESS;
  }
}