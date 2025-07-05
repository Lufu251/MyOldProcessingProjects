class Projectile{
  int s;
  float xf, yf, x, y;
 Projectile(float xp, float yp, float xFacing, float yFacing, int speed){
   x = xp;
   y = yp;
   xf = xFacing;
   yf = yFacing;
   s = speed;
   
 }
 void render(){
   fill(0,0,255);
   ellipse(x,y,5,5);
 
 
}
void move(){
  x += xf /100 * s;
  y += yf /100 * s;
  
}
}
