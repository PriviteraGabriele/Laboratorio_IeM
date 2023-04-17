class Casetta extends Casa {
  Casetta(float posX, float posY, float vel) {
    super(posX, posY, vel);
  }
  
  void display() {
    noFill();
    stroke(255);
    rect(posX, posY, 30, 30);
    triangle(posX - 5, posY, posX + 15, posY - 10, posX + 35, posY);
    fill(255);
    rect(posX + 10, posY + 20, 10, 10);
  }
  
  void move() {
    posX += velocita;
    if (posX > width) posX = 0;
  }
} 
