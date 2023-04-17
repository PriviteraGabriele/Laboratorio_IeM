PImage Im, Im_wow;

void setup() {
  size(512, 256);
  Im = loadImage("lena.png");
  Im.resize(256, 256);
  Im_wow = wow(Im);
}

void draw() {
  background(0);
  image(Im, 0, 0);
  image(Im_wow, 256, 0);
}

PImage wow(PImage I) {
  int w = I.width;
  int h = I.height;

  // Creo una nuova immagine per contenere l'output
  PImage swapped = createImage(w, h, RGB);

  //Copio la seconda metà dell'immagine originale nella prima metà dell'immagine di output
  swapped.copy(I, w/2, 0, w/2, h, 0, 0, w/2, h);

  //Copio la prima metà dell'immagine originale nella seconda metà dell'immagine di output
  swapped.copy(I, 0, 0, w/2, h, w/2, 0, w/2, h);

  //Qui mi trovo la percentuale della parte superiore della mia immagine
  int rand = int(random(100));
  int N = int(height * rand) / 100;
  
  //Stampa delle percentuali della parte superiore e inferiore
  println("Percentuale Parte Superiore: " + rand + "%");
  println("Percentuale Parte Inferiore: " + (100 - rand) + "%");
  
  //Modifica Colore Parte superiore
  for(int x = 0; x<width; x++){
    for(int y = 0; y<N; y++){
      int pixel = swapped.get(x, y);
      float r = 255 - red(pixel);
      float g = green(pixel);
      float b = 255 - blue(pixel);
      swapped.set(x, y, color(r, g, b));
    }
  }
  
  //Modifica Colore Parte inferiore
  for(int x = 0; x<width; x++){
    for(int y = N; y<height; y++){
      int pixel = swapped.get(x, y);
      float r = red(pixel);
      float g = 255 - green(pixel);
      float b = 255 - blue(pixel);
      swapped.set(x, y, color(r, g, b));
    }
  }
  
  return swapped;
}


void keyPressed() {
  if (key == 'r' || key == 'R') {
    setup();  
  }
}
