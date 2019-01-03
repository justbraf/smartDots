Population Zany;
Goal goal;

void setup(){
 size(800,800);
 Zany = new Population(1000);
 goal = new Goal();
}

void draw(){
  background(255);
  goal.show();
  fill(0,0,255);
  rect(100,300,600,10);
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
