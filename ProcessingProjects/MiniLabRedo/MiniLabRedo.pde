void setup() {
  size(500, 500);
  background(#3AAFCE);
  for (int x=50; x<=width-100; x+=(width-150)/4) {
    boolean color1=random(0, 1)>.5;
    int suit1 = int(random(1, 5));
    int value1 = int(random(1, 11));
    fill(255);
    card(x, value1, suit1, color1);
  }
}
void card(int x1, int value, int suit, boolean suitColor) {
  rect(x1, height/2-50, 50, 100);
  textSize(50);
  fill(000);
  textAlign(CENTER, CENTER);
  text(value, x1+25, height/2);
  if (suit==1) {
    if (suitColor) {
      fill(#1A58D8);
    } else {
      fill(#1BBC4C);
    }
    teardrop(x1+40, height/2-30, 10);
  } else if (suit==2) {
    if (suitColor) {
      fill(#BC231B);
    } else {
      fill(#B1BC1B);
    }
    circle(x1+40, height/2-40, 15);
  }else if (suit==3) {
    if (suitColor) {
      fill(#651BBC);
    } else {
      fill(#8E0B0B);
    }
    diamond(x1+35, height/2-45, 15);
  }else if (suit==4) {
    if (suitColor) {
      fill(000);
    } else {
      fill(255);
    }
    square(x1+30, height/2-45, 15);
  }
}
void teardrop(float x, float y, float w) {
  triangle(x-w/2, y, x, y-1.5*w, x+w/2, y);
  arc(x, y, w, w, radians(-3), radians(183), OPEN);
}
void diamond(float x, float y, float w) {
  push();
  translate(x, y);
  rotate(radians(45));
  square(0, 0, w);
  pop();
}
