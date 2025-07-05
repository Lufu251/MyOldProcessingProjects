class Cell{
  int x, y, i, j;
  int setPoint;
  float nowTemp;
  boolean heatSource = false;
  boolean isolator = false;
  float isolation = 1;
  int spreadRate = 100;
  int colour;
  Cell(int xp, int yp){
    x = xp;
    y = yp;
    setPoint = setPoint - ((yp / ysize) /1);
    nowTemp = setPoint;
    i = xp /20;
    j = yp /20;
  }
  void render(){
    if(isolator == true){
      fill(200,200,200);
    }
    else if(heatSource == true){
    fill(200,0,0);
    }
    else{
      colour = round(map(nowTemp, -20, 40, 0, 255));
    fill(0,colour,255);
    }
    rect(x, y, 20, 20);
    textSize(10);
    fill(0,0,0);
    text(""+ round(nowTemp), x+ 2, y +20);
  }
  
  void heatSource(){
    if(heatSource == true){
      nowTemp += 1.5;
    }
  }
  void temp(){
    if(nowTemp > setPoint){
      nowTemp -= 0.02;
    }
    else{
     nowTemp += 0.02; 
    }
  }
  
  void change(){
    if(mouseX > x && mouseY > y && mouseX < x + 20 && mouseY < y + 20 && mousePressed == true && (mouseButton == RIGHT)){
      heatSource = true;
      isolator = false;
      nowTemp = 100;
      isolation = 1;
    }
    if(mouseX > x && mouseY > y && mouseX < x + 20 && mouseY < y + 20 && mousePressed == true && (mouseButton == LEFT)){
      isolator = true;
      heatSource = false;
      isolation = 0.6;
    }
    if(mouseX > x && mouseY > y && mouseX < x + 20 && mouseY < y + 20 && keyPressed == true){
      isolator = false;
      heatSource = false;
      isolation = 1;
    }
  }
  void exchangeHeat(){
    float dif = 0;
    //right
    if(i -1 < 0){

    }
    else if(nowTemp < grid[i-1][j].nowTemp){
      dif = grid[i-1][j].nowTemp - nowTemp;
      nowTemp += (dif/spreadRate)*isolation;
      grid[i-1][j].nowTemp -= (dif/spreadRate)*isolation;
    }

    //bottom
    if(j -1 < 0){

    }
    else if(nowTemp < grid[i][j-1].nowTemp){
      dif = grid[i][j-1].nowTemp - nowTemp;
      nowTemp += (dif/spreadRate)*isolation;
      grid[i][j-1].nowTemp -= (dif/spreadRate)*isolation;
    }
    
    //left
    if(i +1 > xsize-1){

    }
    else if(nowTemp < grid[i+1][j].nowTemp){
      dif = grid[i+1][j].nowTemp - nowTemp;
      nowTemp += (dif/spreadRate)*isolation;
      grid[i+1][j].nowTemp -= (dif/spreadRate)*isolation;
    }
    
    //top
    if(j +1 > ysize -1){

    }
    else if(nowTemp < grid[i][j+1].nowTemp){
      dif = grid[i][j+1].nowTemp - nowTemp;
      nowTemp += (dif/spreadRate)*isolation;
      grid[i][j+1].nowTemp -= (dif/spreadRate)*isolation;
    }
  }
}  
