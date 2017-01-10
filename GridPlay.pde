//Draws Grid
//Populates Grid with random colours
//Use mouse to click them away
//phil.jones.24.4@gmail.com

//Initalise array list
ArrayList<GridItems> griditems = new ArrayList<GridItems>();
int scl = 20;
// maxItem = 900 with 600x600 canvas and scale of 20
int intialItem = 25;
void setup() {
  size(600, 600);
  populateGrid(intialItem);
}

void draw() {

  background(0);
  drawGrid();
  fillGrid();
  detectEnd();
}

void mouseClicked() {
  removeItem();
}


void drawGrid() {
  //Easiest way I could think of
  for (int y=0; y < height; y=y+scl) {
    for (int x=0; x < width; x=x+scl) {
      noFill();
      stroke(255);
      rect(x, y, scl, scl);
    }
  }
}

//populate the array based on argument of how many items
void populateGrid(int items)
{
  for (int i=0; i < items; i++) {   
    griditems.add(new GridItems());
  }
}

//fill the grid with coloured squares
void fillGrid() {
  for (int i=0; i < griditems.size(); i++) { 
    griditems.get(i).show();
  }
}

void removeItem() {
  //Advice is to itterate backwards when deleting
  for (int i = griditems.size() - 1; i >= 0; i--) {
    //Collision detection
    float posX = griditems.get(i).getX();
    float posY = griditems.get(i).getY();
    float d  = dist(mouseX, mouseY, posX+scl/2, posY+scl/2);
    if ( d < scl/2) {
      griditems.remove(i);
    }
  }
  //Impossible to ever clear them ;-)
  //populateGrid(1);
}

void detectEnd() {

  if (griditems.size() < 1) {
    populateGrid(1);
  }
}