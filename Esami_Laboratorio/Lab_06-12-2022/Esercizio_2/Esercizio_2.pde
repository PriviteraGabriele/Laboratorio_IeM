PImage Im, Im_rev;

void setup() {
  size(512, 256);
  Im = loadImage("lena.png");
  Im.resize(256, 256);
  Im_rev = rev(Im);
}

void draw() {
  background(0);
  image(Im, 0, 0);
  image(Im_rev, 256, 0);
}

PImage rev(PImage I) {
  int w = I.width;
  int h = I.height;

  // Creo una nuova immagine per contenere l'output
  PImage swapped = createImage(w, h, RGB);

  //Copio la seconda metà dell'immagine originale nella prima metà dell'immagine di output
  swapped.copy(I, w/2, 0, w/2, h, 0, 0, w/2, h);

  //Copio la prima metà dell'immagine originale nella seconda metà dell'immagine di output
  swapped.copy(I, 0, 0, w/2, h, w/2, 0, w/2, h);
  
  //Rimpiazzo tutti i pixel della diagonale principale con pixel di colore random
  color c = color(random(256), random(256), random(256));
  for(int i = 0; i<width; i++){
    swapped.set(i , i, c);
  }

  return swapped;
}


void keyPressed() {
  if (key == 'r' || key == 'R') {
    setup();  
  }
}
