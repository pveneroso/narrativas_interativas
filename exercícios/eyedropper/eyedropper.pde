PImage imagem;
color cor;
boolean lupa = false;
boolean lock_position = false;
float x, y;

void setup(){
  size(800,800);
  imagem = loadImage("bottom.jpg");
  imagem.resize(width, height);
  imagem.loadPixels();
}

void draw(){
  image(imagem, 0, 0);
  if(lupa == true){
    fill(cor);
    if(!lock_position){
      ellipse(mouseX, mouseY, 100,100);
    }
    else{
      ellipse(x, y, 100,100);
    }
  }
}

void mousePressed(){
  int index = (mouseY*width)+mouseX;
  cor = imagem.pixels[index];
  lupa = true;
  lock_position = false;
}

void mouseDragged(){
  int index = (mouseY*width)+mouseX;
  cor = imagem.pixels[index];
  lupa = true;
}

void mouseReleased(){
  x = mouseX;
  y = mouseY;
  lock_position = true;
  //lupa = false;
}