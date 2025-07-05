class vector_2d {
  float x, y;
  
 vector_2d(float size_x, float size_y){
   x = size_x;
   y = size_y;
 }
  void normalize(){
  float length = sqrt(x * x + y * y);
  x /= length;
  y /= length;
  }

}
