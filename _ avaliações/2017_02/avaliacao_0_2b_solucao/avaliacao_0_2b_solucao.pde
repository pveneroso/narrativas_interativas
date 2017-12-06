/*

  AVALIAÇÃO IIb

  INSTRUÇÕES:
  1   Criar um sketch que carrega as oito imagens contidas na pasta /data e
      desenha 8 botões, um para cada imagem. As imagens devem ter dimensões aleatórias
      (entre um tamanho mínimo e máximo) e devem ser dispostas aleatoriamente no canvas.
      Os botões devem ter o mesmo tamanho e devem ser dispostos regularmente no canvas;
  2   Ao clicar no botão relativo a uma imagem, se a imagem estiver visível ela deve
      desaparecer e o botão deve mudar de cor. Ao clicar no mesmo botão novamente, a
      imagem deve reaparecer e o botão deve voltar para a sua cor original;
  3   O usuário deve poder carregar e soltar cada imagem para mudar sua posição
      na tela. A imagem deve se comportar com regularidade em relação à posição
      em que ocorrer o clique;
  4   Ao terminar o exercício, o/a aluno/a deverá compactar a pasta contendo
      o sketch (incluindo o arquivo .pde e a pasta /data) e enviar para o email pfveneroso@gmail.com
      Antes de sair da sala, favor confirmar com o professor se o email foi recebido.

*/

Image[] imgs;

void setup(){
  size(800,800);
  imgs = new Image[8];
  for(int i = 0; i < imgs.length; i++){
    imgs[i] = new Image(i, 5, 5+(i*35), 30, 30);
  }
}

void draw(){
  background(255);
  for(int i = 0; i < imgs.length; i++){
    if(imgs[i].show){
      imgs[i].display();
    }
    imgs[i].displayButton();
  }
}

void mousePressed(){
  for(int i = 0; i < imgs.length; i++){
    imgs[i].drag();
    imgs[i].click();
  }
}

void mouseReleased(){
  for(int i = 0; i < imgs.length; i++){
    imgs[i].dragging = false;
  }
}