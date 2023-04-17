class MongolfieraMotorizzata extends Mongolfiera {
   color c = int(random(0, 255));
   MongolfieraMotorizzata(float posX, float posY, float vel) {
   super(posX, posY, vel / 2);
   }
   
   void display() {
    fill(c);
    ellipse(posX, posY, 70, 70);
    rect(posX - 30, posY + 45, 60, 30);
    line(posX - 35, posY, posX - 30, posY + 45);
    line(posX + 35, posY, posX + 30, posY + 45);
   }
   
   void move() {
     posX += vel;
     if (posX > width - 35 || posX < 35) vel = -vel;
   }
 
 
}
