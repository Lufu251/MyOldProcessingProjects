/*
https://flatredball.com/documentation/tutorials/math/circle-collision/
*/

ArrayList<circle> circles= new ArrayList<circle>();
ArrayList<rectangle> rectangles= new ArrayList<rectangle>();


int lastTime = 1;
float delta = 0;
int substeps = 4;
int stepCount = 1;

void setup(){
  
  size(800,800);
  frameRate(60);
  
  circles.add(new circle(40,100,30,10));
  circles.add(new circle(120,80, 30,5));
  circles.add(new circle(180,60, 30,5));
  circles.add(new circle(240,60, 30,10));
  circles.add(new circle(300,60, 30,5));
  circles.add(new circle(360,60, 30,5));
  circles.add(new circle(420,60, 30,10));
  circles.add(new circle(480,60, 30,5));
  circles.add(new circle(540,60, 30,5));
  circles.add(new circle(600,60, 30,10));
  circles.add(new circle(660,60, 30,5));
  
  circles.add(new circle(60,500, 30,10));
  circles.add(new circle(120,500, 30,5));
  circles.add(new circle(180,500, 30,5));
  circles.add(new circle(240,500, 30,10));
  circles.add(new circle(300,500, 30,5));
  circles.add(new circle(360,500, 30,5));
  circles.add(new circle(420,500, 30,10));
  circles.add(new circle(480,500, 30,5));
  circles.add(new circle(540,500, 30,5));
  circles.add(new circle(600,500, 30,10));
  circles.add(new circle(660,500, 30,5));
  
  circles.add(new circle(60,600, 30,10));
  circles.add(new circle(120,600, 30,5));
  circles.add(new circle(180,600, 30,5));
  circles.add(new circle(240,600, 30,10));
  circles.add(new circle(300,600, 30,5));
  circles.add(new circle(360,600, 30,5));
  circles.add(new circle(420,600, 30,10));
  circles.add(new circle(480,600, 30,5));
  circles.add(new circle(540,600, 30,5));
  circles.add(new circle(600,600, 30,10));
  circles.add(new circle(660,600, 30,5));
  
  rectangles.add(new rectangle(0,0,800,30));
  rectangles.add(new rectangle(0,770,800,30));
  rectangles.add(new rectangle(0,30,30,740));
  rectangles.add(new rectangle(770,30,30,740));
  rectangles.add(new rectangle(300,300,60,60));
}

void draw(){
  background(190);
  
  delta = millis() - lastTime;
  if(delta > 0){
  int fps = (int)(1 / (delta / 1000));
  println("fps: " + fps + " d: " +delta);
  }else{
  println("fps: " + 0 + " d: " +delta);
  }
  if (mousePressed == true){
    circles.add(new circle(mouseX, mouseY, 30, 10));
  }
  
  for(int step=0; step < substeps;step++){
    //println(stepCount);
    
    // update circles
    for(int i=0; i<circles.size(); i++){
      circles.get(i).update(substeps);
    }
  
    // circle circles collision
    for(int i=0; i<circles.size(); i++){
      for(int j=0; j<circles.size(); j++){
        if(j != i){
          circle_circle_CollisionD(circles.get(i), circles.get(j));
        }
      }
    }
  
    //check circles rectangles collision
    for(int i=0; i<rectangles.size(); i++){
      for(int j=0; j<circles.size(); j++){
        circle_rect_collision_improved(circles.get(j), rectangles.get(i));
      }
    }
    stepCount ++;
  }
  stepCount = 1;
  
  
  
  // display
  for(int i=0; i<rectangles.size(); i++){
    rectangles.get(i).display();
  }
  for(int i=0; i<circles.size(); i++){
    circles.get(i).display();
  }
  
  lastTime = millis();
}

void circle_rect_collision_improved(circle c, rectangle r){
    // calculate the position of possible collision
    float collisionX = constrain(c.position.x - r.position.x, 0, r.size.x) + r.position.x;
    float collisionY = constrain(c.position.y - r.position.y, 0, r.size.y) + r.position.y;
    
    // calculate distance to possible collisionpoint
    float distanceBetweenCircleRectSquared = sq(collisionX - c.position.x) + sq(collisionY - c.position.y);
    
    // check if collision is true
    if(distanceBetweenCircleRectSquared < sq(c.size/2)){
      PVector directionVector = new PVector(collisionX - c.position.x, collisionY - c.position.y);
      PVector directionVectorNormalized = directionVector.copy();
      directionVectorNormalized.normalize();
      // magnitude
      float distanceBetweenCircleRect = directionVector.mag();
      
      //move circle just outside of the rect
      float distanceToMove = c.size/2 - distanceBetweenCircleRect;
      c.position.x -= directionVectorNormalized.x * distanceToMove;
      c.position.y -= directionVectorNormalized.y * distanceToMove;
      
      // reflect velocity
      float dotProd = PVector.dot(c.velocity, directionVectorNormalized); //dot product
      
      PVector velocityChange = new PVector(directionVectorNormalized.x * dotProd, directionVectorNormalized.y * dotProd);
      if(velocityChange.mag() < 0.02){
        c.velocity.x -= velocityChange.x; // calculate the new vector x
        c.velocity.y -= velocityChange.y; // calculate the new vector y
      }
      else{
        c.velocity.x -= 2 * velocityChange.x; // calculate the new vector x
        c.velocity.y -= 2 * velocityChange.y; // calculate the new vector y
      }
    }
}

void circle_circle_CollisionD (circle c1, circle c2){
    // check if circles are intersecting
    float distanceBetweenCirclesSquared = (c2.position.x - c1.position.x) * (c2.position.x - c1.position.x) + (c2.position.y - c1.position.y) * (c2.position.y - c1.position.y); //<>//
    
    if(distanceBetweenCirclesSquared < (c1.size/2 + c2.size/2) * (c1.size/2 + c2.size/2)){

      float angle = atan2(c2.position.y - c1.position.y, c2.position.x - c1.position.x);
      float distanceBetweenCircles = sqrt(distanceBetweenCirclesSquared);
      float distanceToMove = c1.size/2 + c2.size/2 - distanceBetweenCircles;
      
      // move circle 2 half of the distance away from circle 1
      c2.position.x += cos(angle) * distanceToMove/2;
      c2.position.y += sin(angle) * distanceToMove/2;
      
      // move circle 1 half of the distance away from circle 2
      c1.position.x -= cos(angle) * distanceToMove/2;
      c1.position.y -= sin(angle) * distanceToMove/2;
      
      //calculate new velocit after collision
      PVector tangentVector = new PVector(c2.position.y - c1.position.y, -(c2.position.x - c1.position.x));
      PVector tangentVectorNormalized = tangentVector.copy();
      tangentVectorNormalized.normalize();
      
      PVector relativeVelocity = new PVector(c2.velocity.x - c1.velocity.x, c2.velocity.y - c1.velocity.y);
      
      float dotProd = PVector.dot(relativeVelocity, tangentVectorNormalized);
      
      PVector velocityComponentOnTangent = PVector.mult(tangentVectorNormalized, dotProd);
      
      PVector velocityComponentPerpendicularToTangent = PVector.sub(relativeVelocity, velocityComponentOnTangent);
      
      if(velocityComponentPerpendicularToTangent.mag() < 0.02){
        c1.velocity.setMag(0);
        c2.velocity.setMag(0);
      }
      else{
        // movce circle 1 by the new velocity;
        c1.velocity.x += velocityComponentPerpendicularToTangent.x;
        c1.velocity.y += velocityComponentPerpendicularToTangent.y;
        
        // movce circle 2 by the new velocity;
        c2.velocity.x -= velocityComponentPerpendicularToTangent.x;
        c2.velocity.y -= velocityComponentPerpendicularToTangent.y;
      } 
    }
}
