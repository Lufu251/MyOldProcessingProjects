class Obstacle{
  int x, y, s;
float weight;
  Obstacle(int xp, int yp, int size, int w){
    x = xp;
    y = yp;
    s = size;
    weight = w;
  }
  
  void logic(){
    
    
    
    gfx();
  }
  
  void gfx(){
    fill(100,100,100);
    rect(x,y,s,s);
  }
  
  float collision(float carWeight, float speed){
    float reduction = 1;
    //noch fehlerhaft
    reduction = weight / (carWeight * speed);
    
    return reduction;
  }
  
}
