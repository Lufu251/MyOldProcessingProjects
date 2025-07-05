class Cell {
  int x, y, s, cooldown, wait, c;
  boolean a = false;

  Cell(int xpos, int ypos, int size, boolean alive) {
    x = xpos;
    y = ypos;
    a = alive;
    s = size;
  }
  void render() {
    if (a == true) {
      fill(0, 0, 0);
      rect(x, y, s, s);
    }
    if (a == false) {
      fill(255, 255, 255);
      rect(x, y, s, s);
    }
  }
  //Alive status der Zelle verändern
  void ChangeState() {
    if (cooldown > 0) {
      cooldown --;
    }
    if (mouseX >= x && mouseX < x + s && mouseY >= y && mouseY < y + s && cooldown == 0 && mouseX <= 760) {
      if(mousePressed == true){
      if (a == true) {
        a = false;
        cooldown = 10;
      } else {
        a = true;
        cooldown = 10;
      }
    }
    }
  }
  void Map() {
    // vergrössern und verkleinern der Zellen
    x = x / s;
    y = y / s;
    
    if (wait > 0) {
      wait --;
    }
    
    if (keyPressed && wait == 0) {
      if (key == 'w' && s < 100) {
        s ++;
        wait = 5;
      }
      if (key == 's' && s > 2) {
        s --;
        wait = 5;
      }
    }
      x = x * s;
      y = y * s;
  
  }
  
  void ChangeCell(){
    //If a living cell has less than two living neighbours, it dies.
    if(a == true && c < 2){
      a = false;
    }
    //If a living cell has two or three living neighbours, it stays alive.
    if(a == true && c == 2){
      a = true;
    }
    else if(a == true && c == 3){
      a = true;
    }
    //If a living cell has more than three living neighbours, it dies.
    if(a == true && c > 3){
      a = false;
    }
    //If a dead cell has exactly three living neighbours, it becomes alive.
    if(a == false && c == 3){
      a = true;
    }
  } //<>// //<>//
  
  public void countAliveNeighbours(){
    int count = 0;
    for(int i=-1; i<2; i++){
        for(int j=-1; j<2; j++){
            int neighbour_x = (x / s) +i;
            int neighbour_y = (y / s) +j;
            //If we're looking at the middle point
            if(i == 0 && j == 0){
                //Do nothing, we don't want to add ourselves in!
            }
            //In case the index we're looking at it off the edge of the map
            else if(neighbour_x < 0 || neighbour_y < 0 || neighbour_x >= xsize || neighbour_y >= ysize){
                
            }
            //Otherwise, a normal check of the neighbour
            else if(grid[neighbour_x][neighbour_y].a == true){
                count = count + 1;
            }
        }
    }
    c = count;
}
}
