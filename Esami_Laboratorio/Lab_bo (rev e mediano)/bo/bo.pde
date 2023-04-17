PImage Im, Im_rev, Im_med;

void setup(){
  size(768, 256);
  Im = loadImage("lena.png");
  Im.filter(GRAY);
  Im.resize(256, 256);
  Im_rev = rev(Im);
  Im_med = mediano(Im_rev, int(random(5, 15)));
}

void draw(){
  background(0);
  image(Im, 0, 0);
  image(Im_rev, 256, 0);
  image(Im_med, 512, 0);
}

PImage rev(PImage I){
  int w = I.width;
  int h = I.height;

  PImage swapped = createImage(w, h, ALPHA);
  
  swapped.copy(I, w/2, 0, w/2, h, 0, 0, w/2, h);
  swapped.copy(I, 0, 0, w/2, h, w/2, 0, w/2, h);
  
  for(int i = 0; i<width; i++){
    swapped.set(i, i, color(255, 255, 0));
  }
  
  return swapped;
}

PImage mediano(PImage I, int N){
  PImage R = createImage(I.width, I.height, ALPHA);
  PImage tmp;
  int off = N/2;
  float[] tmpF;
  float med;
  tmpF=new float[N * N];
  
  for(int x=0; x<I.width; x++){
     for(int y=0; y<I.height; y++){
       tmp = I.get(x - off, y - off, N, N);
       tmp.loadPixels();       
       for(int i=0; i<tmp.pixels.length; i++){
         tmpF[i] = green(tmp.pixels[i]);
       }
       tmpF = sort(tmpF);
       if((N * N) % 2 == 1){
         med = tmpF[(N * N)/2];
       }else{
         med = (tmpF[(N * N)/2] + tmpF[(N * N)/2-1])/2;
       }
       R.set(x, y, color(med));
     }
  }
  
  return R;
}

void keyPressed(){
  if(key == 'r' || key == 'R'){
    setup();
  }
}
