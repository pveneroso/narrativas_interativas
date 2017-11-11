Comp[] comp;
int number_of_comps = 0;

void setup(){
  size(800,800);
  comp = new Comp[40];
}

void draw(){
  for(int i = 0; i < number_of_comps; i++){
    comp[i].draw();
  }
}

void mousePressed(){
  if(number_of_comps < comp.length){
    comp[number_of_comps] = new Comp(mouseX, mouseY);
    number_of_comps++;
  }
}