class Obstacles{
  
  int x, y, obsLen, obsWid;
  
  Obstacles(int xVal, int yVal, int xLen, int yLen){
    x = xVal;
    y = yVal;
    obsLen = xLen;
    obsWid = yLen;
  }
  
  void show(){
    fill(0,0,255);
    //rect(100,300,600,10);
    rect(x, y, obsLen, obsWid);
  }
  
  PVector getRectA(){
    return new PVector(x, y);
  }
  
  PVector getRectB(){
    return new PVector(x+obsLen, y);
  }
  
  PVector getRectC(){
    return new PVector(x+obsLen, y+obsWid);
  }
  
  PVector getRectD(){
    return new PVector(x, y+obsWid);
  }
}
