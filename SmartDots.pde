Population Zany;
Goal goal;
//Obstacle blockThem;
Barriers blockThem;

void setup(){
 size(800,800);
 Zany = new Population(1000);
 goal = new Goal();
 //blockThem = new Obstacle(100,300,600,10);
  blockThem = new Barriers(3);
}

void draw(){
  background(255);
  goal.show();
  blockThem.show();
  if (Zany.allDotsDead()){
    Zany.calculateFitness();
    Zany.naturalSelection();
    Zany.mutations();   
  } else {
    Zany.update();
    Zany.show();
    fill(0);
    text("Generation "+Zany.generation,700,10);
    text("Min Steps "+Zany.minStep,700,25);
  }
  
}
