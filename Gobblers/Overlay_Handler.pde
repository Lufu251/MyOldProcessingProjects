class Overlay_Handler{
  
  int calc_Counter = 0;
  float average_Speed = 0;
  float average_Size = 0;
  float max_Size_Creature = 0;
  float min_Size_Creature = 0;
  float max_Speed_Creature = 0;
  float min_Speed_Creature = 0;
  float all_Size = 0;
  float all_Speed = 0;
  
  int selected_Creature_Index = 0;
  
  Overlay_Handler(){
    
    
    
  }  
  
  void overlay_Loop(){
    if(calc_Counter >= 20){
      
      calc_Counter = 0;
    }
    
    //Display
    screen_Text();
    
    
    calc_Counter ++;
  }
  
  void creature_Text(int i){
    textSize(12);
    textAlign(CENTER);
    fill(0,0,0);
    text((int)creatures.get(i).energy, creatures.get(i).x,creatures.get(i).y + creatures.get(i).s/2 + 10);
    text((int)creatures.get(i).mutation_Counter, creatures.get(i).x,creatures.get(i).y + creatures.get(i).s/2 + 20);
    text((int)creatures.get(i).time_Alive / 100, creatures.get(i).x,creatures.get(i).y + creatures.get(i).s/2 + 30);
  }
  
  void screen_Text(){
    textSize(16);
    textAlign(LEFT);
    fill(0,0,0);
    text("Creatures: " + creatures.size(), 10,25);
    
    text("av. Size: " + average_Size, 10, 41);
    text("max Size: " + max_Size_Creature, 10, 57);
    text("min Size: " + min_Size_Creature, 10, 73);
    text("av. Speed: " + average_Speed, 10, 89);
    text("max Speed: " + max_Speed_Creature, 10, 105);
    text("min Speed: " + min_Speed_Creature, 10, 121);
    
    textAlign(RIGHT);
    text("L+K Speed: " + speed_UP,screen_X, 25);
    
    
  }
  
    void size_Calc(int i){
      Creature creature = creatures.get(i);
      
        all_Size += creature.s;
        
        //calculate max size
        if(creature.s > max_Size_Creature){
            max_Size_Creature = creature.s;
        }
        
        //calculate min size
        if(creature.s < min_Size_Creature || min_Size_Creature == 0){
            min_Size_Creature = creature.s;
        }
        
      average_Size = all_Size / creatures.size();
    }
    
    void speed_Calc(int i){

      Creature creature = creatures.get(i);
      
      all_Speed += creature.speed;
      
      //calculate max speed
      if(creature.speed > max_Speed_Creature){
            max_Speed_Creature = creature.speed;
        }
      
      //Calculate min speed
      if(creature.speed < min_Speed_Creature || min_Speed_Creature == 0){
            min_Speed_Creature = creature.speed;
        }
      println(creatures.size());
      average_Speed = all_Speed / creatures.size();
    }
    
    
    void highlight_Selected_Creature(){
      Creature creature = creatures.get(selected_Creature_Index);
      fill(100,100,255);
      ellipse(creature.x, creature.y, creature.s, creature.s);
    }
    
    void select_Creature(int i){
      if(mousePressed == true){
        Creature creature = creatures.get(i);
        float x_Dist = mouseX - creature.x;
        float y_Dist = mouseY - creature.y;
        float d_Dist = sqrt(sq(x_Dist) + sq(y_Dist));
        if(d_Dist < creature.s /2){
          selected_Creature_Index = i;
        }
      }
    }
    
    void highlight_Oldest_Creature(){
      Creature creature = creatures.get(selected_Creature_Index);
      fill(255,255,255);
      ellipse(creature.x, creature.y, creature.s, creature.s);
    }
    
    void reset_Variables(){
      all_Speed = 0;
      max_Speed_Creature = 0;
      min_Speed_Creature = 0;
      
      all_Size = 0;
      max_Size_Creature = 0;
      min_Size_Creature = 0;
    }
  
}
