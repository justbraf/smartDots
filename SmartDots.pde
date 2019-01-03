Population Zany;
Goal goal;
Obstacles blockThem;

void setup(){
 size(800,800);
 Zany = new Population(1000);
 goal = new Goal();
 blockThem = new Obstacles();
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
  }
  
}
