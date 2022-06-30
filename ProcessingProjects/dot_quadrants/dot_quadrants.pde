int start = 1;
float rx;
float ry;
void setup() {
  size(500, 500);
}
void mousePressed() {
  start++;
}
void draw() {
  rx = random(0, width);
  ry = random(0, height);
  if (start % 2 == 0) {
    strokeWeight(25);
    if (rx <= width/2 && rx >= 0 && ry <= height/2 && ry >= 0) {
      stroke(#A22645);
    } else if (rx >= width/2 && rx <= width && ry <= height/2 && ry >=0) {
      stroke(#26A235);
    } else if (rx <= width/2 && rx >= 0 && ry >= height/2 && ry <= height) {
      stroke(#A0A226);
    } else {
      stroke(#2654A2);
    }
    point(rx, ry);
  }
}
