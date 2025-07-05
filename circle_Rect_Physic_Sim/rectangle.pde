class rectangle{
  PVector velocity, size, position;
  
  
  
  rectangle(int x, int y, int xs, int ys){
    velocity = new PVector(0,0);
    position = new PVector(x,y);
    size = new PVector(xs, ys);
  }
  
  void update(){
    position.x += velocity.x;
    position.y += velocity.y;
  }
  
  void display(){
    fill(0,180,0);
    rect(position.x, position.y, size.x, size.y);
  }
  
}
