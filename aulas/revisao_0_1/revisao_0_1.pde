int radius = 25;
int spacing = 100;
int offset = 50;
color color_even = color(255,255,255);
color color_odd = color(0,0,0);
int columns;
int x, y;

void setup(){
  size(500,200);
  columns = width/spacing;
  y = height/2;
  smooth();
}

void draw(){
  background(200);
  //stroke(0);
  //line(0,height/2,width,height/2);
  noStroke();
  for(int i = 0; i < columns; i++){
    int x = (i*spacing)+offset;
    if(i%2 == 0){
      fill(color_even);
    }
    else{
      fill(color_odd);
    }
    ellipse(x,y,radius*2,radius*2);
  }
}

void mousePressed(){
  color temp = color_even;
  color_even = color_odd;
  color_odd = temp;
}