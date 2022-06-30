int player1 = 0;
int player2 = 0;
int p1x=50;
int p1y1 = 150;
int p1y2 = 350;
int p2x = 50;
int p2y1 = 150;
int p2y2 = 350;
int bx = 0;
int by = 0;
int sx = 0;
int sy = 0;
int d = 50;
int ps = 3;
int start=0;
boolean p2 = true;

void setup() {
  size(1000, 500);
  background(000);
  bx = width/2;
  by=height/2;
  p2x = width-50;
}

void draw() {

  background(000);
  stroke(255);
  strokeWeight(20);
  line(p1x, p1y1, p1x, p1y2);
  line(p2x, p2y1, p2x, p2y2);
  circle(bx, by, d);
  bx +=sx;
  by +=sy;
  textSize(50);
  text(player1, width/2-250, 100);
  text(player2, width/2+250, 100);
  p1y1 = constrain(p1y1, 0, 300);
  p1y2 = constrain(p1y2, 200, height);
  p2y1 = constrain(p2y1, 0, 300);
  p2y2 = constrain(p2y2, 200, height);
  if (player1 >=3||player2>=3) {
    exit();
  }
  if (start % 2 != 0) {
    if (p2y1 == 0 || p2y2 == height) {
      p2 = !p2;
    }
    if (p2) {
      p2y1 +=ps;
      p2y2 +=ps;
    } else {
      p2y1 -=ps;
      p2y2 -=ps;
    }
    if (by+d/2 >= height || by-d/2 <= 0) {
      sy = -sy;
    }
    if (bx-d/2 <= 0) {
      player2 ++;
      bx = width/2;
      by = height/2;
      sx=0;
      sy=0;
      p1y1 = 150;
      p1y2 = 350;
      p2y1 = 150;
      p2y2 = 350;
      start++;
    }
    if (bx+d/2 >= width) {
      player1 ++;
      bx = width/2;
      by = height/2;
      sx=0;
      sy=0;
      p1y1 = 150;
      p1y2 = 350;
      p2y1 = 150;
      p2y2 = 350;
      start++;
    }
    if (bx-d/2 == p1x && by >= p1y1 && by <= p1y2) {
      sx = -sx;
    }
    if (bx+d/2 == p2x && by >= p2y1 && by <= p2y2) {
      sx = -sx;
    }

    if (p1y1 <= 0) {
      p1y1 = 1;
    }

    //uncomment following code to play two player(W.I.P.)
    //also comment lines 44-53

    //if (keyCode==38) {
    //  p2y1 -=ps;
    //  p2y2 -=ps;
    //}
    //if (keyCode==40) {
    //  p2y1 +=ps;
    //  p2y2 +=ps;
    //}

    if (keyCode==87) {
      p1y1 -=ps;
      p1y2 -=ps;
    }
    if (keyCode==83) {
      p1y1 +=ps;
      p1y2 +=ps;
    }
  }
}

void mouseClicked() {
  sx = 5;
  sy = 5;
  start ++;
}
