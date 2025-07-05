ArrayList<tile> inventory = new ArrayList<tile>();
//PImage sword = loadImage("sword.jpg");
//PImage bow = loadImage("bow.jpg");
int iSelect = -1;


void setup(){
  size(800,800);
  inventory.add(new tile(100, 200));
  inventory.add(new tile(100, 300));
  inventory.add(new tile(100, 400));
  for(int i=0; i < 10; i++){
    inventory.add(new tile(i *10 + i*50 + 100, 100));
  }
  
}

void draw(){
  background(100);
  for(int i=0; i < inventory.size(); i++){
  inventory_manager(i);
  inventory.get(i).display();
  
  }
  
}

void inventory_manager(int i){
  if(inventory.get(i).interact()){
      if(iSelect == -1){
        iSelect = i;
      }
      else if(i != iSelect){
        item item1 = inventory.get(iSelect).content;
        item item2 = inventory.get(i).content;
        inventory.get(iSelect).content = item2;
        inventory.get(i).content = item1;
        iSelect = -1;
      }
    }
}
