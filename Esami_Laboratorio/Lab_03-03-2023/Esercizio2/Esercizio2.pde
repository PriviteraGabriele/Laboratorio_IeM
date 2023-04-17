PImage Im;

void setup(){
  Im = loadImage("lena.png");
  size(512, 512);
  image(wow(Im), 0, 0);
}

void draw(){

}

PImage wow(PImage I) {
  PImage O = createImage(I.width, I.height, RGB);
  
  float rdm = random(0, 2);
  color col;
  
  //Divido l'immmagine in 3 e inverto la parte sinistra con la parte destra
  O.set(0, 0, I.get(I.width - I.width / 3, 0, I.width, I.height));
  O.set(I.width / 3, 0, I.get(I.width / 3, 0, I.width - I.width / 3, I.height));
  O.set(I.width - I.width / 3, 0, I.get(0, 0, I.width - I.width / 3, I.height));
  
  //Nell'output, a sinistra divido il valore di rosso di ogni pixel per un fattore f randomico, compreso tra 0 e 2
  for(int i = 0; i<(I.width / 3); i++){
    for(int j = 0; j<I.height; j++){
      col = O.pixels[pos(i, j, I.width)];
      O.set(i, j, color(red(col) / rdm, green(col), blue(col)));
    } 
  }
  
  //Nell'output, a destra moltiplico il valore di rosso di ogni pixel per lo stesso valore random usato in precedenza
  for (int i = I.width - (I.width / 3); i<I.width; i++) {
    for (int j = 0; j<I.height; j++) {
      col = O.pixels[pos(i, j, I.width)];
      O.set(i, j, color(red(col) * rdm, green(col), blue(col)));
    }
  }
  return O;
}

int pos(int x, int y, int z) {
  return x + y * z;
}

void keyPressed() {
  if(key == 'r' || key == 'R'){
    setup();
  } 
}
