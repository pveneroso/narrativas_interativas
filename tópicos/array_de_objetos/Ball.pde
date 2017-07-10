class Ball {
  int ball_size = 20;
  PVector ball_position;
  PVector ball_velocity = new PVector(0, 0);
  PVector ball_acceleration = new PVector(0, 0);
  color default_color = color(255, 255, 255);
  float ball_mag = random(0.1,3.7);
  PVector store_mouse;
  boolean follow_mouse = false;

  Ball() {
    float ball_x = random(0, width);
    float ball_y = random(0, height);
    ball_position = new PVector(ball_x, ball_y);
  }

  void drawBall() {
   
    calculateAcceleration();
    ball_velocity.add(ball_acceleration);
    ball_position.add(ball_velocity);
    ball_velocity.limit(2);
    limitBoundaries();
    stroke(180);
    fill(default_color);
    ellipse(ball_position.x, ball_position.y, ball_size, ball_size);
    if(follow_mouse){
      representDirectionOfMovement();
    }
    
  }

  void calculateAcceleration() {
    if(follow_mouse){
      PVector mouse = new PVector(mouseX, mouseY);
      mouse.sub(ball_position);
      mouse.setMag(ball_mag);
      store_mouse = new PVector(mouse.x,mouse.y);
      //PVector temp = PVector.random2D();
      //mouse.add(temp);
      ball_acceleration = mouse;
    }
    else{
      ball_acceleration = PVector.random2D();
    }
  }
  
  void representDirectionOfMovement(){
    pushMatrix();
    translate(ball_position.x, ball_position.y);
    rotate(store_mouse.heading());
     //rotate(ball_acceleration.heading());
    stroke(0);
    line(0,0,20,0);
    popMatrix();
  }

  void limitBoundaries() {
    if (ball_position.x <=0 || ball_position.x >= width) {
      ball_velocity.x = -ball_velocity.x;
    }
    if (ball_position.y <=0 || ball_position.y >= height) {
      ball_velocity.y = -ball_velocity.y;
    }
  }

  void colorRed() {
    default_color = color(255, 0, 0);
  }

  PVector getBallPosition() {
    return ball_position;
  }
  
  void toggleFollow(){
    follow_mouse = !follow_mouse;
  }
}