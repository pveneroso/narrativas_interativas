Player player;
Collectible[] collectibles;
boolean[] keys = {false,false,false,false};
int score = 0;
PFont font;

void setup(){
  size(800,500);
  //noStroke();
  smooth();
  player = new Player();
  collectibles = new Collectible[30];
  for(int i = 0; i < collectibles.length; i++){
    collectibles[i] = new Collectible();
  }
  font = createFont("Helvetica",36);
  textFont(font);
  textAlign(CENTER, CENTER);
}

void draw(){
  background(255);
  if(keys[0]){
    player.move(1,0);
  }
  else if(keys[1]){
    player.move(-1,0);
  }
  if(keys[2]){
    player.move(0,1);
  }
  else if(keys[3]){
    player.move(0,-1);
  }
  player.drawPlayer();
  for(int i = 0; i < collectibles.length; i++){
    collectibles[i].drawCollectible();
    if(collectibles[i].checkCollision(player.x,player.y,player.radius)){
      score++;
    }
  }
  fill(0);
  if(score < 30){
    text(score,width/2,30);
  }
  else{
    text("VITÓRIA",width/2,30);
  }
}

void keyPressed(){
  if(key == CODED){
    if(keyCode == LEFT){
      keys[1] = true;
    }
    if(keyCode == RIGHT){
      keys[0] = true;
    }
    if(keyCode == UP){
      keys[3] = true;
    }
    if(keyCode == DOWN){
      keys[2] = true;
    }
  }
}

void keyReleased(){
  if(key == CODED){
    if(keyCode == LEFT){
      keys[1] = false;
    }
    if(keyCode == RIGHT){
      keys[0] = false;
    }
    if(keyCode == UP){
      keys[3] = false;
    }
    if(keyCode == DOWN){
      keys[2] = false;
    }
  }
}