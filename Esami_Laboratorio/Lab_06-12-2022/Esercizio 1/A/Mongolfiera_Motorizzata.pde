class Mongolfiera_Motorizzata extends Mongolfiera{
  color c = int (random(0, 255));
  Mongolfiera_Motorizzata(float posX, float posY, float vel){
    super(posX, posY, vel/2);
  }
  
  void display(){
    fill(c);
    stroke(c);
    circle(posX, posY, 70);
    rect(posX - 30, posY + 50, 60, 30);
    line(posX - 35, posY, posX - 30, posY + 50);
    line(posX + 35, posY, posX + 30, posY + 50);
  }

  void move(){
    posX += vel;
    if(posX < 35 || posX > width - 35){
      vel = vel * (-1);
    }
  }
  
  void run(){
    display();
    move();
  }
}
