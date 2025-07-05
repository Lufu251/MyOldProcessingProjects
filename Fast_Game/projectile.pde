class projectile {
 
  float x, y;
  float xm, ym;
  int tt = 500, s =10;
  projectile(float xpos, float ypos, float xmove, float ymove){
    x = xpos;
    y = ypos;
    xm = xmove;
    ym = ymove;
  }
  void render(){
    fill(255,255,255);
    ellipse(x, y, s, s);
  }
  void move(){
    x += xm;
    y += ym;
  }
  
  void tick(){
    tt -= 1;
  }
}
