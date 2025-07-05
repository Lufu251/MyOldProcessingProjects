vector_2d shake_offset = new vector_2d(0,0);
vector_2d world_offset = new vector_2d(0,0);
vector_2d offset = new vector_2d(0,0);
float t;
PImage img;

vector_2d vec = new vector_2d(1, 0.7);

void setup(){
  size(1280, 720);
  img = loadImage("picture.jpg");
}

void draw(){
  offset.x = shake_offset.x + world_offset.x;
  offset.y = shake_offset.y + world_offset.y;
  
  background(0,0,0);
  image(img, offset.x + 0, offset.y + 0);
  ellipse(offset.x + 400, offset.y + 400, 80, 80);
  if(keyPressed == true)
  shake_screen(4, vec);
  else{
   shake_offset.x = 0;
   shake_offset.y = 0;
  }
  
}



void shake_screen(int intensity, vector_2d direction){
  //float n = random(1);
  float n = noise(t);
  //normalize the input direction vector.
  direction.normalize();
  
  shake_offset.x = direction.x * map(n, 0,1, -intensity, intensity);
  shake_offset.y = direction.y * map(n, 0,1, -intensity, intensity);
  
  t += 0.3;
}
