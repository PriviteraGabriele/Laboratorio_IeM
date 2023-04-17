class Voto{
  float posX, posY, vel;
  Voto(float posX, float posY, float vel){
    this.posX = posX;
    this.posY = posY;
    this.vel = vel;
  }

  int rdm = int(random(18, 30)); 
  
  void display(){
    noFill();
    stroke(255, 255, 0);
    square(posX, posY, 30);
    textSize(28);
    fill(255, 255, 0);
    text(rdm, posX + 1, posY + 25);
  }

  void move(){
    posX += vel;
    if(posX > width - 30 || posX < 0){
      vel = vel * (-1);
    }
  }
  
  void run(){
      display();
      move();
  }
}
