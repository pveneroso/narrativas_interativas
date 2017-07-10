class Target{

  int target_x, target_y;
    // Variáveis que guardam as coordenadas do alvo
  int target_radius = 25;
    // Variável que guarda o raio do alvo
  boolean hit = false;
    // Variável que guarda a informação se o alvo foi acertado
  float bullet_radius = 0;

  Target(){
    // Construtor da classe Target
    target_x = int(random(0,width-80))+40;
    target_y = int(random(0,height-80))+40;
    // Valores randômicos são atribuídos às variáveis que guardam a posição do alvo
  }
  
  void setBulletRadius(int bR){
    bullet_radius = bR;
  }
  
  void resetTarget(){
    // Método que reseta o alvo, sendo rodado após o alvo ser atingido
    target_x = int(random(0,width-80))+40;
    target_y = int(random(0,height-80))+40;
    // Atribui novos valores randômicos relacionados à posição do alvo
    drawTarget();
    // Método que desenha o alvo a partir dos novos parâmetros definidos acima
  }
  
  void drawTarget(){
    // Método que desenha o alvo
    stroke(0);
    fill(255);
    ellipse(target_x,target_y,target_radius*2,target_radius*2);
    // O alvo é desenhado a partir dos parâmetros definidos anteriormente
    line(target_x,target_y-target_radius,target_x,target_y+target_radius);
    // A linha vertical do alvo é desenhada
    line(target_x-target_radius,target_y,target_x+target_radius,target_y);
    // A linha horizontal do alvo é desenhada
  }
  
  void checkCollision(PVector bullet){
    // Método que checa a colisão da bala com o alvo:
    // recebe o parâmetro bullet, um vetor contendo as coordenadas atuais da bala
    if(bullet != null){
      // Se bullet não for nulo (e, portanto, se existir uma bala voando na tela,
      // roda o código a seguir)
      float distance = dist(bullet.x,bullet.y,target_x,target_y);
      // Calcula a distância entre a bala e o alvo
      if(distance < target_radius+bullet_radius){
          // Se a distância for menor que o raio do alvo,
          // o mesmo foi acertado pela bala
        hit = true;
          // O valor true é atribuído à variável hit, que será retornada
          // para liberar o desenho da mensagem de acerto
        resetTarget();
          // Como o alvo foi acertado, ele é resetado e desenhado novamente
          // em uma nova posição
      }
    }
  }
  
  boolean bulletHitTarget(){
      // Retorna a informação se a bala acertou o alvo
    boolean return_hit = false;
      // Variável temporária para retornar se a bala acertou o alvo
    if(hit){
      // Se hit == true, devemos retornar que a bala acertou o alvo;
      // a variável return_hit retornará essa informação, enquando a variável hit
      // será resetada
      return_hit = true;
      hit = false;
    }
    return return_hit;
  }

}