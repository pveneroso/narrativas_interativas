class Ball{
  float speed_x, speed_y;
  float x, y;
  float size;
  int offset = 100;
  color ball_color;
  PVector direction;
  
  Ball(float min, float max){
    speed_x = random(min,max);
    speed_y = random(min,max);
    x = random(offset,width-offset);
    y = random(offset,height-offset);
    size = random(40,80);
    ball_color = color(int(random(0,255)),int(random(0,255)),int(random(0,255)));
  }
  
  void updateBall(){
    x += speed_x;
    y += speed_y;
    if(x <= size/2 || x >= width-(size/2)){
      speed_x *= -1;
    }
    if(y <= size/2 || y >= height - (size/2)){
      speed_y *= -1;
    }
    noStroke();
    fill(ball_color);
    ellipse(x,y,size,size);
  }
  
}