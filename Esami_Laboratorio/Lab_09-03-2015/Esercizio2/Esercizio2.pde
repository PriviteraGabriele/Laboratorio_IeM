/* In Processing Si realizzi una app Processing che visualizzi in una 
canvas una immagine RGB a piacere (ma predefinita a livello di codice). 
Quando si schiaccia il tasto A l'immagine viene divisa in 4 parti equali. 

I pixel nella parte NW assumono tono di grigio ottenuto con la formula gray=0.3*R+0.5*G+0.2*B.
I pixel nella parte NE assumono tono di grigio ottenuto con la formula gray=R. 
I pixel nella parte SW assumono tono di grigio ottenuto con la formula gray=G. 
I pixel nella parte SE assumono tono di grigio ottenuto con la formula gray=B. */

PImage img;

void setup(){
  size(512, 512);
  img = loadImage("lena.png");
}

void draw(){
  background(255);
  image(img, 0, 0, width, height); // visualizza l'immagine a schermo intero

  // verifica se il tasto A è stato premuto
  if(keyPressed && key == 'a' || key == 'A'){
    img.loadPixels();

    // divide l'immagine in 4 parti
    int w = img.width / 2;
    int h = img.height / 2;

    // parte NW
    for(int y = 0; y < h; y++){
      for(int x = 0; x < w; x++){
        int index = x + y * img.width;
        float r = red(img.pixels[index]);
        float g = green(img.pixels[index]);
        float b = blue(img.pixels[index]);
        float gray = 0.3*r + 0.5*g + 0.2*b;
        img.pixels[index] = color(gray);
      }
    }

    // parte NE
    for(int y = 0; y < h; y++){
      for(int x = w; x < img.width; x++){
        int index = x + y * img.width;
        float r = red(img.pixels[index]);
        float gray = r;
        img.pixels[index] = color(gray);
      }
    }

    // parte SW
    for(int y = h; y < img.height; y++){
      for(int x = 0; x < w; x++){
        int index = x + y * img.width;
        float g = green(img.pixels[index]);
        float gray = g;
        img.pixels[index] = color(gray);
      }
    }

    // parte SE
    for(int y = h; y < img.height; y++){
      for(int x = w; x < img.width; x++){
        int index = x + y * img.width;
        float b = blue(img.pixels[index]);
        float gray = b;
        img.pixels[index] = color(gray);
      }
    }

    img.updatePixels();
  }
}
