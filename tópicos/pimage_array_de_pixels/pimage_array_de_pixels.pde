PImage imagem;

void setup(){
  size(800,600);
  imagem = loadImage("12.jpg");
  imagem.resize((height*imagem.width)/imagem.height,height);
  image(imagem, 0, 0);
}

void draw(){
  
}