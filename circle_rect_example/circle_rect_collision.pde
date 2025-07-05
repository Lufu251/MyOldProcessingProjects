float x_rect = 200, y_rect = 200, xs_rect = 200, ys_rect = 100;
float x_circle= 100, y_circle = 180, s_circle = 50;

float x_vc = 2, y_vc = 0;

void setup(){
  size(800,800);
  
}



void draw(){
  background(100,100,100);
  x_circle += x_vc;
  y_circle += y_vc;
    if(mousePressed== true){
      x_circle = mouseX;
      y_circle = mouseY;
    }
    // calculate the position of collision
    float collisionX = constrain(x_circle - x_rect, 0, xs_rect) + x_rect;
    float collisionY = constrain(y_circle - y_rect, 0, ys_rect) + y_rect;
    
    // calculate the normal vector from the collision plane
    float x_dist = collisionX - x_circle;
    float y_dist = collisionY - y_circle;
    float magnitude = sqrt(sq(x_dist) + sq(y_dist));
    float x_Normal = x_dist / magnitude;
    float y_Normal = y_dist / magnitude;
    
    // reflect vector on normvector axis
    float dotProduct = x_vc *x_Normal + y_vc * y_Normal; //dot product
    float x_vecNew = x_vc - (2*x_Normal) * (dotProduct); // calculate the new vector x
    float y_vecNew = y_vc - (2*y_Normal) * (dotProduct); // calculate the new vector y
  
  fill(0,255,0);
  if(magnitude < s_circle / 2){
    x_vc = x_vecNew;
    y_vc = y_vecNew;
  }
  
  rect(x_rect, y_rect, xs_rect, ys_rect);
  ellipse(x_circle, y_circle, s_circle, s_circle);
  ellipse(collisionX, collisionY, 5,5);
}




float calculate_clampedX(){
  float clampedX = 0;
  clampedX = x_circle - x_rect; 
  
  
  clampedX = constrain(clampedX, 0, xs_rect);
  return clampedX;
}

float calculate_clampedY(){
  float clampedY = 0;
  clampedY = y_circle - y_rect; 
  
  
  clampedY = constrain(clampedY, 0, ys_rect);
  return clampedY;
}
