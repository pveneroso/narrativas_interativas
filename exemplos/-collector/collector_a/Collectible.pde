class Collectible{
  float x, y, radius;
  color cor;
  boolean delete = false;
   
  Collectible(){
    cor = color(int(random(0,255)),int(random(0,255)),int(random(0,255)));
    radius = random(10,30);
    x = random(radius, width-radius);
    y = random(radius, height-radius);
  }
  
  void drawCollectible(){
    if(!delete){
      noStroke();
      fill(cor);
      ellipse(x, y, radius*2, radius*2);
    }
  }
  
  boolean checkCollision(float px, float py, float pr){
    if(dist(x,y,px,py) <= radius+pr && !delete){
      delete = true;
      return true;
    }
    else{
      return false;
    }
  }
}