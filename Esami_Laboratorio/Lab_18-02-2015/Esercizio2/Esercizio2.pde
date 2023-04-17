/* Si realizzi una app Processing che visualizzi in una canvas una immagine a piacere in toni di grigio. 
Quando l'utente schiaccia il tasto T si applicherà all'immagine una operazione di soglia con valore 128. 
Successivamente, e solo dopo, quando l'utente schiaccia il tasto R il valore di soglia dovrà diminuire 
di una unità, se invece schiaccia il tasto Y il valore di soglia dovrà aumentare di una unità. */

PImage I;
int s = 128;

void setup(){
  I = loadImage("lena.png");
  size(1024, 512);
  I.filter(GRAY);
  image(I, 0, 0);
  image(I, 512, 0);
}

void draw(){
  fill(255, 0, 0);   
  textSize(20);
  text("Valore di Soglia: " + s, width - 200, height - 20);
}

PImage soglia(PImage I, int s){
  PImage R = I.copy();
  color c;
  for(int i=0; i<R.pixels.length; i++){
     c = int(red(R.pixels[i]));
     if(c < s){
       R.pixels[i] = color(0);
     }
     else{
       R.pixels[i] = color(255);
     }  
}
  
  return R;
}

void keyPressed() {
  if(key == 'T' || key == 't'){
    image(soglia(I, s), 512, 0);
  }
  if(key == 'R' || key == 'r' && s > 0){
    image(soglia(I, --s), 512, 0);
  }
  else if(key == 'Y' || key == 'y' && s < 255){
    image(soglia(I, ++s), 512, 0);
  }
}
