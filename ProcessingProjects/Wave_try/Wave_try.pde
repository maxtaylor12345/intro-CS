int start = 1;// on|off
int frame = 50;//speed of change
//starting y values
float y1 = 1000;
float y2 = 1000;
float y3 = 1000;
float y4 = 1000;
float y5 = 1000;
float y6 = 1000;
float y7 = 1000;
float y8 = 1000;
float y9 = 1000;
//starting target y values
float ty1 = 1000;
float ty2 = 1000;
float ty3 = 1000;
float ty4 = 1000;
float ty5 = 1000;
float ty6 = 1000;
float ty7 = 1000;
float ty8 = 1000;
float ty9 = 1000;
//starting color values
float r = (float)(Math.random()*255);
float g = (float)(Math.random()*255);
float b = (float)(Math.random()*255);
//starting target color values
float tr = 000;
float tg = 000;
float tb = 000;

void setup() {
  size(1000, 1000);
  background(110, 110, 110);
}

void mousePressed() {//on|off
  start = start +1;
}

void draw() {

  if (start % 2==0) {//on|off

    if (frameCount % frame ==0) {//random value for target ys and color every "frame" frames
      ty1 = (float)(Math.random()*1000);
      ty2 = (float)(Math.random()*1000);
      ty3 = (float)(Math.random()*1000);
      ty4 = (float)(Math.random()*1000);
      ty5 = (float)(Math.random()*1000);
      ty6 = (float)(Math.random()*1000);
      ty7 = (float)(Math.random()*1000);
      ty8 = (float)(Math.random()*1000);
      ty9 = (float)(Math.random()*1000);
      tr = random(15, 255);
      tg = random(15, 255);
      tb = random(15, 255);
    }
    background(110);//move smoothly to target y/color instead of jumping
    y1=map(frameCount % frame, 0, frame-1, y1, ty1);
    y2=map(frameCount % frame, 0, frame-1, y2, ty2);
    y3=map(frameCount % frame, 0, frame-1, y3, ty3);
    y4=map(frameCount % frame, 0, frame-1, y4, ty4);
    y5=map(frameCount % frame, 0, frame-1, y5, ty5);
    y6=map(frameCount % frame, 0, frame-1, y6, ty6);
    y7=map(frameCount % frame, 0, frame-1, y7, ty7);
    y8=map(frameCount % frame, 0, frame-1, y8, ty8);
    y9=map(frameCount % frame, 0, frame-1, y9, ty9);
    r=map(frameCount % frame, 0, frame-1, r, tr);
    g=map(frameCount % frame, 0, frame-1, g, tg);
    b=map(frameCount % frame, 0, frame-1, b, tb);

    //color fill
    noStroke();
    fill(r, g, b);
    beginShape();
    vertex(100, 1000);
    vertex(100, y1);
    vertex(200, y2);
    vertex(200, 1000);
    vertex(200, y2);
    vertex(300, y3);
    vertex(300, 1000);
    vertex(300, y3);
    vertex(400, y4);
    vertex(400, 1000);
    vertex(400, y4);
    vertex(500, y5);
    vertex(500, 1000);
    vertex(500, y5);
    vertex(600, y6);
    vertex(600, 1000);
    vertex(600, y6);
    vertex(700, y7);
    vertex(700, 1000);
    vertex(700, y7);
    vertex(800, y8);
    vertex(800, 1000);
    vertex(800, y8);
    vertex(900, y9);
    vertex(900, 1000);
    endShape();

    //black lines
    strokeWeight(15);
    stroke(000);
    line(100, 1000, 100, y1);
    line(200, 1000, 200, y2);
    line(300, 1000, 300, y3);
    line(400, 1000, 400, y4);
    line(500, 1000, 500, y5);
    line(600, 1000, 600, y6);
    line(700, 1000, 700, y7);
    line(800, 1000, 800, y8);
    line(900, 1000, 900, y9);

    //white lines
    strokeWeight(10);
    stroke(255);
    line(100, y1, 200, y2);
    line(200, y2, 300, y3);
    line(300, y3, 400, y4);
    line(400, y4, 500, y5);
    line(500, y5, 600, y6);
    line(600, y6, 700, y7);
    line(700, y7, 800, y8);
    line(800, y8, 900, y9);

    //red dots
    strokeWeight(20);
    stroke(255, 000, 000);
    point(100, y1);
    point(200, y2);
    point(300, y3);
    point(400, y4);
    point(500, y5);
    point(600, y6);
    point(700, y7);
    point(800, y8);
    point(900, y9);

    //println(ty1, y1);
  }
}

//color i like:#167F9B
