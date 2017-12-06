class Image{
  PImage image;
  int w, h;
  float x, y;
  boolean dragging = false;
  int id;
  float mOX, mOY;
  boolean show = true;
  int wb, hb;
  float xb, yb;
  
  Image(int in_id, float in_xb, float in_yb, int in_wb, int in_hb){
    id = in_id;
    image = loadImage(in_id+".jpg");
    w = int(random(60,300));
    h = int((w*image.height)/image.width);
    image.resize(w,h);
    x = random(0,width-w);
    y = random(0,height-h);
    xb = in_xb;
    yb = in_yb;
    wb = in_wb;
    hb = in_hb;
  }
  
  void display(){
    if(dragging){
      x = mouseX-mOX;
      y = mouseY-mOY;
    }
    image(image,x,y);
  }
  
  void displayButton(){
    noStroke();
    if(show){ 
      fill(0);
    }
    else{
      fill(127);
    }
    rect(xb,yb,wb,hb);
  }
  
  void drag(){
    if(mouseX >= x && mouseX <= x+w && mouseY >= y && mouseY <= y+h){
      dragging = true;
      mOX = mouseX -x;
      mOY = mouseY -y;
    }
  }
  
  void click(){
    if(mouseX >= xb && mouseX <= xb+wb && mouseY >= yb && mouseY <= yb+hb){
      show = !show;
    }
  }
}