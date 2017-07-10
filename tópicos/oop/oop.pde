Ball[] balls;
int number_of_balls = 10;

void setup(){
  size(500,500);
  balls = new Ball[number_of_balls];
  for(int i = 0; i < number_of_balls; i++){
    balls[i] = new Ball(-2,2);
  }
  smooth();
  noStroke();
}

void draw(){
  background(255);
  //fill(255,255,255,10);
  //rect(0,0,width,height);
  for(int i = 0; i < balls.length; i++){
    balls[i].updateBall();
  }
}