PImage Im, Im_sqr, Im_colo;

void setup(){
  size(768, 256);
  Im = loadImage("lena.png");
  Im.resize(256, 256);
  Im_sqr = sqr(Im);
  Im_colo = colo(Im_sqr, 255);
}

void draw(){
  background(0);
  image(Im, 0, 0);
  image(Im_sqr, 256, 0);
  image(Im_colo, 512, 0);
}

PImage sqr(PImage I){
  int w = I.width;
  int h = I.height;
  
  // Creo una nuova immagine per contenere l'output
  PImage quadrant = createImage(w, h, RGB);
  
  //Copio l'immagine originale nella nuova immagine
  quadrant.copy(I, 0, 0, I.width, I.height, 0, 0, I.width, I.height);
  
  for(int x = 0; x<w/2; x++){
    for(int y = h/2; y<h; y++){
      quadrant.set(x, y, color(255, 255, 0));
    }
  }
  
  return quadrant;
}

PImage colo(PImage I, int n){
  int w = I.width;
  int h = I.height;
  
  // Creo una nuova immagine per contenere l'output
  PImage max = createImage(w, h, RGB);
  
  //Copio l'immagine originale nella nuova immagine
  max.copy(I, 0, 0, I.width, I.height, 0, 0, I.width, I.height);

  //Imposto al massimo la componente di rosso della parte superiore della diagonale principale
  for(int y = 0; y<height; y++){
    for(int x = y + 1; x<width; x++){
      int pixel = max.get(x, y);
      float r = n;
      float g = green(pixel);
      float b = blue(pixel);
      max.set(x, y, color(r, g, b));
    }
  }
  
  //Imposto al massimo la componente di blue della parte inferiore della diagonale principale
  for(int x = 0; x<width; x++){
    for(int y = x + 1; y<height; y++){
      int pixel = max.get(x, y);
      float r = red(pixel);
      float g = green(pixel);
      float b = n;
      max.set(x, y, color(r, g, b));
    }
  }
  
  return max;
}

void keyPressed(){
  if(key == 'r' || key == 'R'){
    setup();
  }
}
