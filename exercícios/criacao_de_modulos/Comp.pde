class Comp{
  float x,y,w,h;
  int columns;
  float column_offset;
  color c, cs;
  
  Comp(float _x, float _y){
    w = random(50,150);
    h = random(50,150);
    x = _x;
    y = _y;
    c = color(int(random(0,255)),int(random(0,255)),int(random(0,255)));
    columns = int(random(0,10));
    column_offset = w/(columns+1);
    float mean = (red(c)+green(c)+blue(c))/3;
    if(mean>127){
      cs = color(0);
    }
    else{
      cs = color(255);
    }
  }
  
  void draw(){
    noStroke();
    fill(c);
    rect(x,y,w,h);
    stroke(cs);
    for(int i = 0; i < columns; i++){
      line(x+(column_offset*(i+1)),y,x+(column_offset*(i+1)),y+h);
    }
  }
  
}