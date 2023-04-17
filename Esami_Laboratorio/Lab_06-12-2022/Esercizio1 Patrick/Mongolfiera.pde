class Mongolfiera {
  float posX, posY, vel;
  Mongolfiera (float posX, float posY, float vel){
    this.posX = posX;
    this.posY = posY;
    this.vel = vel;
  }
  
  void move() {
    posX += vel;
    if(posX > width + 35) posX = 0;
  }
  
  void display() {
    fill(0, 255, 0);
    ellipse(posX, posY, 70, 70);
    rect(posX - 30, posY + 45, 60, 30);
    line(posX - 35, posY, posX - 30, posY + 45);
    line(posX + 35, posY, posX + 30, posY + 45);
  }
  
  void run() {
    display();
    move();
  }
}
