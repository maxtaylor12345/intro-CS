boolean start = false;
float rx;
float ry;
float color1;
void setup() {
  size(500, 500);
  color1 = random(256);
}
void mousePressed() {
  start=true;
}
void draw() {
  rx = random(0, width);
  ry = random(0, height);
  stroke(map(rx, 0, width, 0, 255), map(ry, 0, height, 0, 255), color1);
strokeWeight(25);
  /*if (start) {
   strokeWeight(20);
   if (rx <= width/2 && rx >= 0 && ry <= height/2 && ry >= 0) {
   stroke(#A22645);
   } else if (rx >= width/2 && rx <= width && ry <= height/2 && ry >=0) {
   stroke(#26A235);
   } else if (rx <= width/2 && rx >= 0 && ry >= height/2 && ry <= height) {
   stroke(#A0A226);
   } else {
   stroke(#2654A2);
   }
   */
  point(rx, ry);
}
