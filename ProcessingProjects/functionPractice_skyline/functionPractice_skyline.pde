
void setup() {
  size(1000, 1000);
  background(#4ABAF5);
  fill(#1C8B3E);
  rect(0, 4.5*(height/5), width, height/5);
}

void draw() {
  if (frameCount % 100 ==0) {
    size(1000, 1000);
    background(#4ABAF5);
    fill(#1C8B3E);
    rect(0, 4.5*(height/5), width, height/5);

    house(1*width/5, 4*(height/5), 100, (random(0, 1) < 0.5));
    house(2*width/5, 4*(height/5), 100, (random(0, 1) < 0.5));
    house(3*width/5, 4*(height/5), 100, (random(0, 1) < 0.5));
    house(4*width/5, 4*(height/5), 100, (random(0, 1) < 0.5));
  }
}

void house(float x, float y, float size, boolean big) {
  if (!big) {
    fill(#6C460D);
    rect(x, y, size, size);
    fill(#6C250D);
    triangle(x-size/2, y, x+size/2, y-5*(size/6), x+1.5*size, y);
    rect(x+size/4, y+size/2, size/2, size/2);
    circle(x+2.75*size/4, y+3*size/4, size/10);
  } else if (big) {
    fill(#83807F);
    rect(x, y-height/2, size, size+width/2);
    fill(#DAED0E);
    rect(x+size/7, (y-height/2)+size/7, size/4, size/4);
    rect(x+size-size/7, (y-height/2)+size/7, -size/4, size/4);
    rect(x+size/7, (y-height/2)+size/7+3*(size/8), size/4, size/4);
    rect(x+size-size/7, (y-height/2)+size/7+3*(size/8), -size/4, size/4);
    rect(x+size/7, (y-height/2)+size/7+6*(size/8), size/4, size/4);
    rect(x+size-size/7, (y-height/2)+size/7+6*(size/8), -size/4, size/4);
    rect(x+size/7, (y-height/2)+size/7+9*(size/8), size/4, size/4);
    rect(x+size-size/7, (y-height/2)+size/7+9*(size/8), -size/4, size/4);
    rect(x+size/7, (y-height/2)+size/7+12*(size/8), size/4, size/4);
    rect(x+size-size/7, (y-height/2)+size/7+12*(size/8), -size/4, size/4);
    rect(x+size/7, (y-height/2)+size/7+15*(size/8), size/4, size/4);
    rect(x+size-size/7, (y-height/2)+size/7+15*(size/8), -size/4, size/4);
  }
}
