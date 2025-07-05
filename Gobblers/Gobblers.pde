ArrayList<Creature> creatures = new ArrayList<Creature>();
ArrayList<Organic> organics = new ArrayList<Organic>();

Game_Handler game_H = new Game_Handler();
Overlay_Handler overlay_H = new Overlay_Handler();

int screen_X = 1000;
int screen_Y = 1000;

int speed_UP = 1;

boolean released;

void setup(){
  size(1000,1000, P2D);
  
  game_H.initialize();
  
}

void draw(){
  
  //Game_Logic Loop
  
  for(int s = 0; s < speed_UP; s++){
  game_H.spawn_Organics();
  
  //loop Creatures Logic
  for (int i = 0; i < creatures.size(); i++) {
      Creature creature = creatures.get(i);
      creature.count_Time_Alive();
      
      creature.behaviour(reproduce_Threshold);
      
      game_H.check_Creature_on_Organic(i);
      game_H.keep_In_Frame(i);
      
      game_H.remove_Dead_Creatures(i);
    }
  }
  
  
  
  
  //Game Display Loop
  
  //loop Creatures Display
  
  background(200,200,200);
  overlay_H.reset_Variables();
  
  
    for (int i = 0; i < creatures.size(); i++) {
      Creature creature = creatures.get(i);
      creature.display();
      
      overlay_H.select_Creature(i);
      
      overlay_H.creature_Text(i);
      overlay_H.speed_Calc(i);
      overlay_H.size_Calc(i);
      overlay_H.highlight_Oldest_Creature();
      overlay_H.highlight_Selected_Creature();
    }
    
  //loop Organics Display
  for (int i = 0; i < organics.size(); i++) {
      Organic organic = organics.get(i);
      organic.display();
    }
  
    overlay_H.overlay_Loop();
}

void keyPressed(){
  if(released == true){
    if(key == 'k'){
      speed_UP --;
      released = false;
    }
    if(key == 'l'){
      speed_UP ++;
      released = false;
    }
    if(key == 'o'){
      speed_UP = 0;
      released = false;
    }
    if(key == 'p'){
      speed_UP += 10;
      released = false;
    }
  }
  
}

void keyReleased(){
  released = true;
  
}
