Square[] squares;
int size = 100;
int cells;

void setup(){
  size(500,500);  
  cells = (width/size)*(height/size);
  squares = new Square[cells];
  for(int i = 0; i < cells; i++){
    int x = (i%(width/size))*size;
    int y = floor(i/(width/size))*size;
    squares[i] = new Square(x,y,size,size,color(255));
  }
}

void draw(){
  for(int i = 0; i < squares.length; i ++){
    squares[i].drawSquare();
  }
}

void mousePressed(){
  for(int i = 0; i < squares.length; i++){
    if(squares[i].checkClick()){
      squares[i].toggleColor();
    }
  }
}