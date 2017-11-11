class Bola{
  float x, y, raio;
  float velocidade_x, velocidade_y;
  String nome;
  
  
  Bola(float in_x, float in_y, float in_raio, String in_nome){
    nome = in_nome;
    x = in_x;
    y = in_y;
    raio = in_raio;
    velocidade_x = random(-2, 2);
    velocidade_y = random(-2, 2);
  }
  
  void desenharBola(){
    fill(0);
    ellipse(x, y, raio, raio);
  }
  
  void movimentarBola(){
    x += velocidade_x;
    y += velocidade_y;
    reconhecerColisao();
  }
  
  void nomeDaBola(String texto){
    println(texto + nome);
  }
  
  void reconhecerColisao(){
    if(x <= raio/2 || x >= width-(raio/2)){
      velocidade_x *= -1;
    }
    if(y <= raio/2 || y >= height-(raio/2)){
      velocidade_y *= -1;
    }
  }
}