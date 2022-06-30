int y1 = height/2;
int x1 = width/2;
int ys = 5;
int xs = 5;
int d = 100;
boolean directiony = true;
boolean directionx = true;

void mousePressed() {
  y1 =mouseY;
  x1 =mouseX;
  directionx = random(0, 1) < 0.5;
  directiony = random(0, 1) < 0.5;
  ys = (int)(Math.random()*20)+5;
  xs = (int)(Math.random()*20)+5;
  println(x1, y1);
}

//first
void setup() {
  size (1000, 500);
}

void draw() {
  background(140);
  strokeWeight(10);
  fill(#167F9B);
  circle(x1, y1, d);


  if (y1-d/2<=0||y1+d/2>=height) {
    directiony = !directiony;
  }
  if (directiony) {
    y1-=ys;
  } else {
    y1+=ys;
  }
  if (x1-d/2<=0||x1+d/2>=width) {
    directionx = !directionx;
  }
  if (directionx) {
    x1-=xs;
  } else {
    x1+=xs;
  }
}
