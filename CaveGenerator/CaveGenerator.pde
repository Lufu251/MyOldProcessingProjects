int xsize = 200, ysize= 200;
int size = 4;
Map map = new Map(xsize,ysize);
void setup(){
  size(800, 800, P2D);
  noStroke();
}






void draw(){
  background(255,255,255);
  for(int x=0;x<xsize;x++){
    for(int y=0;y<ysize;y++){
      if(map.mapGrid[x][y] == 0){
        fill(0,0,0);
        rect(x*size, y*size, size, size);
      }
      else if(map.mapGrid[x][y] == 1){
        fill(144,144,144); //gray
        rect(x*size, y*size, size, size);
      }
      else if(map.mapGrid[x][y] == 2){
        fill(160,100,40); //Brown
        rect(x*size, y*size, size, size);
      }
      else if(map.mapGrid[x][y] == 3){
        fill(154,179,98); //steel Gray
        rect(x*size, y*size, size, size);
      }
      else if(map.mapGrid[x][y] == 4){
        fill(30,199,199); //blue
        rect(x*size, y*size, size, size);
      }
      //if not one of the predefined
      else{
        fill(255,0,255); //Pink
        rect(x*size, y*size, size, size);
      }
    } 
  }
}
