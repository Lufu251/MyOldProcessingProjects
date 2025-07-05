//grid grösse und zellen grösse am anfang des Spieles
int xsize = 200, ysize= 200;
int size = 10;

int wait;
int Cooldown = 0, GameSpeed = 10;

//position des Start/Stop knopfes
int x1 = 770, y1 = 10;

//position des plus Speed Knopfes
int x2 = 770, y2 = 40;

//position des minus Speed Knopfes
int x3 = 770, y3 = 70;

boolean GameActive = false;

Cell [][] grid = new Cell[xsize][ysize];

void setup() {
  frameRate(60);
  size(800, 800);
  for (int x=0; x<xsize; x++) {
    for (int y=0; y<ysize; y++) {
      grid[x][y] = new Cell(x*size, y*size, size, false);
    }
  }
}

void draw() {
  background(0, 0, 0);
  // GameActive = true spiel ist am laufen
  // GameActive = false spiel ist pausiert und es können zellen geändert werden
  if (GameActive == false) {

    //Zellen updaten
    for (int x=0; x<xsize; x++) {
      for (int y=0; y<ysize; y++) {
        grid[x][y].render();
        grid[x][y].ChangeState();
        grid[x][y].Map();
      }
    }
  }



  // GameActive = true spiel ist am laufen
  // GameActive = false spiel ist pausiert und es können zellen geändert werden
  Cooldown --;
  if (GameActive == true) {
    for (int x=0; x<xsize; x++) {
      for (int y=0; y<ysize; y++) {
        grid[x][y].render();
        grid[x][y].Map();
      }
    }


    if (Cooldown <= 0) {
      for (int x=0; x<xsize; x++) {
        for (int y=0; y<ysize; y++) {
          grid[x][y].countAliveNeighbours();
        }
      }
      for (int x=0; x<xsize; x++) {
        for (int y=0; y<ysize; y++) {
          grid[x][y].ChangeCell();
        }
      }
      Cooldown = GameSpeed;
    }
  }



  // Wird immer ausgeführt
  if (wait > 0) {
    wait --;
  }

  //toolbar
  fill(0,100,100);
  rect(760, 0, 40, 800);
  
  
  //plus Speed Knopf
  fill(100,50,0);
  rect(x2, y2, 20, 20);
  fill(255,0,0);
  rect(x2 +5, y2 +8, 11, 4);
    rect(x2 +5, y2 +8, 11, 4);
  if (mouseX > x2 && mouseX < x2 + 20 &&
    mouseY > y2 && mouseY < y2 + 20 && mousePressed == true && wait == 0) {
    GameSpeed --;
    wait = 10;
  }
  //minus Speed Knopf
  fill(100,50,0);
  rect(x3, y3, 20, 20);  
  fill(255,0,0);
  rect(x2 +5, y2 +8, 11, 4);
  if (mouseX > x3 && mouseX < x3 + 20 &&
    mouseY > y3 && mouseY < y3 + 20 && mousePressed == true && wait == 0) {
    GameSpeed ++;
    wait = 10;
  }
  
  
  // knopf um GameActive status zu verändern
  
  //farbändrung des Knopfes
  if (GameActive == false) {
    fill(255, 20, 0);
  }
  //farbändrung des Knopfes
  if (GameActive == true) {
    fill(0, 150, 0);
  }

  rect(x1, y1, 20, 20);
  if (mouseX > x1 && mouseX < x1 + 20 &&
    mouseY > y1 && mouseY < y1 + 20 && GameActive == false && mousePressed == true && wait == 0) {
    GameActive = true;
    wait = 10;
  }
  if (mouseX > x1 && mouseX < x1 + 20 &&
    mouseY > y1 && mouseY < y1 + 20 && GameActive == true && mousePressed == true && wait == 0) {
    GameActive = false;
    wait = 10;
  }
}
