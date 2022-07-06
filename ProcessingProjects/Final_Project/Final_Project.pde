float pX = width/2;
float pY = height/2;
boolean[] wasd = new boolean[4];
float pXspeed = 0;
float pYspeed = 0;
float speed = 5;
boolean hbShow = true;
boolean Wgo = true;
boolean Ago = true;
boolean Sgo = true;
boolean Dgo = true;
boolean start = false;
int Countdown = -1;
int count;
void setup() {
  size(1000, 1000);
  background(000);
}
void draw() {
  if (start) {
    count++;
    background(000);
    direction();
    pX+=pXspeed;
    pY+=pYspeed;
    player(3.75);

    if (Countdown>=0) {
      fill(255);
      textAlign(CENTER, CENTER);
      textSize(100);
      text(Countdown, width/2, height/2-300);
      if (count % 60 == 0) {
        Countdown--;
      }
    } else {
      println(pX, pY+7.5);
      if (rectangleCircleCollisionCheck(pX, pY+3.75*2.5, 3.75*12.5, 3.75*28, width/2, 100, 500)) {
        fill(255, 0, 0);
      } else {
        fill(255);
      }
      circle(width/2, 100, 500);
    }
  } else {
    rectMode(CENTER);
    fill(255);
    rect(width/2, height/2-50, 100, 50);
    textAlign(CENTER, CENTER);
    fill(000);
    textSize(25);
    text("Start", width/2, height/2-55);
  }
}

void mousePressed() {
  if (mouseX>=width/2-50&&mouseX<=width/2+50&&mouseY>=height/2-75&&mouseY<=height/2+25&&!start) {
    start=true;
    Countdown=3;
  }
}
