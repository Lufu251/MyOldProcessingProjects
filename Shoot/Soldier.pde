class Soldier {
  int h, t, MoveWait, selfindex, shootcooldown;
  float r = 0;
  float x, y;
  int range = 100;
  float HypoMin = 10000000;

  Soldier(int xp, int yp, int health, int team) {
    x = xp;
    y = yp;
    h = health;
    t = team;
  }
  void render() {
    if (t == 1) {
      fill(255, 0, 0);
    }
    if (t == 2) {
      fill(0, 255, 0);
    }
    ellipse(x, y, 20, 20);
  }
  void action() {
    Soldier s = nearestEnemy();
    if(s == null){
      move();
    } else if(inRange(s) == true){
      shoot(s);
    }
    else{
     move(); 
    }
  }

  Soldier nearestEnemy() {
    HypoMin = 10000000;
    Soldier s = null;
    
    for (int i=0; i<Soldiers.size(); i++) {

      float VecX = Soldiers.get(i).x - x;
      float VecY = Soldiers.get(i).y - y;
      float Hypo = sqrt((VecX*VecX) + (VecY*VecY));
      int iTeam = Soldiers.get(i).t;
      if (Soldiers.get(i) == this) {
        selfindex = i;
      } else if(iTeam == t){
        
      }
      else if (Hypo < HypoMin) {
        HypoMin = Hypo;
        s = Soldiers.get(i);
      }
    }
    return s;
  }

  void shoot(Soldier s) {
    if(shootcooldown < 0){
    float VecX = s.x - x;
    float VecY = s.y - y;
    float Hypo = sqrt((VecX*VecX) + (VecY*VecY));
    VecX = VecX / Hypo;
    VecY = VecY / Hypo;
    Projectiles.add(new Projectile(x, y, VecX, VecY, 500));
    shootcooldown = 10;
    }
    shootcooldown --;
  }

  boolean inRange(Soldier s) {
    boolean inRange = false;
    
    float VecX = s.x - x;
    float VecY = s.y - y;
    float Hypo = sqrt((VecX*VecX) + (VecY*VecY));
    if (range >= Hypo) {
      inRange = true;
    }
    return inRange;
  }

  void move() {
    if ( MoveWait <= 0) {
      r = random(5);
      MoveWait = 50;
    }
    r = round(r);
    if (r <=1) {
      x += 0.5;
    }
    if (r <=2 && r>1) {
      y += 0.5;
    }
    if (r <=3 && r>2) {
      x -= 0.5;
    }
    if (r <=4 && r>3) {
      y -= 0.5;
    }
    MoveWait --;
  }
}
