class GridItems {
  float x;
  float y;
  int scl;
  int cols;
  int rows;
  float r;
  float g;
  float b;

  GridItems() {
    r = random(10, 255);
    g = random(10, 255);
    b = random(10, 255);
    scl = 20;
    cols = width/scl;
    rows = height/scl;
    x = floor(random(0, cols))*scl;
    y = floor(random(0, rows))*scl;
  }

  void show() {
    noStroke();
    fill(r, g, b);
    rect(x, y, scl, scl);
  }

  float getX() {
    return x;
  }
  
  float getY() {
    return y;
  }
}