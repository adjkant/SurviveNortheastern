abstract class Predicate {
  abstract boolean evaluate(Level l, Enemy e); // returns if predicate is true  
  
}

class InSight extends Predicate {
  boolean evaluate(Level l, Enemy e) {
    return l.tunnels.allValid(l.playerLocation, new PVector(e.x, e.y));
  }
}