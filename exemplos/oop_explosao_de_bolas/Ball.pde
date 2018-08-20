class Ball{
  PVector ball_position;
  PVector ball_velocity;
  PVector ball_acceleration;
  float ball_delta_velocity;
  float ball_delta_acceleration;
  float ball_angle;
  float ball_radius;
  
  Ball(){
    resetBall();
  }
  
  void resetBall(){
    //float x = width/2;
    //float y = height/2;
    //ball_position = new PVector(x, y);
     ball_position = new PVector(mouseX, mouseY);
    
    //ball_delta_velocity = 0;
    //ball_delta_velocity = random(0.1,3);
    ball_delta_acceleration = random(0.01,0.1);
    ball_radius = random(2,15);
    ball_angle = random(0,360);
    ball_velocity = PVector.fromAngle(radians(ball_angle));
    ball_velocity.mult(ball_delta_velocity);
    ball_acceleration = PVector.fromAngle(radians(ball_angle));
    ball_acceleration.mult(ball_delta_acceleration);
  }
  
  void drawBall(){
    checkBoundaries();
    ball_velocity.add(ball_acceleration);
    ball_position.add(ball_velocity);
    ellipse(ball_position.x, ball_position.y, ball_radius*2, ball_radius*2);
  }
  
  void checkBoundaries(){
    if(ball_position.x > width || ball_position.x < 0 || ball_position.y > height || ball_position.y < 0){
      resetBall();
    }
  }

}