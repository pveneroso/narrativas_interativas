Ball[] balls;
PFont subs;

void setup(){
  size(800,800);
  subs = createFont("Helvetica-10.vlw",10);
  textFont(subs);
  balls = new Ball[100];
  for(int i = 0; i < balls.length; i++){
    balls[i] = new Ball();
  }
  //balls[50].colorRed();
}

void draw(){
  fill(127);
  noStroke();
  smooth();
  rect(0,0,width,height);
  for(int i = 0; i < balls.length; i++){
    balls[i].drawBall();
    PVector position = balls[i].getBallPosition();
    fill(0);
    textAlign(CENTER);
    text(i,position.x,position.y+24);
  }
}

void mousePressed(){
  for(int i = 0; i < balls.length; i++){
    balls[i].toggleFollow();
  }
}