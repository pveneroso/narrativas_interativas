int ball_radius = 50;
float position_x, position_y;
float delta_speed = 2;
boolean[] keys;

void setup(){
  size(500,500);
  smooth();
  position_x = width/2;
  position_y = height/2;
  
  keys = new boolean[4];
  for(int i = 0; i < keys.length; i++){
    keys[i] = false;
  }
}

void draw(){
  background(255);
  
  // Sequência de ifs altera as posições relativas a cada tecla
  // caso ela esteja apertada
  if(keys[0]){
    position_y -= delta_speed;
  }
  if(keys[1]){
    position_y += delta_speed;
  }
  if(keys[2]){
    position_x -= delta_speed;
  }
  if(keys[3]){
    position_x += delta_speed;
  }

  fill(0);
  ellipse(position_x, position_y, ball_radius, ball_radius);
}

void keyPressed(){
  // Checa se as teclas foram apertadas e atualiza o estado das teclas
  // no array keys[]
  if(key == 'w'){
    keys[0] = true;
  }
  if(key == 's'){
    keys[1] = true;
  }
  if(key == 'a'){
    keys[2] = true;
  }
  if(key == 'd'){
    keys[3] = true;
  }
}

void keyReleased(){
  // Checa se as teclas foram soltas e atualiza o estado das teclas
  // no array keys[]
  if(key == 'w'){
    keys[0] = false;
  }
  if(key == 's'){
    keys[1] = false;
  }
  if(key == 'a'){
    keys[2] = false;
  }
  if(key == 'd'){
    keys[3] = false;
  }
}