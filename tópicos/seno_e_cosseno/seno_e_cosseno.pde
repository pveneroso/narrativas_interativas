float x,y;
float movement_radius = 150;
float ball_radius = 60;
float angle = 0;
float delta_angle = 1.7;
float offset_x, offset_y;
color cor;

void setup(){
  size(500,500);
  background(0);
  offset_x = (width/2);
  offset_y = (height/2);
  noStroke();
  smooth();
}

void draw(){
  fill(0,20);
  rect(0,0,width,height);
  colorMode(HSB, 255);
  
  angle += delta_angle;
  cor = color(map(angle%360,0,360,0,255),127,180);
  x = sin(radians(angle))*movement_radius;
  y = cos(radians(angle))*movement_radius;
  
  fill(cor);
  ellipse(x+offset_x,y+offset_y, ball_radius, ball_radius);
}