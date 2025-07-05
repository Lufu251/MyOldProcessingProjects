class Layer {
  int[][] grid;
  int sx, sy;
  int pri;
  int sec;
  float sA;
  int ls, lsc = 0;
  int dL;
  int bL;
  
  Layer(int sizeX, int sizeY, int secondary, int primary, float startAmount, int loops, int birthLimit, int deathLimit){
   grid = new int[sizeX][sizeY];
   sx = sizeX;
   sy = sizeY;
   pri = primary;
   sec = secondary;
   sA = startAmount;
   ls = loops;
   bL = birthLimit;
   dL = deathLimit;
   init();
  }
  
  void init(){
    generateRandomMap();
    while(lsc < ls){
      calcMap();
      lsc ++;
    }
  }
  //generate a random map with primary and secondary integer.
  void generateRandomMap(){
    for(int x=0; x<sx ; x++){
      for(int y=0; y<sy ; y++){
        double random = random(1);
        if(random < sA){
          //below
         grid[x][y] = pri;
        }
        else{
          grid[x][y] = sec;
        }
      }
    }
  }
  
  void calcMap(){
    int[][] countMap = new int[sx][sy];
    for(int x=0; x < sx; x++){
          for(int y=0; y<sy; y++){
            countMap[x][y] = countAliveNeighbours(x, y);
          }
    }
    automata(countMap);
  }
  
  void automata(int[][] countMap){
    for(int x=0; x < sx; x++){
          for(int y=0; y<sy; y++){
            if(countMap[x][y] <= dL){
              grid[x][y] = sec;
            }
            if(countMap[x][y] >= bL){
              grid[x][y] = pri;
            }
          }
    }
  }
  
  int countAliveNeighbours(int xP, int yP){
      int count = 0;
      for(int i=-1; i<2; i++){
          for(int j=-1; j<2; j++){
              int neighbour_x = xP +i;
              int neighbour_y = yP +j;
              //If we're looking at the middle point
              if(i == 0 && j == 0){
                  //Do nothing, we don't want to add ourselves in!
              }
              //In case the index we're looking at it off the edge of the map
              else if(neighbour_x < 0 || neighbour_y < 0 || neighbour_x >= sx || neighbour_y >= sy){
                  float random = random(1);
                  if(random < sA){
                  count = count + 1;
                  }
                  else{
                   //Do nothing 
                  }
              }
              //Otherwise, a normal check of the neighbour
              else if(grid[neighbour_x][neighbour_y] > 0){
                  count = count + 1;
              }
          }
      }
      return count;
  }
}
