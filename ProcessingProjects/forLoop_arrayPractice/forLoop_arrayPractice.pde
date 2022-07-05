/*float[] tearX = new float[1];
 float[] tearY = new float[1];
 float[] tearYspeed = new float[10];
 float yspeed = 3;
 int puddleY = 0;
 int alength = 1;
 
 void setup() {
 size(500, 500);
 background(#270858);
 for (int i = 0; i<alength; i++) {
 float x = random(0, width);
 float y = random(0, height);
 tearX[i] = x;
 tearY[i]= y;
 tearYspeed[i] = yspeed;
 }
 }
 void mousePressed() {
 for (int i = 0; i<alength; i++) {
 float x = mouseX;
 float y = mouseY;
 tearX[i] = x;
 tearY[i]= y;
 yspeed=3;
 }
 alength++;
 tearX = new float[alength];
 tearY = new float[alength];
 }
 void draw() {
 background(#270858);
 fill(#2986B7);
 for (int i = 0; i<alength; i++) {
 teardrop(tearX[i], tearY[i], 25);
 tearY[i]+=yspeed;
 if (tearY[i]>=height) {
 puddleY++;
 yspeed=0;
 tearY[i]=-10;
 }
 }
 rect(0, height-puddleY, width, height);
 
 fill(000);
 rect(0, 0, 100, 50);
 textAlign(CENTER, CENTER);
 textSize(30);
 fill(255);
 text(puddleY, 50, 25);
 }
 void teardrop(float x, float y, float w) {
 triangle(x-w/2, y, x, y-1.5*w, x+w/2, y);
 arc(x, y, w, w, radians(-3), radians(183), OPEN);
 }
 */


float[] tearX = new float[10];
float[] tearY = new float[10];
float[] yspeed = new float[10];
float puddleY = 0;




void setup() {
  size(500, 500);
  background(#270858);
  for (int i = 0; i<tearX.length; i++) {
    tearX[i] = random(0, width);
    tearY[i]= random(0, height);
    yspeed[i] = random(3, 6);
  }
}

void draw() {
  background(#270858);
  fill(#2986B7);
  for (int i = 0; i<tearX.length; i++) {
    tearY[i]+=yspeed[i];
    teardrop(tearX[i], tearY[i], 25);
    if (tearY[i]>=height-puddleY) {
      tearY[i]=0;
      tearX[i] = random(0, width);
      puddleY+=.255;
    }
  }

  rect(0, height-puddleY, width, height);

  fill(000);
  rect(0, 0, 100, 50);
  textAlign(CENTER, CENTER);
  textSize(30);
  fill(255);
  text(puddleY, 50, 25);
}

void teardrop(float x, float y, float w) {
  triangle(x-w/2, y, x, y-1.5*w, x+w/2, y);
  arc(x, y, w, w, radians(-3), radians(183), OPEN);
}
