/*
  – Desenhar 5 colunas e 5 linhas de círculos (25 círculos) espaçados em intervalos regulares
  – Atribuir diâmetros iniciais aleatório para cada círculo (utilizar array)
  – Calcular diâmetro atual do círculo dependendo da sua distância em relação à posição do cursor
    Mais próximo do cursor fica maior
    Mais longe do cursor fica menor (até o limite do tamanho original do círculo)
  – Desenhar círculos
*/

int[] ball_size;
color[] ball_color;
int ball_distance = 100;
int ball_offset = 50;

void setup(){
  size(500,500);
  ball_size = new int[(width/ball_distance)*(height/ball_distance)];
  ball_color = new color[ball_size.length];
  for(int i = 0; i < ball_size.length; i++){
    ball_size[i] = int(random(20,40));
    ball_color[i] = color(int(random(0,255)),int(random(0,255)),int(random(0,255)));
  }
  noStroke();
  smooth();
}

void draw(){
  background(255);
  for(int i = 0; i < (width/ball_distance)*(height/ball_distance); i++){
    int column = i%(width/ball_distance);
    int line = floor(i/((width/ball_distance)));
    int x = ball_offset + (column * ball_distance);
    int y = ball_offset + (line * ball_distance);
    float distance = dist(x, y, mouseX, mouseY);
    int diameter = 0;
    if(distance < 200){
      diameter = int(ball_size[i] * map(distance, 0,200,4,1));
    }
    else{
      diameter = ball_size[i];
    }
    fill(ball_color[i]);
    ellipse(x, y, diameter, diameter);
  }
}

void mousePressed(){
  for(int i = 0; i < ball_size.length; i++){
    ball_size[i] = int(random(20,40));
    ball_color[i] = color(int(random(0,255)),int(random(0,255)),int(random(0,255)));
  }
}