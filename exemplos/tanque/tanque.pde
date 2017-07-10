/*
  Três novidades:
  - sistema simples de pontuação (contagem de acertos)
  - correção na posição de origem da bala (na ponta do canhão)
  - o algoritmo de colisão agora reconhece também o raio da bala
*/


Tank t;
  // Objeto t da classe Tank é declarado
Target target;
  // Objeto target da classe Target é declarado
  
int score = 0;

boolean[] keys;
  // Array de booleanos para guardar a informação se
  // uma tecla de movimento encontra-se apertada ou não
PFont system_font;
  // Fonte básica de sistema
PFont score_font;
  // Fonte básica de pontuação
String hit_message = "ACERTOU";
  // Mensagem a ser mostrada quando o alvo é acertado
boolean show_hit_message = false;
  // Booleana que guarda informação se mensagem de acerto deve ser mostrada
int standard_message_timer = 100;
int message_timer = standard_message_timer;
  // Timer que define o número de frames que a mensagem de acerto deve ser mostrada

void setup(){
  size(800,800);
  system_font = createFont("Helvetica-48.vlw",48);
  score_font = createFont("Helvetica-24.vlw",24);
    // Converte a fonte em formato .vlw em um formato do Processing 
  textFont(system_font);
    // Atribui aos textos a serem escritos a fonte criada anteriormente
  keys = new boolean[4];
    // Define a variável keys como sendo um array com 4 indexes
  for(int i = 0; i < keys.length; i++){
    // Itera por todos os indexes do array keys atribuindo o valor
    // false a cada index
    keys[i] = false;
  }
  target = new Target();
    // Chama o constructor da classe Target, instanciando o objeto
}

void draw(){
  fill(127);
  noStroke();
  rectMode(LEFT);
  rect(0,0,width,height);
    // A cada iteração de draw, um retângulo cinza é desenhado sobre o canvas,
    // cobrindo toda a sua superfície. Isso reseta (apaga) os desenhos realizados no
    // frame anterior
  target.drawTarget();
    // Chama o método drawTarget da classe Target, desenhando o alvo
  if(t != null){
    // Se o objeto t não for nulo, chama o método que desenha o tanque na tela
    t.drawTank();
  }
  
  if(keys[0]){
    // Se keys[0] for true, chama o método que move o tanque para frente
    t.goForward();
  }
  if(keys[1]){
    // Se keys[1] for true, chama o método que move o tanque para trás
    t.goBackwards();
  }
  if(keys[2]){
    // Se keys[2] for true, chama o método que rotaciona o tanque para a esquerda
    t.rotateLeft();
  }
  if(keys[3]){
    // Se keys[3] for true, chama o método que rotaciona o tanque para a direita
    t.rotateRight();
  }
  
  if(t != null && t.bulletFlying()){
    // Se o objeto t não for nulo e a bala tiver sido atirada e não tiver escapado
    // da tela ou atingido um alvo (t.bulletFlying() == true), roda o código a seguir
    target.checkCollision(t.bulletPosition());
      // Checa se houve colisão entre a bala e o alvo passando a posição da
      // bala como parâmetro do método target.checkCollision()
    if(target.bulletHitTarget()){
      // Chama o método da classe Target que checa se a bala atingiu o alvo neste frame;
      // se retornar true, roda o código a seguir
      show_hit_message = true;
      score++;
        // Atribui o valor true para a variável show_hit_message,
        // que libera o desenho da mensagem de acerto na tela
      t.resetBullet();
        // Reseta a posição e demais variáveis relativas à bala, parando
        // de desenhá-la
    }
  }
  
  if(show_hit_message && message_timer > 0){
    // Se a mensagem de acerto tiver que ser desenhada e o timer de exibição da
    // mensagem for maior que 0, roda o código que desenha a mensagem na tela
    fill(0);
    textFont(system_font);
    float text_width = textWidth(hit_message);
      // Recupera a largura do texto que será desenhado na tela
    text(hit_message,(width-text_width)/2,100);
      // Escreve o texto na tela, posicionando-o no centro da mesma no eixo x,
      // e a 100 pixels do topo da tela
    message_timer--;
      // Diminui o timer em 1, indicando a passagem de um frame
    if(message_timer <= 0){
      // Checa se o timer é menor ou igual a zero;
      // Se for, o timer é resetado para seu valor original e a
      // mensagem não deve mais ser desenhada na tela
      message_timer = standard_message_timer;
      show_hit_message = false;
    }
  }
  
  textFont(score_font);
  fill(0);
  text(score,20,40);
}

void keyPressed(){
  // Método que checa se uma tecla foi pressionada
  if(key == CODED && t != null){
    // O código só roda se existir um objeto t e a tecla pressionada for codificada
    if(keyCode == UP){
      keys[0] = true;
      // keys[0] guarda o estado da tecla de seta para cima;
      // true indica que ela está pressionada e false indica que ela não
      // está pressionada
    }
    if(keyCode == DOWN){
      keys[1] = true;
    }
    if(keyCode == LEFT){
      keys[2] = true;
    }
    if(keyCode == RIGHT){
      keys[3] = true;
    }
  }
  else{
    if(key == ' ' && t != null){
      // Se a tecla pressionada for 'espaço', atira chamando o método shoot() da
      // classe Tank
      t.shoot();
    }
  }
}

void keyReleased(){
  // Método que checa se uma tecla foi solta
  if(key == CODED && t != null){
    if(keyCode == UP){
      keys[0] = false;
    }
    if(keyCode == DOWN){
      keys[1] = false;
    }
    if(keyCode == LEFT){
      keys[2] = false;
    }
    if(keyCode == RIGHT){
      keys[3] = false;
    }
  } 
}

void mousePressed(){
  // Método que checa se o botão do mouse foi pressionado
  if(t == null){
    // Se t == null (ou seja, o objeto tanque não estiver instanciado),
    // cria o tanque na posição do mouse
    t = new Tank(40,60);
    target.setBulletRadius(40/4);
      // O objeto t (tanque) é instanciado com os parâmetros (dimensao horizontal,
      // dimensão vertical)
    t.createTank(mouseX, mouseY);
      // O tanque é criado com sua origem nas coordenadas x e y do mouse
      // no momento do clique
  }
}




/*
  O que mais podemos fazer?
  
  • Fazer ajustes finos no algoritmo de colisão:
    Neste momento ele trata a bala como um ponto na origem da bala
    (no centro do círculo que representa a bala);
    o raio da bala deve ser considerado para que, se a bala resvalar
    no alvo, seja considerado um acerto
    
  • Corrigir o posicionamento da bala em relação ao tanque
    Quando atirada enquanto o tanque está rotacionando, a bala parece
    sair do tanque em trajetória diferente do canhão. A bala é criada na origem do
    tanque (centro do maior retângulo); para corrigir isso, podemos criar a bala
    na ponta do canhão
  
  • Limitar o movimento do tanque às fronteiras do canvas
    Se o tanque bater nas extremidades do canvas, ele não deve conseguir
    continuar seu movimento
    
  • Guardar pontuação (número de acertos) do jogador
  
  • Limitar o número de balas disponíveis para o jogador
    Um acerto pode fornecer mais balas ao jogador,
    enquanto, se o jogador utilizar todas as balas,
    o jogo chega ao fim (Game over)
  
  • Permitir a existência de mais do que uma bala voando simultaneamente
    Uma classe Bala a ser instanciada cada vez que a barra de espaço
    for pressionada
    
  • Criar um cenário para o jogo
  
  • Mudar o estilo do tanque
    Importar um desenho de um tanque
    
  • Criar e programar efeitos sonoros para a movimentação do tanque,
  a bala sendo atirada, o acerto da bala no alvo, entre outros
  
  • Criar e programar uma interface de usuário que mostra a pontuação do jogador,
  as balas disponíveis, um botão para iniciar/reiniciar o jogo, entre outros
  
  • Se a trajetória da bala for maior até o alvo, o jogador recebe mais pontos
  
  • Permitir que mais do que um alvo exista, simultaneamente, na tela
  
  • Implementar alvos que se movem
  
  • Implementar diferentes tipos de alvos:
    Alguns, menores, dão mais pontos
    Outros, maiores, menos pontos
    Um tipo de alvo que não pode ser atingido, ou o jogador perde pontos
    
  • Limite de tempo para um jogador acertar um alvo

*/