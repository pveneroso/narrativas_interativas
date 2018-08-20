class Rect{
  float x, y, size;
  color c;
  
  Rect(int _x, int _y){
    size = random(20,60);
    x = _x;
    y = _y;
    c = color(random(0,255),random(0,255),random(0,255));
  }
  
  void drawRect(){
    fill(c);
    rect(x,y,size,size);
  }
  
  boolean checkClick(){
    if(mouseX > x && mouseX < x+size && mouseY > y && mouseY < y+size){
      return true;
    }
    else{
      return false;
    }
  }
}