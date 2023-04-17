class Casa{
  float posX, posY, velocita;
  Casa(float posX, float posY, float vel){
    this.posX = posX;
    this.posY = posY;
    this.velocita = vel;
  }
  
  void display(){
    noFill();
    stroke(255, 255, 0);
    rect(posX, posY, 30, 30);
    triangle(posX - 5, posY, posX + 15, posY - 10, posX + 35, posY);
  }
  
  void move(){
    posX += velocita;
    if(posX >= width || posX < 0){
      velocita = velocita * (-1);
    }
  }
  
  void run(){
    display();
    move();
  }
}
