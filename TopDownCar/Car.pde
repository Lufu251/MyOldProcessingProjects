float moveVectorX;
float moveVectorY;

float motorPower = 30;

float turnRadius = 0.05;

float weight;

Vector2D moveVector;

float x, y;

class Car{
  Car(int xp, int yp, int w){
    x = xp;
    y = yp;
    moveVector = new Vector2D(1, 1);
    weight = w;
  }
  
  void logic(){
    
    turn();
    move();
    isCollided();
    gfx();
    
    
    //debug
    line(x, y, x + moveVector.x * 10, y + moveVector.y * 10);
  }
  
  void turn(){
      
      if (d == true){
        moveVector.rotate2D(+turnRadius);
      }
      if (a == true){
        moveVector.rotate2D(-turnRadius);
      }
  }
  
  
  void move(){
    float mapedMagnitude = map(moveVector.magnitude(), 0, 10, 0, 1);
    if(w == true){
      moveVector.addForce(motorPower / 350 * mapedMagnitude);
      
    }
    if(moveVector.magnitude() >= 0){
      accelerate();
    }
    print(" " + moveVector.magnitude());
    x += moveVector.x;
    y += moveVector.y;
  }
  
  void accelerate(){
    float surface = 1.44;
    float resistance = surface * moveVector.magnitude();
    moveVector.removeForce(resistance /300);
  }
  
  void gfx(){
    fill(255,0,0);
    ellipse(x, y, 10, 10);
      
  }
  
  int isCollided(){
    int index = -1;
    for(int i=0; i < obstacles.size(); i++){
      //left right
      if(x >= obstacles.get(i).x && x <= obstacles.get(i).x + obstacles.get(i).s){
        //top down
        if(y >= obstacles.get(i).y && y <= obstacles.get(i).y + obstacles.get(i).s){
          print(" collision:" + i);
          
          moveVector.removeForce(obstacles.get(i).collision(weight, moveVector.magnitude()));
          print(obstacles.get(i).collision(weight, moveVector.magnitude()));
          obstacles.remove(i);
        index = i;
        }
      }
      
    }
    return index;
  }
}
