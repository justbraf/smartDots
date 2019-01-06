class Barriers{
  Obstacles[] blocks;
  
  Barriers(int size){
    blocks = new Obstacles[size];
    for (int i=0; i<size; i++){
      int xPos = (int)random(size);
      if (xpos < 1){
        xpos=1;
      }
      
      //blocks[i] = new Obstacles();
    }
  }
}
