class Player{
  float x, y, radius;
  float speed_factor = 4;
  
  Player(){
    x = width/2;
    y = height/2;
    radius = 20;
  }
  
  void drawPlayer(){
    fill(0);
    noStroke();
    ellipse(x,y,radius*2,radius*2);
    stroke(255);
    strokeWeight(2);
    pushMatrix();
    translate(x,y);
    rotate(radians(45));
    line(-15,0,15,0);
    line(0,-15,0,15);
    popMatrix();
  }
  
  void move(float mx, float my){
    x+=(mx*speed_factor);
    y+=(my*speed_factor);
  }
}