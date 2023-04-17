Voto v;
ArrayList<Voto> abs;

void setup() {
size(500, 500);
abs = new ArrayList<Voto>();
}

void draw() {
  background(0);
  for (Voto v : abs) {
    v.run();
  }
}

void mousePressed() {
  if (mouseButton == LEFT) 
    abs.add(new Voto(random(0, width - 30), random(0, height), random(2, 10)));
  else if (mouseButton == RIGHT) 
    abs.add(new Votone(random(15, width - 60), random(0, height - 60), 0));
}

void keyPressed() {
  if (key == 'r') setup();
}
