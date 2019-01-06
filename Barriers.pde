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
}
