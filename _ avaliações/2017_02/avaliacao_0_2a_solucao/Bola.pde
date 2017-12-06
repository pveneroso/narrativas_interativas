class Bola{
  boolean fixa = false;
  float ax, ay, x, y, raio;
  color c;
  
  Bola(){
    raio = random(10,30);
    x = random(raio,width-raio);
    y = random(raio,height-raio);
    ax = random(-1,1);
    ay = random(-1,1);
    c = color(int(random(0,255)),int(random(0,255)),int(random(0,255)));
  }
  
  void desenhar(){
    if(!fixa){
      mover();
      fill(c);
    }
    else{
      fill(255);
    }
    noStroke();
    ellipse(x, y, raio*2, raio*2);
  }
  
  void mover(){
    colisao();
    x+=ax;
    y+=ay;
  }
  
  void colisao(){
    boolean toque = false;
    if(x+ax <= raio || x+ax >= width-raio){
      ax*=-1;
      toque = true;
    }
    if(y+ay <= raio || y+ay >= height-raio){
      ay*=-1;
      toque = true;
    }
    if(toque){
      c = color(int(random(0,255)),int(random(0,255)),int(random(0,255)));
    }
  }
  
  void clique(){
    if(dist(mouseX,mouseY,x,y) < raio)
    fixa = !fixa;
  }
}