class Vector2D{
  
  float x, y;
  
  Vector2D(float vectorX, float vectorY){
    x = vectorX;
    y = vectorY;
    
  }
  
  void rotate2D(float angle){
    float xa = x * cos(angle) - y * sin(angle);
    float ya = x * sin(angle) + y * cos(angle);
    x = xa;
    y = ya;
  }
  
  void addForce(float amount){
    x += normalX() * amount;
    y += normalY() * amount;
  }
  
  void removeForce(float amount){
    x -= normalX() * amount;
    y -= normalY() * amount;
  }
  
  void addVector(float x1, float y1){
    x += x1;
    y += y1;
  }
  
  void multiplie(float amount){
    x = x * amount;
    y = y * amount;
  }
  
  float magnitude(){
    float magnitude = sqrt(x*x + y*y);
    
    return magnitude;
  }
  
  float normalX(){
    float normalX = x / magnitude();
    
    return normalX;
  }
  
  float normalY(){
    float normalY = y / magnitude();
    
    return normalY;
  }
}
