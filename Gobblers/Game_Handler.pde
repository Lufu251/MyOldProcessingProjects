//Organic
int max_organic = 1000;
int organic_Spawn_Delay = 2;

//Energy
int organic_Energy_Amount = 20;
float passiv_Energy_Loss = 0.08;

//Reproduction
int reproduce_Threshold = 160;
int reproduce_Cost = 80;
int mutate_Chance = 5; //in %

//Helper Variables
int organic_Delay_Counter = 0;


class Game_Handler{
  Game_Handler(){
  
  }
  
  void initialize(){
  
  creatures.add(new Creature(100,100, 80));
    for(int c = 0; c < max_organic; c++){
      float rx = random(0,screen_X);
      float ry = random(0,screen_Y);
      organics.add(new Organic((int)rx,(int)ry));
    }
  }
  
  void spawn_Organics(){
    if(organic_Delay_Counter >= organic_Spawn_Delay){
    if(organics.size() < max_organic){
      float rx = random(0,screen_X);
      float ry = random(0,screen_Y);
      organics.add(new Organic((int)rx,(int)ry));
    }
      organic_Delay_Counter = 0;
    }
    organic_Delay_Counter ++;
  }
  
  void remove_Dead_Creatures(int i){
      if(creatures.get(i).energy <= 0)
       creatures.remove(i);
  }
  
  void check_Creature_on_Organic(int i){
      Creature cre = creatures.get(i);
      for (int j = 0; j < organics.size(); j++) {
        Organic org = organics.get(j);
        
        float x_Distance = cre.x - org.x;
        float y_Distance = cre.y - org.y;
        float distance = sqrt(x_Distance * x_Distance + y_Distance * y_Distance);
        
        if(distance <= cre.s/2 + org.s/2){
           cre.add_Energy(organic_Energy_Amount);
           organics.remove(j);
        }
      }
  }
  
  void keep_In_Frame(int i){
      Creature cre = creatures.get(i);
      if(cre.x < 0){
          cre.x = screen_X;
      }
      if(cre.x > screen_X){
          cre.x = 0;
      }
      if(cre.y < 0){
          cre.y = screen_Y;
      }
      if(cre.y > screen_Y){
          cre.y = 0;
      }
    }
}
