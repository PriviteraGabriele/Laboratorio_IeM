Mongolfiera m;
MongolfieraMotorizzata m2;
float velocita;
void setup() {
size(512, 512);
velocita = random(2, 10);
m = new Mongolfiera(random(0, width), height / 3, velocita);
m2 = new MongolfieraMotorizzata(random(35, width - 35), height * 2 / 3, velocita);
}

void draw() {
background(255);
m.run();
m2.run();
}

void keyPressed() {
  if (key == 'r' || key == 'R') {
    setup();
  }
}
