int xsize = 30, ysize = 30;
int climate = 10;

Cell[][] grid = new Cell[xsize][ysize];

void setup(){
  size(600, 650);
  for (int i=0; i<xsize; i++) {
      for (int j=0; j<ysize; j++) {
        grid[i][j] = new Cell(i * 20, j * 20);
    }
  }
}

void draw(){
  for (int i=0; i<xsize; i++) {
      for (int j=0; j<ysize; j++) {
        grid[i][j].render();
        grid[i][j].change();
        grid[i][j].heatSource();
        grid[i][j].temp();
        grid[i][j].exchangeHeat();
      }
  }
}
