class enemies{
  float x, y, s, l;
  float mX, mY;
  
  enemies(int xpos, int ypos, int leben, float moveX, float moveY, int size){
    x = xpos;
    y = ypos;
    s = size;
    l = leben;
    mX = moveX;
    mY = moveY;
  }

void render(){
  fill(0,150,100);
  image(asteorid, x -s/2, y -s/2, s, s);
}

void move(){
  x -= mX;
  y -= mY;
}

void isHit(){
  for(int i=0; i<projectiles.size(); i++){
    float xdis = projectiles.get(i).x - x;
    float ydis = projectiles.get(i).y - y;
    float dis = sqrt((xdis * xdis) + (ydis * ydis));
    if(dis <= sqrt(((s /2) * (s /2)) + ((projectiles.get(i).s/2) * (projectiles.get(i).s/2)))){
      projectiles.remove(i);
      l -= 1;
    }
  }
    
}
}
