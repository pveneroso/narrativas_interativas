/*

  AVALIAÇÃO I - solução 1

  INSTRUÇÕES:
  1   Criar um sketch onde são desenhados 25 círculos
      (dispostos em 5 linhas e 5 colunas e espaçados regularmente);
  2   A cada linha deverá ser atribuída uma cor diferente compartilhada
      por todos os círculos dessa linha: branco para a 1ª linha,
      vermelho para a 2ª linha, amarelo para a 3ª linha,
      azul para a 4ª linha e preto para a 5ª linha;
  3   Atribuir um raio igual para todos os círculos. O raio será alterado
      dinamicamente em função de cliques do mouse, sendo incrementado regularmente.
      O raio de todos os círculos deve aumentar até que os círculos se toquem;
      nesse momento, a cada clique o raio deve diminuir progressivamente até um
      tamanho mínimo. Ao chegar no tamanho mínimo, o raio deve voltar a aumentar,
      e assim sucessivamente;
  4   Ao terminar o exercício, o/a aluno/a deverá compactar a pasta contendo
      o sketch (incluindo o arquivo .pde) e enviar para o email pfveneroso@gmail.com

*/


int offset = 50;
int radius = 25;
int spacing;
int x = 0;
int y = 0;
int rows = 5;
int columns = 5;
color colour;
int inc = 5;

void setup(){
  size(500,500);
  smooth();
  noStroke();
  spacing = width/columns;
}

void draw(){
  background(200);
  for(int i = 0; i < 5; i++){
    for(int j = 0; j < 5; j++){
      if(j == 0){
        colour = color(255,255,255);
      }
      else if(j == 1){
        colour = color(255,0,0);
      }
      else if(j == 2){
        colour = color(255,255,0);
      }
      else if(j == 3){
        colour = color(0,0,255);
      }
      else if(j == 4){
        colour = color(0,0,0);
      }
      fill(colour);
      x = (i*spacing)+offset;
      y = (j*spacing)+offset;
      ellipse(x,y,radius*2, radius*2);
    }
  }
}

void mousePressed(){
  radius+=inc;
  if(radius >= (spacing/2) || radius <= 10){
    inc = -inc;
  }
}