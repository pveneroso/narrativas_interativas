class Square{
  float x, y, w, h;
  color[] c;
  int the_color = 0;
  
  Square(float in_x, float in_y, float in_w, float in_h, color in_c){
    x = in_x;
    y = in_y;
    w = in_w;
    h = in_h;
    c = new color[2];
    c[0] = in_c;
    c[1] = 127;
  }
  
  void drawSquare(){
    stroke(0);
    fill(c[the_color]);
    rect(x,y,w,h);
  }
  
  boolean checkClick(){
    boolean collide = false;
    if(mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h){
      collide = true;
    }
    return collide;
  }
  
  void toggleColor(){
    if(the_color == 0){
      the_color = 1;
    }
    else{
      the_color = 0;
    }
  }
  
}