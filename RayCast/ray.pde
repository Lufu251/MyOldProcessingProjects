//grid based ray square collision
class ray{
  int curX,curY;
  int gridPosX, gridPosY;
  float raySlope;
  float cornerSlope;
 ray(){
   
 }
 
  void cast(int x1, int y1, int x2, int y2, int gridSize, int maxDistance){
   curX = x1;
   curY = y1;
   gridPosX = x1 / gridSize;
   gridPosY = y1 / gridSize;
   float dirX = x2 - x1;
   float dirY = y2 - y1;
   raySlope = dirY / dirX;
   
   for(int i=0; i< maxDistance; i++){ //<>//
     
     //if the ray points in exact 90 degrees around the origin
     if(dirX == 0 && dirY < 0){
       //top
       gridPosY --;
     }
     else if(dirX > 0 && dirY == 0){
       //rigth
       gridPosX ++;
     }
     else if(dirX == 0 && dirY > 0){
       //bottom
       gridPosY ++;
     }
     else if(dirX < 0 && dirY == 0){
       //left
       gridPosX --;
     }
     
   //calc top left corner
   if(dirX < 0 && dirY < 0){
     float disX = gridPosX * gridSize - curX;
     float disY = gridPosY * gridSize - curY;
      
      if(disX == 0){
        disX -= 0.1;
      }
      
     //calculate the slope from the ray to the corner
     cornerSlope = disY / disX;
     
     //check if the slope from the ray is bigger
     if(raySlope > cornerSlope){
       //top
       gridPosY --;
     }
     else{
       //left
       gridPosX  --;
     }
   }
   
   
   //calc top rigth corner
   if(dirX > 0 && dirY < 0){
     float disX = gridPosX * gridSize + gridSize  - curX;
     float disY = gridPosY * gridSize  - curY;
     
     //calculate the slope from the ray to the corner
     cornerSlope = disY / disX;
     
     //check if the slope from the ray is bigger
     if(raySlope > cornerSlope){
       //rigth
       gridPosX ++;
     }
     else{
       //top
       gridPosY --;
     }
   }
   
   
   //calc bottom left corner
   if(dirX < 0 && dirY > 0){
     float disX = gridPosX * gridSize  - curX;
     float disY = gridPosY * gridSize + gridSize  - curY;
     
     if(disX == 0){
        disX -= 0.1;
      }
     
     //calculate the slope from the ray to the corner
     cornerSlope = disY / disX;
     
     //check if the slope from the ray is bigger
     if(raySlope > cornerSlope){
       //left
       gridPosX --;
     }
     else{
       //bottom
       gridPosY ++;
     }
   }
   
   
   //calc bottom rigth corner
   if(dirX > 0 && dirY > 0){
     float disX = gridPosX * gridSize + gridSize  - curX;
     float disY = gridPosY * gridSize + gridSize  - curY;
     
     //calculate the slope from the ray to the corner
     cornerSlope = disY / disX;
     
     //check if the slope from the ray is bigger
     if(raySlope > cornerSlope){
       //bottom
       gridPosY ++;
     }
     else{
       //rigth
       gridPosX ++;
     }
   }
   fill(100,0,0);
   rect(gridPosX * gridSize, gridPosY * gridSize, gridSize, gridSize);
   }
  }
 }
