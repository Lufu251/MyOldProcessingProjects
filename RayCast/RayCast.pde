ray ray = new ray();
int size = 100;
int[][] grid = new int[100][100];

void setup(){
  size(800,800);
  for(int x=0; x< 20; x++){
    for(int y=0; y< 20; y++){
      grid[x][y] = 0;
    }
  }
}




void draw(){
  background(100,100,100);
  display();
  if(mousePressed == true){

    ray.cast(330,399, mouseX, mouseY, size, 4);
  }
}







void display(){
 stroke(0,200,50);
  for(int x=0; x< 100; x++){
    for(int y=0; y< 100; y++){
      if(grid[x][y] == 0){
        fill(255,255,255);
        rect(x*size, y*size, size, size);
      }
      else{
        fill(0,0,0);
        rect(x*size, y*size, size, size);
      }
    }
  }
  stroke(0,100,50);
  line(ray.curX, ray.curY, mouseX, mouseY);
  fill(100,0,0);
  ellipse(ray.curX, ray.curY, 5,5);
  
}
