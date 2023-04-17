class Votone extends Voto{
  Votone(float posX, float posY, float vel){
    super(posX, posY, vel);
  }
  
  int rdm = int(random(18, 30)); 
  
  void display(){
    noFill();
    stroke(255);
    square(posX, posY, 30);
    textSize(28);
    fill(255);
    text(rdm, posX + 1, posY + 25);
    text("LODE", posX - 15, posY + 52);
  }
}
