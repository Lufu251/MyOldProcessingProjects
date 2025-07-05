class Creature{
  
  float x ,y;
  float s = 10;
  
  float energy = 20;
  float speed = 0.4;
  
  float x_Direction;
  float y_Direction;
  
  int mutation_Counter = 0;
  int time_Alive = 0;
  
  Creature(int xp, int yp, int start_Energy){
    x = xp;
    y = yp;
    energy = start_Energy;
    
    float rad = random(0,PI*2);
    x_Direction = sin(rad);
    y_Direction = cos(rad);
    
  }
  Creature(Creature creature){
    float r_Mutate = random(0,1);
    x = creature.x;
    y = creature.y;
    mutation_Counter = creature.mutation_Counter;
    s = creature.s;
    speed = creature.speed;
    
    energy = reproduce_Cost;
    
    float rad = random(0,PI*2);
    x_Direction = sin(rad);
    y_Direction = cos(rad);
    if(r_Mutate * 100 < mutate_Chance){
      mutate();
    }
    
  }
  
  void display(){
    fill(100,100,100);
    ellipse(x,y,s,s);
  }
  
  void count_Time_Alive(){
    time_Alive ++;
  }
  
  void reproduce(){
    Creature cr = this;
    creatures.add(new Creature(cr));
  }
  
  void add_Energy(int energy_Add){
    energy += energy_Add;
  }
  
  void move(float move_x, float move_y){
    x += move_x * speed;
    y += move_y * speed;
  }
  
  void energy_Loss(int energy_Use_Base){
    energy -= energy_Use_Base * speed;
  }
  
  void mutate(){
    float r = random(0,1);
    float mutation_Value = random(-0.3,0.3);
     
     if(r <= 0.5) {
       speed += mutation_Value;
     }
     else{
       s += mutation_Value *10;
     }
     mutation_Counter ++;
  }
  
  void behaviour(int reproduce_Value){
    if(energy >= reproduce_Value){
      reproduce();
      energy -= reproduce_Cost;
    }
    move(x_Direction, y_Direction);
    energy -= pow((s/100) * speed *2, 2) + passiv_Energy_Loss;
  }
}
