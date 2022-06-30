
int x = 50;

void setup() {
  size(500, 500);
  background(#87CEEB);
  strokeWeight(5);
  stroke(000);
  fill(175, 167, 169);



  beginShape();

  vertex(50 + x, 400);
  vertex(50+ x, 200);
  vertex(75+ x, 100);
  vertex(100+ x, 200);
  vertex(250+ x, 200);
  vertex(275+ x, 100);
  vertex(300+ x, 200);
  vertex(300+ x, 400);
  vertex(250+ x, 400);
  vertex(125+ x, 400);
  vertex(125+ x, 400);

  endShape(CLOSE);
}

void draw() {
}

void mousePressed() {
  println(mouseX, mouseY);
  strokeWeight(6);
  point(mouseX, mouseY);
}
