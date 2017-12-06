/*

  AVALIAÇÃO I - solução 2

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

int diametro = 50;
int inc = 5;
int tamanho_minimo = 20;
int espacamento = 100;
int deslocamento = 50;
boolean temp = true;
color[] cores = {color(255),color(255,0,0),color(255,255,0),color(0,0,255),color(0)};

void setup(){
  size(500,500);
  noStroke();
}

void draw(){
  background(127);
  fill(255);
  for(int id = 0; id < 25; id++){
    int linha = floor(id / 5);
    int coluna = id % 5;
    fill(cores[linha]);
    int x = deslocamento + (coluna*espacamento);
    int y = deslocamento + (linha*espacamento);
    ellipse(x,y,diametro,diametro);
  }
}

void mousePressed(){

  diametro += inc; // diametro = diametro + inc;
  if(diametro >= espacamento || diametro <= tamanho_minimo){
    inc *= -1; // inc = inc * -1;
  }
}