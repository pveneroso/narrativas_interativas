Ball ball1, ball2, ball3;

void setup(){
  size(500,500);
  ball1 = new Ball(-2,2);
  ball2 = new Ball(-2,2);
  ball3 = new Ball(-2,2);
  smooth();
  noStroke();
}

void draw(){
  background(255);
  ball1.updateBall();
  ball2.updateBall();
  ball3.updateBall();
}