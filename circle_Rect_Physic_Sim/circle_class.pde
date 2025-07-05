class circle{
  PVector velocity, position;
  int size, mass;
  
  circle(int x, int y, int s, int m){
    velocity = new PVector(0,0);
    // velocity = PVector.random2D(); 
    velocity.mult(20);
    position = new PVector(x,y);
    
    size = s;
    mass = m;
  }
  
  void update(int substeps){
    
    PVector gravityVector = new PVector(0,0.08);
    
    // gravity
    velocity.add(gravityVector);    
    
    // air Resistance
    float c = 0.0015;
    
    float v = velocity.mag();
    PVector drag = velocity.copy();
    drag.normalize();
    drag.mult(-1);
     //<>//
    drag.setMag(sq(v) * c); //<>// //<>//
    
    velocity.add(drag);
    
    // add velocity to the position
    position.x += velocity.x / substeps;
    position.y += velocity.y / substeps;
  }
  
  void gravity(){
    
  }
  
  void display(){
    fill(180,0,0);
    ellipse(position.x, position.y, size, size);
  }
}
