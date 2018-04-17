class ProfessorBehavior extends Task {
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

class HuskyBehavior extends Task {
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
