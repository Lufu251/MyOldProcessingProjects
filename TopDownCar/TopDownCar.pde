ArrayList <Obstacle> obstacles = new ArrayList <Obstacle>();
float xOffset, yOffset;
boolean w,a,s,d;
Car car;

void setup(){
  smooth(3);
  size(900,900, P2D);
  car = new Car(300,300, 1);
  obstacles.add(new Obstacle(500,500,40, 50));
  obstacles.add(new Obstacle(500,500,40, 10));
}

void draw(){
  background(250,250,250);
  car.logic();
  
  
  for(int i=0; i < obstacles.size(); i++){
    obstacles.get(i).logic();
  }
}

void keyPressed(){
  if(key == 'd'){
    d = true;
  }
  if(key == 'a'){
    a = true;
  }
  if(key == 'w'){
    w = true;
  }
  if(key == 's'){
    s = true;
  }
  
}

void keyReleased(){
  if(key == 'd'){
    d = false;
  }
  if(key == 'a'){
    a = false;
  }
  if(key == 'w'){
    w = false;
  }
  if(key == 's'){
    s = false;
  }
  
}
