/* In una canvas di 500 pixel per 500 pixel con background nero si posizionino 12 robot. 
Ciascun robot ha tre stati interni: R,G,B. I robot passano ciclicamente tra i tre stati 
ogni 100 fotogrammi. Lo stato iniziale di ciascun robot è assegnato a caso. Ciascun robot 
è rappresentato graficamente da un quadrato di lato 25 x 25, riempito del colore che 
corrisponde al suo stato interno. Ad ogni fotogramma la posizione di ciascun robot viene 
aggiornata di un offset (dx, dy) dove dx e dy sono quantità a caso tra -5 e +5 pixel. 
I robot muovendosi lasciano un "scia" costituita dalla loro "forma". La scia però è 
riempita di bianco. Premendo il tasto R l'app si re-inizializza. */

// Dichiarazione di una classe Robot per gestire lo stato interno e la posizione di ogni robot
class Robot{
  int state; // lo stato interno del robot (0=R, 1=G, 2=B)
  float x, y; // la posizione attuale del robot
  float dx, dy; // l'offset per aggiornare la posizione del robot ad ogni fotogramma
  ArrayList<PVector> trail; // l'elenco di punti che costituiscono la scia del robot

  Robot(){
    state = int(random(3)); // stato iniziale casuale
    x = random(width);
    y = random(height);
    dx = random(-5, 5);
    dy = random(-5, 5);
    trail = new ArrayList<PVector>();
  }

  void update(){
    // Aggiorna la posizione del robot e aggiunge un punto alla scia
    x += dx;
    y += dy;
    trail.add(new PVector(x, y));

    // Se la scia è troppo lunga, rimuove il punto più vecchio
    if (trail.size() > 50) {
      trail.remove(0);
    }

    // Cambia lo stato del robot ogni 100 fotogrammi
    if (frameCount % 100 == 0) {
      state = (state + 1) % 3;
    }
  }

  void display(){
    // Disegna il robot come un quadrato riempito del colore corrispondente allo stato interno
    fill(state == 0 ? color(255, 0, 0) : state == 1 ? color(0, 255, 0) : color(0, 0, 255));
    rectMode(CENTER);
    rect(x, y, 25, 25);

    // Disegna la scia come un insieme di cerchi bianchi
    noStroke();
    fill(255);
    for (PVector pt : trail) {
      ellipse(pt.x, pt.y, 10, 10);
    }
  }
}

Robot[] robots; // l'array di robot

void setup(){
  size(500, 500);
  background(0);

  // Crea l'array di robot
  robots = new Robot[12];
  for (int i = 0; i < 12; i++) {
    robots[i] = new Robot();
  }
}

void draw(){
  background(0);

  // Aggiorna e disegna ogni robot
  for (Robot robot : robots) {
    robot.update();
    robot.display();
  }
}

void keyPressed(){
  // Re-inizializza gli stati e le posizioni dei robot premendo il tasto R
  if (key == 'r' || key == 'R') {
    for (Robot robot : robots) {
      robot.state = int(random(3));
      robot.x = random(width);
      robot.y = random(height);
      robot.dx = random(-5, 5);
      robot.dy = random(-5, 5);
      robot.trail.clear();
    }
  }
}
