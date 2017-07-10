PVector[] lines;
// cria um array para guardar a origem das linhas
PVector[] current_lines;
// cria um array para guardar o vetor resultante
// da subtração do vetor da linha com o vetor da
// posição do cursor
int standard_spacing = 20;
// define um espaçamento padrão entre cada linha
int standard_dimension = 10;
// define a dimensão padrão da linha
PVector current_mouse;
// vetor que recebe as coordenadas do cursor a cada iteração de draw()
int current_x, current_y;
// variáveis que atualizam a posição de cada linha
// (usadas somente na inicialização do array lines)

void setup(){
  size(800,800);
  // define o tamanho do canvas
  fill(255);
  int indexes = (width/standard_spacing)*(height/standard_spacing);
  // calcula o número de linhas que cabem na tela
  lines = new PVector[indexes];
  // inicializa o array de linhas com o tamanho definido pela variável indexes
  for(int i = 0; i < lines.length; i++){
    // itera por cada index do array lines
    current_x = ((i*standard_spacing)%width) + ((standard_spacing-standard_dimension));
    // define a origem de cada linha no eixo horizontal [x] (cada index no array
    // corresponde a uma linha)
    current_y = (((i*standard_spacing)/width)*standard_spacing) + ((standard_spacing-standard_dimension));
    // define a origem de cada linha no eixo vertical [y]
    lines[i] = new PVector(current_x, current_y);
    // cria um PVector com o x e y definidos;
    // o PVector é guardado no index atual (variável i)
  }
  current_lines = new PVector[indexes];
  // inicializa o array current_lines com o mesmo número de indexes
  // que lines
//println(indexes);
  smooth();
  // indica que as linhas no programa deverão ser suavizadas quando renderizadas
}

void draw(){
  noStroke();
  // indica que formas geométricas deverão ser desenhadas sem contorno
  rect(0, 0,width,height);
  // desenha um retângulo branco sobre o canvas a cada iteração,
  // apagando o que havia sido desenhado na iteração anterior
  
  current_mouse = new PVector(mouseX, mouseY);
  // inicializa o PVector current_mouse com as coordenadas x e y do cursor
  stroke(0);
  // atribui a cor 0 [preto] às linhas de contorno das
  // formas geométricas a serem desenhadas
  
  for(int i = 0; i < lines.length; i++){
    // itera por todos os indexes do array lines
    // para fazer os cálculos e desenhar as linhas
    current_lines[i] = new PVector(lines[i].x,lines[i].y);
    // é criando um PVector no index atual do array current_lines
    // com as mesmas coordenadas do array lines
    current_lines[i].sub(current_mouse);
    // o PVector current_lines[i] é subtraído do PVector current_mouse,
    // gerando um vetor que indica a direção do ponto de origem (lines)
    // ao cursor (current_mouse)
    pushMatrix();
    translate(lines[i].x,lines[i].y);
    // a coordenada (0,0) da composição é movida para a coordenada da origem da linha
    //pushMatrix();
    rotate(current_lines[i].heading());
    // a composição é rotacionada na mesma direção do vetor resultante do cálculo
    // entre origem da linha e posição atual do cursor (portanto todas as linhas
    // apontarão em direção ao cursor)
//line(0,0,10,0);
//line(0,-3,0,3);
//line(0,-3,-3,0);
//line(0,3,-3,0);
    line(-5,0,5,0);
    // a linha é desenhada
    line(-5,-3,-5,3);
    line(-5,-3,-8,0);
    line(-5,3,-8,0);
    // as linhas que consistem na cabeça da seta são desenhadas
    //popMatrix();
    popMatrix();
  }
}