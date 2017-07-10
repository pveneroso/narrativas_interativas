Ball[] balls;
int timer = 100;

void setup(){
  size(800,800);
  background(127);
  balls = new Ball[1000];
  for(int i = 0; i < balls.length; i++){
    balls[i] = new Ball();
  }
}

void draw(){
  if(timer == 100 || timer < 0){
    fill(127);
    noStroke();
    rect(0,0,width,height);
    fill(255);
    stroke(90);
    smooth();
    for(Ball b : balls){
      b.drawBall();
    }
  }
  timer--;
  println(frameRate);
}