void player() {//player object
  push();
  translate(pX, pY);
  fill(255);
  noStroke();
  triangle(-(SP*6), SP*2, (SP*6), SP*2, 0, SP*17);
  circle(0, (SP*5)-(9.3333*SP), SP*10);
  pop();
  if (!alive) {
    gameOver = true;
  }
  hitBox(pX, pY+SP*2.5, SP*12.5, SP*28, false);
}
void enemy(float x, float y, float size) {//ball object
  circle(x, y, size);
}
