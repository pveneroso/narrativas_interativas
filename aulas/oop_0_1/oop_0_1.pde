ArrayList<Rect> rects = new ArrayList<Rect>();
ArrayList<Circ> circs = new ArrayList<Circ>();

void setup(){
  size(500,500);
  smooth();
}

void draw(){
  background(200);
  for(int i = 0; i < rects.size(); i++){
    Rect rect = rects.get(i);
    rect.drawRect();
  }
  
  for(int i = 0; i < circs.size(); i++){
    Circ circ = circs.get(i);
    circ.drawCirc();
  }
}

void mousePressed(){
  if(mouseButton == LEFT){
    boolean match = false;
    for(int i = 0; i < rects.size(); i++){
      Rect rect = rects.get(i);
      if(rect.checkClick()){
        rects.remove(i);
        match = true;
      }
    }
    if(!match){
      rects.add(new Rect(mouseX, mouseY));
    }
  }
  else if(mouseButton == RIGHT){
    boolean match = false;
    for(int i = 0; i < circs.size(); i++){
      Circ circ = circs.get(i);
      if(circ.checkClick()){
        circs.remove(i);
        match = true;
      }
    }
    if(!match){
      circs.add(new Circ(mouseX, mouseY));
    }
  }
}