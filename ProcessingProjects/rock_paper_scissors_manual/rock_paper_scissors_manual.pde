//mouse variables
int handX;
int handY;
void setup() {
  size(1000, 1000);
}
void mousePressed() {//button press detection
  handX = mouseX;
  handY = mouseY;
}
void draw() {
  background(000);
  textAlign(CENTER);
  textSize(width/4);
  fill(#A22626);
  square(100, 800, 100);
  if (handX >= 100 && handX<=200 //check within button definition
                   && handY >= 800 && handY<= 900) {
    text("Rock", width/2, height/2);
  }
  fill(#26A235);
  square(450, 800, 100);
  if (handX >= 450 && handX <= 550 //check within button definition
                   && handY >= 800 && handY <= 900) {
    text("Paper", width/2, height/2);
  }
  fill(#167F9B);
  square(800, 800, 100);
  if (handX >= 800 && handX <= 900 //check within button definition
                   && handY >= 800 && handY <= 900) {
    text("Scissors", width/2, height/2);
  }
}
