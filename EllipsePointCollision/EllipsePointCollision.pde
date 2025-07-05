int size1 = 100;
int x = 200, y = 200;
int farb;

void setup(){
  size(900,900, P3D);
  smooth(0);
}


void draw(){
  fill(255-farb, farb, 0);
  ellipse(x,y, size1, size1);
  if(sqrt((mouseX - x) * (mouseX - x) + (mouseY - y) * (mouseY - y)) <= size1 /2){
    farb = 255;
  }
  else{
   farb = 0;
  }
}
