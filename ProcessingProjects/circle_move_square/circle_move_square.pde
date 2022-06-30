int start = 1;
//circle dimensions
int d;
float cx;
float cy;
//speed
int xs = 20;
int ys = 20;
//direcion switches
boolean xdir = true;
boolean xdir2 = false;
boolean ydir = false;
boolean ydir2 = false;
//switch on|off
void mousePressed() {
  start ++;
 
}
void setup() {
  size(1000, 1000);
  cx = width/6;
  cy = height/6;
  d = 100;
}
void draw() {
  background(000);
  strokeWeight(10);
  stroke(255);
  fill(#167F9B);
  circle(cx, cy, d);

  if (start % 2 ==0) {//on|off


    if (cx >=5*(width/6)&&cy<=height/6) {//first switch
      xdir = !xdir;
      ydir = !ydir;
      //println (xdir, ydir, xdir2, ydir2);
    }
    if (cy >=5*(height/6) && cx >= 5*(width/6)) {//second switch
      ydir = !ydir;
      xdir2 = !xdir2;
      //println (xdir, ydir, xdir2, ydir2);
    }
    if (cx <= width/6 && cy >= 5*(height/6)) {//third switch
      xdir2 = !xdir2;
      ydir2 = !ydir2;
      //println (xdir, ydir, xdir2, ydir2);
    }
    if (cy <= height/6 && cx<=width/6) {//fourth switch
      ydir2 = !ydir2;
      xdir = !xdir;
      //println (xdir, ydir, xdir2, ydir2);
    }
    //switches
    if (xdir) {
      cx +=xs;
    } else if (xdir2) {
      cx -=xs;
    }
    if (ydir) {
      cy +=ys;
    } else if (ydir2) {
      cy -=ys;
    }
  }
}
