PImage bottom;
PImage top;
PImage composite;
// 3 PImages são declaradas:
PFont display;
String text;
boolean show_text = false;

void setup(){
  size(950,950);
  smooth();
  display = loadFont("SourceSansPro-Light-24.vlw");
  textFont(display,24);
  textAlign(CENTER);
  composite = createImage(950,950,RGB);
  // composite é criada
  bottom = loadImage("bottom.jpg");
  // bottom é carregada
  top = loadImage("top.jpg");
  // top é carregada
  bottom.loadPixels();
  top.loadPixels();
  composite.loadPixels();
  // Para manipularmos um array de pixels, precisamos carregar esse array
}

void draw(){
  rect(0,0,width,height);
  image(composite,0,0);
  if(show_text){
    int index = (mouseY*width)+mouseX;
    if(index > 0 && index < composite.width*composite.height){
      color temp = composite.pixels[index];
      text = int(red(temp)) + ", " + int(green(temp)) + ", " + int(blue(temp));
      fill(255);
      text(text,mouseX,mouseY+90);
      stroke(80);
      fill(temp);
      ellipse(mouseX,mouseY,120,120);
      noStroke();
    }
  }
}

void mousePressed(){
  cursor(CROSS);
  composite.loadPixels();
  show_text = true;
}

void mouseReleased(){
  cursor(ARROW);
  show_text = false;
}

void keyPressed(){
  if(key == 'p'){
    // Intercala, horizontalmente, pixels de duas imagens
    for(int i = 0; i < width*height; i ++){
      if(i%2 == 0){
        // Se i for um número par, retorna true
        // Se i for um número ímpar, retorna false
        composite.pixels[i] = bottom.pixels[i];
        // O pixel na posição i da imagem composite é igualado ao
        // pixel na posição i da imagem bottom
      }
      else{
        composite.pixels[i] = top.pixels[i];
        // O pixel na posição i da imagem composite é igualado ao
        // pixel na posição i da imagem top
      }
    }
    composite.updatePixels();
    // Para mostrarmos uma imagem cujo array de pixels foi manipulado,
    // precisamos atualizar o array com a função updatePixels()
    //image(composite,0,0);
    // Utilizamos essa função para mostrarmos uma imagem
  }
  else if(key == 'o'){
    // Intercala, verticalmente, pixels de duas imagens
    for(int i = 0; i < composite.pixels.length; i ++){
      if(floor(i/width)%2 == 0){
        composite.pixels[i] = bottom.pixels[i];
      }
      else{
        composite.pixels[i] = top.pixels[i];
      }
    }
    composite.updatePixels();
    //image(composite,0,0);
  }
  else if(key == 'b'){
    // DARKEN
    for(int i = 0; i < width*height; i ++){
      float temp = min(top.pixels[i],bottom.pixels[i]);
      //color composite_color = color(red, green, blue);
      composite.pixels[i] = int(temp);
    }
    composite.updatePixels();
    //image(composite,0,0);
  }
  else if(key == 'v'){
    // LIGHTEN
    for(int i = 0; i < width*height; i ++){
      float temp = max(top.pixels[i],bottom.pixels[i]);
      //color composite_color = color(red, green, blue);
      composite.pixels[i] = int(temp);
    }
    composite.updatePixels();
    //image(composite,0,0);
  }
  else if(key == 'm'){
    // Efeito multiply
    for(int i = 0; i < width*height; i ++){
      float red = red(bottom.pixels[i])*red(top.pixels[i])/255;
      // Multiplicamos o pixel da imagem bottom com o pixel da imagem top
      // O valor é, então, dividido por 255 para limitar a cor resultante
      // a 8 bits
      float green = green(bottom.pixels[i])*green(top.pixels[i])/255;
      float blue = blue(bottom.pixels[i])*blue(top.pixels[i])/255;
      //float red_a = red(bottom.pixels[i])*red(top.pixels[i]);
      //float red_b = map(red_a,0,255*255,0,255);
      //if(i==451725){
      //  println(red + " : " + red_b);
      //}
      color composite_color = color(red, green, blue);
      composite.pixels[i] = composite_color;
    }
    composite.updatePixels();
    //image(composite,0,0);
  }
  else if(key == 'n'){
    // Adição de cores
    for(int i = 0; i < width*height; i ++){
      float red = red(bottom.pixels[i])+red(top.pixels[i])/2;
      // A cor da imagem bottom é adicionada à cor da imagem bottom
      // Dividimos por 2 para limitar a cor resultante a 8 bits,
      // fazendo uma média entre as duas cores
      float green = green(bottom.pixels[i])+green(top.pixels[i])/2;
      float blue = blue(bottom.pixels[i])+blue(top.pixels[i])/2;
      color composite_color = color(red, green, blue);
      composite.pixels[i] = composite_color;
    }
    composite.updatePixels();
    //image(composite,0,0);
  }
  else if(key == 'c'){
    // Efeito divide
    for(int i = 0; i < width*height; i ++){
      float red = red(bottom.pixels[i])/red(top.pixels[i])*255;
      float green = green(bottom.pixels[i])/green(top.pixels[i])*255;
      float blue = blue(bottom.pixels[i])/blue(top.pixels[i])*255;
      color composite_color = color(red, green, blue);
      composite.pixels[i] = composite_color;
    }
    composite.updatePixels();
    //image(composite,0,0);
  }
  else if(key == '1'){
    // Mostra a imagem bottom
    for(int i = 0; i < width*height; i ++){
      composite.pixels[i] = bottom.pixels[i];
    }
    composite.updatePixels();
    //image(composite,0,0);
  }
  else if(key == '2'){
    // Mostra a imagem top
    for(int i = 0; i < width*height; i ++){
      composite.pixels[i] = top.pixels[i];
    }
    composite.updatePixels();
    //image(composite,0,0);
  }
}