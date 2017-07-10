PImage teste;
color cor;
int inc = 5;

void setup(){
  size(700,700);
  cor = 0;
  teste = createImage(width,height,RGB);
}

// USANDO PONTOS E MODULO
//void draw(){
// background(255);
// for(int i = 0; i < width*height; i++){
//  int x = i%width;
//  int y = floor(i/width);
//  stroke(cor);
//  point(x,y);
// }
// cor+=inc;
// cor = (cor+inc)%255;
// println(frameRate);
//}

// USANDO ARRAY DE PIXELS
void draw(){
background(255);
teste.loadPixels();
for(int i = 0; i < teste.pixels.length; i++){ 
    teste.pixels[i] = color(cor,cor,cor);
}
teste.updatePixels();
image(teste,0,0);
 
  // IDA
//cor = (cor+inc)%255;
 
  // IDA E VOLTA
if(cor+inc > 255 || cor+inc < 0){
inc *= -1;
}
cor+=inc;
println(frameRate);
}