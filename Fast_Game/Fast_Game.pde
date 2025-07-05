float PlayerX = 500, PlayerY = 500;
float PlayerVektorX;
float PlayerVektorY;


int PlayerHealth = 10, MaxPlayerHealth = 10;
int tick;
int earthX = 500, earthY = 500;
int spawnRate = 200, spawn = 200, shootSpeed = 10, shootRate = 20;
int Money = 0;

boolean Buy = false;

ArrayList <projectile> projectiles = new ArrayList <projectile>();
ArrayList <enemies> enemiess = new ArrayList <enemies>();

PImage space;
PImage earth;
PImage asteorid;

void setup(){
    size(1000,1000, P2D);
    noStroke();
    space = loadImage("Space.png");
    earth = loadImage("Earth.png");
    asteorid = loadImage("Asteorid.png");
}

void draw(){
  if(Buy == false){
  //background
  image(space, 0, 0, 1100, 1100);
  fill(0,255,0);
  image(earth, earthX - 30, earthY - 30, 60, 60);
  textSize(25);
  text(""+Money, 900,30);
  
  playerHealthbar();
  shoot();
  
  tick ++;
  
  //Projectile aufrufen
  for(int i=0; i<projectiles.size(); i++){
    projectiles.get(i).render();
    projectiles.get(i).move();
    projectiles.get(i).tick();
    
      if(projectiles.get(i).tt <= 0){
          projectiles.remove(i);
    }
  }
  
  //Enemies aufrufen
  for(int i=0; i<enemiess.size(); i++){
    enemiess.get(i).render();
    enemiess.get(i).move();
    enemiess.get(i).isHit();
    earthIsHit(i);
    
      if(enemiess.get(i).l <= 0){
        Money += enemiess.get(i).s * 2;
        enemiess.remove(i);
    }
  }
  spawnEnemy();
  GameOver();
  
  if(keyPressed == true){
    if(key == 'e'){
      Buy = true;
    
    
    }
  }
}
}

void shoot(){
  if(mousePressed == true && tick >= shootRate){
  PlayerVektorX = mouseX - PlayerX;
  PlayerVektorY = mouseY - PlayerY;
  float hyp = sqrt(PlayerVektorX * PlayerVektorX + PlayerVektorY * PlayerVektorY);
  PlayerVektorX /= hyp;
  PlayerVektorY /= hyp;
  PlayerVektorX *= shootSpeed;
  PlayerVektorY *= shootSpeed;
  
  projectiles.add( new projectile(PlayerX, PlayerY, PlayerVektorX, PlayerVektorY));
  tick =0;
  }
}

void spawnEnemy(){
  spawn --;
  float angle = random(2 * PI);
  float xvec, yvec;
  xvec = sin(angle);
  yvec = cos(angle);
  xvec *= 600;
  yvec *= 600;
  if(spawn == 0){
    int s = 20, r, l = 3;
    r = (int)random(4) + 1;
    enemiess.add( new enemies(earthX + (int)xvec, earthY + (int)yvec, l *r, xvec / (200*r) , yvec / (200*r), s * r));
    
    spawn = spawnRate;
  }
  
}

void earthIsHit(int i){
    float hyp, katX, katY;
    katX = earthX - enemiess.get(i).x;
    katY = earthY - enemiess.get(i).y;
    hyp= sqrt(katX * katX + katY * katY);
    if(hyp <= sqrt(((enemiess.get(i).s/2) * (enemiess.get(i).s/2)) + 40 * 40)){
      enemiess.get(i).l = 0;
      PlayerHealth --;
    }
  }
  
void GameOver(){
    if(PlayerHealth <= 0){
      fill(255,0,0);
      rect(0,0,1100,1100);
      
    }
}

void playerHealthbar(){
  int l;
  l = 300 / MaxPlayerHealth * PlayerHealth;
  
   fill(100,100,100);
  rect(10, 10, 300, 20);
  fill(255,0,0);
  rect(10, 10, l, 20);
}
