class Barriers{
  Obstacle[] blocks;
  
  Barriers(int size){
    blocks = new Obstacle[size];
    for (int i=0; i<size; i++){
      blocks[i] = new Obstacle(random(100,width-100),random(200,height-200),random(100,width+100),10);
    }
  }
}
