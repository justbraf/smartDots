class Barriers{
  Obstacle[] blocks;
  
  Barriers(int size){
    randomSeed(second());
    blocks = new Obstacle[size];    
    for (int i=0; i<size; i++){
      blocks[i] = new Obstacle(random(0,width-400), random(200,height-200), random(400,width/2+100), 10);
    }
  }
  
  void show(){
    for (int i=0; i<blocks.length; i++){
      blocks[i].show();
    }
  }
  
  float calcTriArea(PVector point, PVector triA, PVector triB){
    float sideA = PVector.dist(point, triA);
    float sideB = PVector.dist(triA, triB);
    float sideC = PVector.dist(point, triB);
    float halfPerim = (sideA + sideB + sideC)/2.0;
    return sqrt(halfPerim*(halfPerim-sideA)*(halfPerim-sideB)*(halfPerim-sideC));
  }
  
  boolean collisionCheck(Dot dotCrash){
    for (int i=0; i<blocks.length; i++){
      float rectArea = PVector.dist(blocks[i].getRectA(),blocks[i].getRectB()) * PVector.dist(blocks[i].getRectB(), blocks[i].getRectC());
      if ((int)rectArea > (int)(calcTriArea(dotCrash.pos, blocks[i].getRectA(), blocks[i].getRectB()) + calcTriArea(dotCrash.pos, blocks[i].getRectC(), blocks[i].getRectB()) + calcTriArea(dotCrash.pos, blocks[i].getRectC(), blocks[i].getRectD()) + calcTriArea(dotCrash.pos, blocks[i].getRectA(), blocks[i].getRectD()))){      
        return true;
      }
    }
    return false;
  }
}
