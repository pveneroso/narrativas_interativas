int[] teste;

void setup(){
  teste = new int[4];

  for(int i= 0; i < teste.length;i++){
    teste[i] = int(random(60));
  }
  println(teste);
}