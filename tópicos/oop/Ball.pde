class Ball{
  float velocity_x, velocity_y;
  float x, y;
  float size;
  int offset = 100;
  color ball_color;
  PVector direction;
  
  Ball(float min, float max){
    velocity_x = random(min,max);
    velocity_y = random(min,max);
    x = random(offset,width-offset);
    y = random(offset,height-offset);
    size = random(40,80);
    ball_color = color(int(random(0,255)),int(random(0,255)),int(random(0,255)));
  }
  
  //Ball(float min_x, float max_x, float min_y, float max_y){
  //  velocity_x = random(min_x,max_x);
  //  velocity_y = random(min_y,max_y);
  //  x = random(offset,width-offset);
  //  y = random(offset,height-offset);
  //  size = random(40,80);
  //  ball_color = color(int(random(0,255)),int(random(0,255)),int(random(0,255)));
  //}
  
  void updateBall(){
    x += velocity_x;
    y += velocity_y;
    if(x <= size/2 || x >= width-(size/2)){
      velocity_x *= -1;
    }
    if(y <= size/2 || y >= height - (size/2)){
      velocity_y *= -1;
    }
    noStroke();
    fill(ball_color);
    ellipse(x,y,size,size);
    //drawDirectionLine();
  }
  
  //void drawDirectionLine(){
  // direction = new PVector(velocity_x,velocity_y);
  // direction.mult(20);
  // stroke(80);
  // pushMatrix();
  //   translate(x,y);
  //   rotate(direction.heading());
  //   line(size/2,0,size/2+direction.mag(),0);
  //   line(size/2+direction.mag(),0,size/2+direction.mag()-5,-5);
  //   line(size/2+direction.mag(),0,size/2+direction.mag()-5,+5);
  // popMatrix();
  //}
  
}