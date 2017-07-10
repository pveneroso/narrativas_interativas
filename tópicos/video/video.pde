import processing.video.*;

Capture video;
PImage composite;
boolean mirror = false;
boolean enable_mouse = true;

void setup(){
  size(640,480);
  video = new Capture(this,640,480);
  video.start();
  composite = createImage(640,480,RGB);
}

void draw(){
  if (video.available()) {    
    video.read();
  }
  if(enable_mouse){
    if(mirror){
      mirrorImage();
    }
    else{
      normalImage();
    }
  }
  else{
    if(second()%2 == 0){
      normalImage();
    }
    else{
      mirrorImage();
    }
  }
  image(composite,0,0);
}

void normalImage(){
  video.loadPixels();
  composite.loadPixels();
  for(int i = 0; i < video.pixels.length; i++){
    composite.pixels[i] = video.pixels[i];
  }
  composite.updatePixels();
}

void mirrorImage(){
  video.loadPixels();
  composite.loadPixels();
  for(int i = 0; i < video.pixels.length; i++){
    int inc = (width-1)-(i%width);
    int index = floor(i/width)*width + inc;
    composite.pixels[i] = video.pixels[index];
  }
  composite.updatePixels();
}

void mousePressed(){
  mirror = !mirror;
}

void keyPressed(){
  if(key == 'p'){
    enable_mouse = !enable_mouse;
  }
}