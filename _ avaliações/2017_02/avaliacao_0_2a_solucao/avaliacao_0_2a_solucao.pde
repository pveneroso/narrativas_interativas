/*
  AVALIAÇÃO II

  INSTRUÇÕES:
  1   Criar um sketch quadrado cuja imagem de fundo deve ser o arquivo
      fundo.jpg contido na pasta /data. Redimensione a imagem (no código) para
      que ela se encaixe na janela do sketch.
  2   Utilizando orientação a objetos e arrays de objetos, desenhar 40 bolas na
      tela. As bolas devem ser inicializadas em posições aleatórias dentro da janela,
      devem ter uma cor atribuída randomicamente para cada uma delas e devem ter raios
      variados. As bolas devem se mover com uma aceleração vertical e horizontal regular
      específica para cada bola e definida na criação do objeto.
  3   Toda vez que a bola tocar uma extremidade da tela, ela deve quicar na direção
      contrária e a sua cor deve ser alterada randomicamente.
  4   Caso ocorra clique com o mouse sobre uma bola específica, as seguintes ações devem ocorrer:
        - Se a bola estiver parada, ela deve voltar a se mover
        - Se a bola estiver em movimento, ela deve parar de se mover
      Bolas fixas deverão ser sempre brancas, enquanto as bolas que se movem
      devem ter as cores atribuídas a elas randomicamente.
  5   Caso o interator clique nas teclas 'a' ou 's', as seguintes ações devem ocorrer:
        - Ao clicar na tecla 's', todas as bolas devem ser fixadas na tela e ter suas cores
          alteradas para branco
        - Ao clicar na tecla 'a', todas as bolas devem voltar a se mover e devem recuperar
          suas cores
  6   Ao terminar o exercício, o/a aluno/a deverá compactar a pasta contendo
      o sketch (incluindo o arquivo .pde e a pasta /data) e enviar para o email pfveneroso@gmail.com
      Antes de sair da sala, favor confirmar com o professor se o email foi recebido.

*/

Bola[] bolas;
PImage fundo;

void setup(){
  size(800,800);
  smooth();
  bolas = new Bola[40];
  for(int i = 0; i < bolas.length; i++){
    bolas[i] = new Bola();
  }
  fundo = loadImage("fundo.jpg");
  fundo.resize(width,height);
}

void draw(){
  background(170);
  image(fundo,0,0);
  for(int i = 0; i < bolas.length; i++){
    bolas[i].desenhar();
  }
}

void mousePressed(){
  for(int i = 0; i < bolas.length; i++){
    bolas[i].clique();
  }
}

void keyPressed(){
  if(key == 'A' || key == 'a'){
    for(int i = 0; i < bolas.length; i++){
      bolas[i].fixa = false;
    }
  }
  else if(key == 's' || key == 'S'){
    for(int i = 0; i < bolas.length; i++){
      bolas[i].fixa = true;
    }
  }
}