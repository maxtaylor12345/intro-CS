
float r = 0;
int t = 0;
int s = 0;
float c = 0;

//233, 51, 35

void setup() {
  size(500, 500);
  background(0);
}

void draw() {
  background(0);

  fill(r, r-284, r-268);
  circle(width/2, height/2, 200);


  fill(255);
  triangle(0, 0, 0, 100, 115 + t, 50);
  t += 1;
  stroke(0);
  square(0, 0, 200-s);
  s += 2;
  square(300, c, 50);
  c+=1.25;

  if (c ==500) {

    c = 0;
  }
  if (r==233) {
  } else {
    r = r+.5;
  }
}

void mousePressed() {
  r = 0;
  c = 0;
  s = 0;
  t = 0;
}
