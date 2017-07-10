Properties test;

void setup(){
  test = new Properties();
  println("x = " + test.x);
  test.setX(449);
  println("x = " + test.x);
  test.x = 999;
  println("x = " + test.x);
  println("getX = " + test.getX());
}