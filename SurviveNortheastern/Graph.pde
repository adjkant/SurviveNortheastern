
PVector aStarNextMove(Level l, PVector start, PVector end) {
    
  // Set up Queue
  PriorityQueue<Node> queue = new PriorityQueue<Node>(5, new NodeCompare());
  
  // Set up Lookup Table
  Hashtable<PVector, Float> lookup = new Hashtable<PVector, Float>();
  
  // Add first nodes to queue
  addNeighbors(l, queue, new Node(start, 0, this.distance(start, end), null), end);
  
  // Add start to lookup
  lookup.put(start, 0.0);
  
  while (queue.size() > 0) {
    // Get next node
    Node n = queue.poll();
    
    // Only process if reached in shortest time
    if (lookup.get(n.p) == null || lookup.get(n.p) > n.arriveCost)  {
      
      // Record Arrive Cost
      lookup.put(n.p, n.arriveCost);
      
      if (n.p.x == end.x && n.p.y == end.y) {
        return getFirstMove(n);    
      } else {
        addNeighbors(l, queue, n, end);
      }
    }
    
  }

  return null;
}

void addNeighbors(Level l, PriorityQueue<Node> q, Node parent, PVector dest) {
  
  ArrayList<PVector> possibleMoves = l.freeSpacesOrPlayer(l.tunnels.adjacentSpaces(parent.p));
  
  for (PVector move : possibleMoves) {
    q.add(new Node(move, parent.arriveCost + SQUARE_SIZE, this.distance(move, dest), parent));
  }
}
  
  
PVector getFirstMove(Node n) {
  Node curNode = n;
  
  while (curNode != null) {
    Node newNode = curNode.parent;
    if (newNode.parent == null) {
      return curNode.p;
    } else {
      curNode = newNode;
    }
  }
  
  return null;
}

class Node {
  PVector p;
  float arriveCost;
  float heuristicVal;
  Node parent;
  
  Node(PVector p, float arriveCost, float heuristicVal, Node parent) {
    this.p = p;
    this.arriveCost = arriveCost;
    this.heuristicVal = heuristicVal;
    this.parent = parent;
  }
  
  float cost() {
    return arriveCost + heuristicVal;
  }
}

class NodeCompare implements Comparator<Node> {
  
  int compare(Node p1, Node p2) {
    
    float p1Val = p1.cost();
    float p2Val = p2.cost();
    
    if (p1Val > p2Val) {
      return 1;
    } else if (p1Val < p2Val) {
      return -1; 
    } else {
      return 0;
    }
  }
}