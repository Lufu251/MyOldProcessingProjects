class tile{
  int x, y;
  int s = 40;
  item content;
 tile(int xpos, int ypos){
   float r = random(1);
   if(r < 0.5){
     content = new item("sword");
   }
   else{
     content = new item("bow");
   }
   x = xpos;
   y = ypos;
 }
 
 void display(){
   fill(230,230,230);
   rect(x, y, s, s);
   if(content.type == "sword"){
     //image(sword, x +5, y +5, 30,30);
     fill(0,200,0);
     rect(x +5, y +5, 30,30);
   }
   else{
     //image(bow, x +5, y +5, 30,30);
     fill(200,0,0);
     rect(x +5, y +5, 30,30);
   }
 }
 
 boolean interact(){
   if(mouseX < x + s && mouseX > x && mouseY < y + s && mouseY > y && mousePressed == true){
     return true;
   }
   return false;
 }
}
