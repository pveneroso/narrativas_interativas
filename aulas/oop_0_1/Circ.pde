class Circ{
  float x, y, size;
  color c;
  
  Circ(int _x, int _y){
    size = random(20,60);
    x = _x;
    y = _y;
    c = color(random(0,255),random(0,255),random(0,255));
  }
  
  void drawCirc(){
    fill(c);
    ellipse(x,y,size,size);
  }
  
  boolean checkClick(){
    if(dist(mouseX,mouseY,x,y) < size/2){
      return true;
    }
    else{
      return false;
    }
  }
}