int soma;
Bola bola_1, bola_2;

void setup(){
  size(500,500);
  bola_1 = new Bola(100,200,20,"José");
  bola_2 = new Bola(300,50,40,"Lain");
  
}

void draw(){
  background(255);
  bola_1.movimentarBola();
  bola_1.desenharBola();
  bola_2.movimentarBola();
  bola_2.desenharBola();
}












void desenharCirculo(int x, int y, int raio,
                     int tom_de_cinza, boolean linha){
  if(linha){
    strokeWeight(10);
    stroke(tom_de_cinza);
  }
  else{
    noStroke();
  }
  fill(x);
  ellipse(x, y, raio, raio);
}