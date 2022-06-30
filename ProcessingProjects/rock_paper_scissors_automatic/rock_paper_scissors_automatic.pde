int hand;
int start = 0;
float r = random(100, 255);
float g = random(100, 255);
float b = random(100, 255);
void setup() {
  size(1000, 1000);
}
void mousePressed() {
  if (start == 4) {
    hand = int(random(3));
  }
  start++;
  if (start==5) {
    start =  1;
    r = random(100, 255);
    g = random(100, 255);
    b = random(100, 255);
  }
  println(hand, start);
}
void draw() {
  background(000);
  textSize(width/6);
  textAlign(CENTER);
  fill(#167F9B);
  if (start == 0) {
    text("click", width/2, 0+height/5);
  }
  if (start == 1) {
    text("rock", width/2, 0+height/5);
  } else if (start == 2) {
    text("paper", width/2, 0+height/5);
  } else if (start == 3) {
    text("scissors", width/2, 0+height/5);
  } else if (start ==4) {
    text("shoot", width/2, 0+height/5);
  }
  textSize(width/4);
  fill(r, g, b);
  if (hand==0&&start==4) {
    text("Rock", width/2, height/2);
  } else if (hand==1&&start==4) {
    text("Paper", width/2, height/2);
  } else if (hand ==2&&start==4) {
    text("Scissors", width/2, height/2);
  }
}
