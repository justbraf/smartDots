class Population{
  Dot[] dots;
  float fitnessSum;
  int generation = 1;
  int bestDot = 0;
  int minStep = 400;
  
  Population (int size){
    dots = new Dot[size];
    for (int i=0; i<size; i++){
      dots[i] = new Dot();
    }
  }
  
  void show(){
    for (int i=1; i<dots.length; i++){     
      dots[i].show();
    }
    dots[0].show();
  }
  
  void update(){
    for (int i=0; i<dots.length; i++){
      if (dots[i].brain.step > minStep){
        dots[i].dead = true;
      } else if(calculateCollision(dots[i])) {
        dots[i].dead = true;
      } else{        
        dots[i].update();
      }
    }
  }
  
  void calculateFitness(){
    for (int i=0; i<dots.length; i++){      
      dots[i].calculateFitness();
    }
  }
  
  boolean allDotsDead(){
    for (int i=0; i<dots.length; i++){
      if(!dots[i].dead && !dots[i].reachedGoal){
        return false;
      }
    }
    return true;
  }
  
  void naturalSelection(){
    Dot[] newDots = new Dot[dots.length];
    setBestDot();
    calculateFitnessSum();
    newDots[0] = dots[bestDot].createClone();
    newDots[0].isBest = true;
    for (int i=1; i<newDots.length; i++){
      //Select parent based on fitness
      Dot parent = selectParent();
      //get baby from them
      newDots[i] = parent.createClone();
    }
    dots = newDots.clone();
    generation++;    
  }
  
  void calculateFitnessSum(){
    fitnessSum =0;
    for (int i=0; i<dots.length; i++){      
      fitnessSum += dots[i].fitness;
    }
  }
  
  Dot selectParent(){
    float rand = random(fitnessSum);
    float runningSum = 0;
    for (int i=0; i<dots.length; i++){
      runningSum += dots[i].fitness;
      if (runningSum > rand){
        return dots[i];
      }
    }
  return null;
  }
  
  void mutations(){
    for (int i=1; i<dots.length; i++){
      dots[i].brain.mutate();
    }
  }
  
  void setBestDot(){
    float max = 0;
    int maxIndex = 0;
    for (int i=0; i<dots.length; i++){
      if (dots[i].fitness > max){
        max = dots[i].fitness;
        maxIndex = i;
      }
    }
    bestDot = maxIndex;
    if (dots[bestDot].reachedGoal){
      minStep = dots[bestDot].brain.step;
      println("steps: "+minStep);
    }
  }
  
  float calcTriArea(PVector point, PVector triA, PVector triB){
    float sideA = PVector.dist(point, triA);
    float sideB = PVector.dist(triA, triB);
    float sideC = PVector.dist(point, triB);
    float halfPerim = (sideA + sideB + sideC)/2.0;
    return sqrt(halfPerim*(halfPerim-sideA)*(halfPerim-sideB)*(halfPerim-sideC));
  }
  
  boolean calculateCollision(Dot dotCrash){
    //(100,300,600,10)
    PVector rectA = new PVector (100,300);
    PVector rectB = new PVector (100,310);
    PVector rectC = new PVector (700,300);
    PVector rectD = new PVector (700,310);
    float rectArea = PVector.dist(rectA,rectB) * PVector.dist(rectB, rectC);
    if ((int)rectArea > (int)(calcTriArea(dotCrash.pos, rectA, rectB) + calcTriArea(dotCrash.pos, rectC, rectB) + calcTriArea(dotCrash.pos, rectC, rectD) + calcTriArea(dotCrash.pos, rectA, rectD))){      
      return true;
    } else {
      return false;
    }
  }
}
