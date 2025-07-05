class Map{
  int[][] mapGrid;
  Layer Cave;
  Layer DirtCave;
  Layer Iron;
  Layer Diamond;
  int sx;
  int sy;
 Map(int sizeX, int sizeY){
   sx = sizeX;
   sy = sizeY;
   Cave = new Layer(sizeX, sizeY, 0, 1, 0.5, 4, 5, 3);
   DirtCave = new Layer(sizeX, sizeY, 0, 2, 0.3, 4, 5, 2);
   Iron = new Layer(sizeX, sizeY, 0, 3, 0.25, 3, 7, 2);
   Diamond = new Layer(sizeX, sizeY, 0, 4, 0.25, 2, 6, 3);
   heightMask(Diamond, 130, sy, 0);
   
   stackLayer(Cave, DirtCave, 2);
   stackLayer(Cave, Iron, 3);
   stackLayer(Cave, Diamond, 4);
 }  
 
 //Stack Layers on Top and only add the LayerWriteIn
 void stackLayer(Layer Layer1, Layer Layer2, int LayerWriteInt){
   for(int x=0; x<sx ; x++){
      for(int y=0; y<sy ; y++){
        if(Layer2.grid[x][y] == LayerWriteInt){
          Layer1.grid[x][y] = Layer2.grid[x][y];
        }
      }
   }
   mapGrid = Cave.grid;
 }
 //Add a mask on the Layer to size it to specific heigth
 void heightMask(Layer layer, int start, int bottom, int mask){
   for(int x=0; x<sx ; x++){
      for(int y=0; y<start ; y++){
        layer.grid[x][y] = mask;
      }
   }
   for(int x=0; x<sx ; x++){
      for(int y=bottom; y<sy ; y++){
        layer.grid[x][y] = mask;
      }
   }
 }
}
