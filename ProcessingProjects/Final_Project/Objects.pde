void player(float pSize) {
  push();
  translate(pX, pY);
  fill(255);
  noStroke();
  triangle(-(pSize*6), pSize*2, (pSize*6), pSize*2, 0, pSize*17);
  circle(0, (pSize*5)-(9.3333*pSize), pSize*10);
  pop();
  hitBox(pX, pY+pSize*2.5, pSize*12.5, pSize*28, false);
}

void enemy(){}
