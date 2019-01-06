class Barriers{
  Obstacle[] blocks;
  
  Barriers(int size){
    blocks = new Obstacle[size];
    for (int i=0; i<size; i++){
      int xPos = (int)random(size);
      if (xPos < 1){
        xPos=1;
      }
      
      //blocks[i] = new Obstacles();
    }
  }
}
