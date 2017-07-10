class Tank{
  int tank_width, tank_height;
    // Define dimensões horizontais e verticais do tanque
  PVector position;
    // PVector que guarda a posição do tanque
  float tank_angle;
    // Guarda o ângulo de rotação do tanque
  float delta_angle = 2;
    // Variação padrão do ângulo do tanque
  float delta_velocity = 2;
    // Variação padrão da velocidade do tanque
  float velocity = 0;
    // Velocidade do tanque
  
  PVector bullet_position;
    // PVector que guarda a posição da bala
  float bullet_angle;
    // Guarda o ângulo da trajetória da bala
  float bullet_delta_velocity = 8;
    // Variação padrão da velocidade da bala
  
  boolean update_bullet = false;
    // Booleana que guarda a informação se a bala deve ser desenhada e atualizada:
    // true se ela estiver voando, false se ela não tiver sido atirada ou se já
    // tiver saído da tela ou acertado o alvo
  
  Tank(int t_width, int t_height){
    // Construtor da classe Tank que recebe os parâmetros:
    // t_width: dimensão horizontal do tanque
    // t_height: dimensão vertical do tanque
    tank_width = t_width;
      // A largura do tanque é recuperada do parâmetro t_width
    tank_height = t_height;
      // A altura do tanque é recuperada do parâmetro t_height
      // Os parâmetros são fornecidos na inicialização do tanque
    tank_angle = 0;
      // O ângulo de rotação do tanque é inicializado com o valor 0
    bullet_angle = tank_angle;
      // O ângulo da trajetória da bala é inicializado com o mesmo valor do
      // ângulo do tanque
  }
  
  void createTank(float pos_x, float pos_y){
    position = new PVector(pos_x, pos_y);
    // define posição inicial do tanque
  }
  
  void drawTank(){
    fill(255);
    stroke(0);
    smooth();
    rectMode(CENTER);
    
    drawBullet();
    
    float x = cos(radians(tank_angle)) * velocity;
      // (move o objeto - no eixo x - na direção do ângulo
      // até o raio representado por velocity)
      // Calcula o movimento do tanque no eixo x segundo o ângulo de rotação
      // do tanque e a velocidade de movimento
    float y = sin(radians(tank_angle)) * velocity;
      // Calcula o movimento do tanque no eixo y segundo o ângulo de rotação
      // do tanque e a velocidade de movimento
    PVector movement = new PVector(x,y);
      // Vetor que indica o novo ponto a ser ocupado pelo tanque
    position.add(movement);
      // Através da soma dos vetores position e movement, descobrimos
      // a nova posição do tanque neste frame
    
    pushMatrix();
      // Cria uma nova "camada" para manipulação de posição e rotação
      // que não afetará outras "camadas"
    translate(position.x,position.y);
      // A origem da composição é movida para o centro do tanque
      // sem afetar outros elementos que estão sendo renderizados
    rotate(radians(tank_angle)-PI/2);
      // A composição é rotacionada (em relação à origem local), modificando
      // a direção do tanque
    rect(0,0,tank_width,tank_height);
      // o tanque é desenhado em relação à origem
    rect(0,-(tank_height/2),tank_width/4,((tank_height*2)/3)); 
      // o canhão é desenhado em relação à origem
    popMatrix();
      // sai da "camada" criada anteriormente, indicando que,
      // daqui em diante, qualquer manipulação não afetará a camada
      // que acabamos de criar e manipular
    
    velocity = 0;
      // Reseta a velocidade do tanque; deste modo, se as setas deixarem
      // de ser apertadas o tanque para de se mover
  }
  
  void drawBullet(){
    // Função que desenha a bala
    if(update_bullet){
        // Checa se a bala deve ter seus parâmetros atualizados e se ela
        // deve ser desenhada
      float bullet_x = cos(radians(bullet_angle))*(-bullet_delta_velocity);
      float bullet_y = sin(radians(bullet_angle))*(-bullet_delta_velocity);
        // Calcula o deslocamento x e y da bala em sua trajetória retilínea
      PVector bullet_movement = new PVector(bullet_x,bullet_y);
      bullet_position.add(bullet_movement);
      //pushMatrix();
      //translate(bullet_position.x,bullet_position.y);
      //rotate(radians(bullet_angle)-PI/2);
        // A soma dos vetores calcula a nova posição da bala no sistema de coordenadas
        // do canvas
      ellipse(bullet_position.x,bullet_position.y,tank_width/4,tank_width/4);
      //ellipse(0,0,tank_width/4,tank_width/4);
      //popMatrix();
        // A bala (um círculo) é desenhada em sua nova posição
      
      if(bullet_position.x > width || bullet_position.x < 0
         || bullet_position.y > height || bullet_position.y < 0){
          // Checa se a bala saiu da tela
        resetBullet();
          // Se sim, reseta a bala
      }
    }
  }
  
  void resetBullet(){
    // Reseta os parâmetros da bala e indica que ela
    // não deve ser atualizada e desenhada
    update_bullet = false;
    bullet_angle = 0;
    bullet_position = null;
  }
  
  void rotateLeft(){
    tank_angle -= delta_angle;
    // Atualiza o ângulo para o qual o tanque está apontando
  }
  
  void rotateRight(){
    tank_angle += delta_angle;
    // Atualiza o ângulo para o qual o tanque está apontando
  }
  
  void goForward(){
    velocity-=delta_velocity;
    // Atualiza a velocidade do tanque
  }
  
  void goBackwards(){
    velocity+=delta_velocity;
    // Atualiza a velocidade do tanque
  }
  
  void shoot(){
      // Roda uma vez quando o interator aperta a barra de espaço
    update_bullet = true;
      // Libera a atualização dos parâmetros da bala e o seu desenho na tela
    bullet_angle = tank_angle;
      // O ângulo da trajetória da bala será igual ao ângulo do tanque
      // no momento do disparo
    bullet_position = new PVector(position.x,position.y);
    PVector bullet_offset = PVector.fromAngle(radians(bullet_angle)-PI);
    bullet_offset.setMag(((tank_height*2)/3)+10);
    bullet_position.add(bullet_offset);
      // É criado um PVector que guarda a posição de origem da bala:
      // igual à posição do tanque no momento do disparo
  }
  
  boolean bulletFlying(){
    // Quando chamado, este método retorna a informação se a bala está
    // voando ou não
    return update_bullet;
  }
  
  PVector bulletPosition(){
    // Retorna a posição da bala (usaremos esta informação para checar a
    // colisão da bala com o alvo, passando este parâmetro para a classe
    // Target)
    return bullet_position;
  }
}