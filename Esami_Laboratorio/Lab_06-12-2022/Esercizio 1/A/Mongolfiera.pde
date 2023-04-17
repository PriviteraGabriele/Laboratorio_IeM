class Mongolfiera{
  float posX, posY, vel;
  Mongolfiera(float posX, float posY, float vel){
    this.posX = posX;
    this.posY = posY;
    this.vel = vel;
  }
  
  void display(){
    fill(0, 255, 0);
    stroke(0, 255, 0);
    circle(posX, posY, 70);
    rect(posX - 30, posY + 50, 60, 30);
    line(posX - 35, posY, posX - 30, posY + 50);
    line(posX + 35, posY, posX + 30, posY + 50);
  }
  
  void move(){
    posX += vel;
    if(posX > width){
      posX = 0;
    }
  }
  
  void run(){
    display();
    move();
  }
}
