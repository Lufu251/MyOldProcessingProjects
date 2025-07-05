import processing.opengl.*;
double MouseVecX, MouseVecY;
double LookVecX = 100, LookVecY = 100;
double bOld;
double NewLookVecX;
double NewLookVecY;
//winkel
double a = PI / 128;
void setup() {
  size(800, 800);
  frameRate(60);
  smooth();
}
void draw() {
  background(100, 100, 100);
  MouseVecX = 400 - mouseX;
  MouseVecY = 400 - mouseY;
  double b = MouseVecX * LookVecY - MouseVecY * LookVecX;

  double remainingAngle = Math.asin(Math.abs(b) / (len(MouseVecX,MouseVecY) * len(LookVecX,LookVecY)));

  double rot;
  if(remainingAngle < a){
    rot = remainingAngle;
  }
  else{
    rot = a;
  }
  b = Math.signum(b);
  NewLookVecX = LookVecX * Math.cos(rot) - LookVecY * -Math.sin(rot * b);
  NewLookVecY = LookVecX * -Math.sin(rot * b) + LookVecY * Math.cos(rot);
  LookVecX = NewLookVecX;
  LookVecY = NewLookVecY;
  line(400, 400, 400 - (float)MouseVecX, 400 - (float)MouseVecY);
  line(400, 400, 400 - (float)NewLookVecX, 400 - (float)NewLookVecY);
}
double len(double x, double y){
  return Math.sqrt(x * x + y * y);
}
