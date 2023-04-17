Casa c;
ArrayList<Casa> abs;
void setup() {
size(500, 500);
abs = new ArrayList<Casa>();
}

void draw() {
background(0);
for (Casa c : abs) {
  c.run();
}
}

void mousePressed() {
  if (mouseButton == LEFT) 
    abs.add(new Casa(random(0, width), random(0, height), random(2, 10)));
  else if (mouseButton == RIGHT) 
    abs.add(new Casetta(random(0, width), random(0, height), random(2, 10)));
}

void keyPressed() {
  if (key == 'r') setup();
}
