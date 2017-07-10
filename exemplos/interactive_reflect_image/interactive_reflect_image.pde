PImage imagem;

int columns = 1;
int column_width;
int current_line;
int lines = 1;
int line_height;
int current_column;

float last_mousex, last_mousey;
boolean trigger = false;
boolean reverse_x = true;
boolean reverse_y = true;

boolean enable_x = true;
boolean enable_y = true;

int counter = 0;

void setup(){
  size(500,500);
  imagem = loadImage("0.jpg");
  loadPixels();
  imagem.loadPixels();
}

void draw(){
  if(trigger){
    reverse_x = true;
    reverse_y = true;
    column_width = max(1,int(mouseX));
    columns = ceil(imagem.width/column_width);
    line_height = max(1, int(mouseY));
    lines = ceil(imagem.height/line_height);
    
    for(int i = 0; i < imagem.pixels.length; i++){
      int x = i%imagem.width;
      int y = floor(i/imagem.width);
      int this_column = floor(x/column_width);
      int this_line = floor(y/line_height);
      if(current_line != y){
        reverse_x = true;
        current_line = y;
      }
      if(x%column_width == 0){
        reverse_x = !reverse_x;
      }
      if(y%line_height == 0 && x == 0){
        reverse_y = !reverse_y;
      }
      int temp_x = 0;
      int temp_y = 0;
      if(!enable_x){
        temp_x = x;
      }
      else if(reverse_x){
        temp_x = column_width-1-(x - (column_width*this_column));
      }
      else{
        temp_x = (x - (column_width*this_column));
      }
      if(!enable_y){
        temp_y = y;
      }
      else if(reverse_y && enable_y){
        temp_y = line_height-1-(y - (line_height*this_line));
      }
      else{
        temp_y = (y - (line_height*this_line));
      }
      int index = (temp_y*imagem.width)+temp_x;
      pixels[i] = imagem.pixels[index];
    }
    updatePixels();
    trigger = false;
  }
  if(last_mousex != mouseX || last_mousey != mouseY){
    trigger = true;
  }
}

void mousePressed(){
  counter++;
  if(counter > 9){
   counter = 0;
  }
  String filename = counter + ".jpg";
  imagem = loadImage(filename);
  loadPixels();
  imagem.loadPixels();
  trigger = true;
}

void keyPressed(){
  if(key == 'm'){
    enable_x = !enable_x;
  }
  else if(key == 'n'){
    enable_y = !enable_y;
  }
}