class Goal{
  PVector pos;
  
  Goal(){
    pos = new PVector(400,10);        
  }
  
  void show(){
    fill (255,0,0);
    ellipse(pos.x,pos.y,10,10);
  }
  
  float getX(){
    return pos.x;
  }
  
  float getY(){
    return pos.y;
  }
}
