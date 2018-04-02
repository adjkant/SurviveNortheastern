import java.util.Arrays;

static final int GAME_SIZE = 700;

void settings() {
  size(GAME_SIZE, GAME_SIZE);
}

void setup() {
  
}

void draw() {
  background(0,0,0);
  Tunnels t = new Tunnels();
  t.drawTunnels();

}


  