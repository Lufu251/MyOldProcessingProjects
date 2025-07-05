ArrayList <Soldier> Soldiers = new ArrayList <Soldier>();
ArrayList <Projectile> Projectiles = new ArrayList <Projectile>();
ArrayList <Tent> Tents = new ArrayList <Tent>();
int wait;

void setup(){
  size(800,800);
  Soldiers.add( new Soldier(200, 200, 100, 1));
  Soldiers.add( new Soldier(300, 300, 100, 1));
}

void draw(){
  background(100,100,100);
  noStroke();
  
  //Soldiers aufrufen
  for(int i=0; i<Soldiers.size(); i++){
    Soldiers.get(i).action();
    Soldiers.get(i).render();
  }
  
  //Projectile aufrufen
  for(int i=0; i<Projectiles.size(); i++){
    Projectiles.get(i).move();
    Projectiles.get(i).render();
  }
  
  wait ++;
  if(mousePressed && (mouseButton == LEFT)&& wait > 10){
    Soldiers.add( new Soldier(mouseX, mouseY, 100, 1));
    wait = 0;
  }
  
  if(mousePressed && (mouseButton == RIGHT)&& wait > 10){
    Soldiers.add( new Soldier(mouseX, mouseY, 100, 2));
    wait = 0;
  }
}
