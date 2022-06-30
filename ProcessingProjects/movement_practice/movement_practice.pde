

int x = 0;
int y = 0;
int xy = 0;


void setup() {
  size(500, 500);
  background(0);
}

void draw() {

  //background(0); 
  fill(#4580E3);
  circle(0+x, height/2, 100);
  fill(#7E1CE8);
  circle(width/2, 0+y, 100);
  fill(#F5029C);
  circle(500-x, height/2, 100);
  fill(#24C638);
  circle(width/2, 500-y, 100);
  fill(#E3BE02);
  circle(width/2+xy, height/2+xy, 100);
  circle(width/2-xy, height/2-xy, 100);
  circle(width/2-xy, height/2+xy, 100);
  circle(width/2+xy, height/2-xy, 100);
  x=x+1;
  y=y+1;
  xy=xy+1;



    if (x==500) {
    x = 0;
    background(0);
  }
  if (y==500) {
    y = 0;
  }
  if (xy==250) {
    xy = 0;
    
  }
}
