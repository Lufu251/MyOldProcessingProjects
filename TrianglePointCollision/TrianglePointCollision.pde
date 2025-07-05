// tutorial http://www.jeffreythompson.org/collision-detection/tri-point.php
PVector triangle1;
PVector triangle2;
PVector triangle3;
boolean collision = false;

void setup(){
  triangle1 = new PVector(300, 250);
  triangle2 = new PVector(200, 400);
  triangle3 = new PVector(400, 400);
  
  size(600,600);
  frameRate(10);
  
}


void draw(){
  // set mouse Position
  PVector mouseP = new PVector(mouseX, mouseY);
  
  // calculate the collision
  float areaOriginal = calculateArea(triangle1, triangle2, triangle3);
  float area1 = calculateArea(mouseP, triangle1, triangle2);
  float area2 = calculateArea(mouseP, triangle2, triangle3);
  float area3 = calculateArea(mouseP, triangle3, triangle1);
  float areaCombined = area1 + area2 + area3;
  
  if(areaCombined == areaOriginal){
    collision = true;
  }
  else{
    collision = false;
  }
  
  // draw triangle
  background(255,255,255);
  if(collision == true){
    fill(200,100,0);
  }
  else{
    fill(100,200,0);
  }
  triangle(triangle1.x, triangle1.y, triangle2.x, triangle2.y,triangle3.x, triangle3.y);
  fill(0,200,0);
  line(mouseP.x, mouseP.y, triangle1.x, triangle1.y);
  line(mouseP.x, mouseP.y, triangle2.x, triangle2.y);
  line(mouseP.x, mouseP.y, triangle3.x, triangle3.y);
  
  
}

// calculate the are from 3 given point of a triangle
float calculateArea(PVector t1, PVector t2, PVector t3){
  float area = abs( (t2.x - t1.x)*(t3.y - t1.y) - (t3.x - t1.x)*(t2.y - t1.y) );
  return area;
}
