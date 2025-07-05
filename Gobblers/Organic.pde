class Organic{
  
  int x ,y;
  int s = 6;
  
  Organic(int xp, int yp){
    x = xp;
    y = yp;
    
  }
  
  void display(){
    fill(255,0,0);
    ellipse(x,y,s,s);
  }
}
