abstract class Predicate {
  abstract boolean evaluate(Level l, Enemy e); // returns if predicate is true  
  
}

class OrPredicate extends Predicate {
  Predicate p1;
  Predicate p2;
  
  OrPredicate(Predicate p1, Predicate p2) {
    this.p1 = p1;
    this.p2 = p2;
  }
  
  boolean evaluate(Level l, Enemy e) {
    return p1.evaluate(l, e) || p2.evaluate(l, e);
  }
}

class AndPredicate extends Predicate {
  Predicate p1;
  Predicate p2;
  
  AndPredicate(Predicate p1, Predicate p2) {
    this.p1 = p1;
    this.p2 = p2;
  }
  
  boolean evaluate(Level l, Enemy e) {
    return p1.evaluate(l, e) && p2.evaluate(l, e);
  }
}

class InSight extends Predicate {
  boolean evaluate(Level l, Enemy e) {
    return l.tunnels.allValid(l.playerLocation, new PVector(e.x, e.y));
  }
}

class WithinDistance extends Predicate {
  float dist;
  
  WithinDistance(float dist) {
    this.dist = dist;
  }
  
  boolean evaluate(Level l, Enemy e) {
    return dist >= distance(l.playerLocation, new PVector(e.x, e.y));
  }
}