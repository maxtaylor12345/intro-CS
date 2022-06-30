
int start = 1;// on|off
int frame = 20;//speed of change

float[] y = new float[9]; 
float[] ty = new float[9];
float[] rgb = new float[3];
float[] trgb = new float[3];

void setup() {
  size(1000, 1000);
  background(110, 110, 110);
    
  //starting y values
  for(int i = 0; i < 9; i++) y[i] = ty[i] = 1000;

  //starting color values
  for(int i = 0; i < 3; i++) rgb[i] = (float)(Math.random()*255);
  
  //starting target color values
  for(int i = 0; i < 3; i++) ty[i] = 000;
}

void mousePressed() {//on|off
  start = start + 1;
}

void draw() {

    if (start % 2 == 0) { //on|off
        if (frameCount % frame ==0) { //random value for target ys and color every "frame" frames 
            for (int i = 0; i < 9; i++) ty[i] = (float)(Math.random()*1000);
            for (int i = 0; i < 3; i++) trgb[i] = (float)(Math.random()*255);
    }

    background(110); //move smoothly to target y/color instead of jumping

    for (int i = 0; i < 9; i++) y[i] = map(frameCount % frame, 0, frame-1, y[i], ty[i]);
    for (int i = 0; i < 3; i++) rgb[i] = map(frameCount % frame, 0, frame-1, rgb[i], trgb[i]);

    //color fill
    noStroke();
    fill(rgb[0], rgb[1], rgb[2]);
    beginShape();

    vertex(100, 1000);
    vertex(100, y[0]);
    for (int i = 1; i < 8; i++) {
        vertex(100*(i+1), y[i]);
        vertex(100*(i+1), 1000);
        vertex(100*(i+1), y[i]);
    }
    vertex(900, y[8]);
    vertex(900, 1000);
    endShape();

    //black lines
    strokeWeight(15);
    stroke(000);
    for (int i = 0; i < 9; i++) line(100*(i+1), 1000, 100*(i+1), y[i]);

    //white lines
    strokeWeight(10);
    stroke(255);
    for (int i = 0; i < 8; i++) line(100*(i+1), y[i], 100*(i+2), y[i+1]);

    //red dots
    strokeWeight(20);
    stroke(255, 000, 000);
    for (int i = 0; i < 9; i++) point(100*(i+1), y[i]);

    //println(ty[0], y[0]);
  }
}

//color i like:#167F9B
