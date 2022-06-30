/*
Maxwell Taylor
 6/23/22
 Graded Robot
 */
void mousePressed(){
  println(mouseX,mouseY);
}
  
int start = 1;

void setup() {
  size(1000, 1000);
  background(000);
  
  fill(255);
  textSize(50);
  text("Maxwell Taylor", 0, 990);

  //"neck"
  //idealy i would make it "bounce" but ran out of time
  fill(000);
  stroke(#49C4F0);
  strokeWeight(5);
  ellipse(500, 330, 100, 20);
  ellipse(500, 310, 150, 25);
  ellipse(500, 290, 200, 30);

//dangle
  stroke(#817A7A);
  line(500, 200, 500, 15);
  line(500, 15, 550, 25);
  fill(255,000,000);
  strokeWeight(.5);
  circle(550, 25, 10);

  //head and body"
  stroke(000);
  fill(#817A7A);
  circle(500, 175, 250);
  square(300, 350, 400);

  


    //eyes
    fill(#C7E836);
  triangle(480, 125, 430, 125, 455, 175);

  fill(#B911A3);
  quad(545, 125, 520, 150, 545, 175, 570, 150);


  //mouth
  fill(#760A1A);
  rect(450, 225, 100, 25, 50, 50, 50, 50);

  //supposed to be spider legs/cables that would pulse a color but ran out of time
  //supposed to be on both sides
  stroke(#ffffff);
  noFill();
  arc(225, 485, 300, 300, PI*3/4, PI*5/3);
  arc(225, 650, 300, 300, PI*3/4, PI*5/3);
  arc(225, 815, 300, 300, PI*5/6, PI*5/3);
}

//on/off switch
void mouseClicked() {
  start = start + 1;
}


void draw() {

  if (start % 2 ==0 ) {
    //started by looking online.
    //everything i found about random colors involved importing smth that i could not figure out so i came up with this
    int r1 = (int)(Math.random()*256);
    int g1 = (int)(Math.random()*256);
    int b1 = (int)(Math.random()*256);
    int r2 = (int)(Math.random()*256);
    int g2 = (int)(Math.random()*256);
    int b2 = (int)(Math.random()*256);
    int r3 = (int)(Math.random()*256);
    int g3 = (int)(Math.random()*256);
    int b3 = (int)(Math.random()*256);
    int r4 = (int)(Math.random()*256);
    int g4 = (int)(Math.random()*256);
    int b4 = (int)(Math.random()*256);
    int r5 = (int)(Math.random()*256);
    int g5 = (int)(Math.random()*256);
    int b5 = (int)(Math.random()*256);
    int r6 = (int)(Math.random()*256);
    int g6 = (int)(Math.random()*256);
    int b6 = (int)(Math.random()*256);
    int r7 = (int)(Math.random()*256);
    int g7 = (int)(Math.random()*256);
    int b7 = (int)(Math.random()*256);
    int r8 = (int)(Math.random()*256);
    int g8 = (int)(Math.random()*256);
    int b8 = (int)(Math.random()*256);
    int r9 = (int)(Math.random()*256);
    int g9 = (int)(Math.random()*256);
    int b9 = (int)(Math.random()*256);

    stroke(000);
    strokeWeight(1);
    //random color computer square thingies
    if (frameCount % 5==0) {
      fill(r1, g1, b1);
      square(345, 400, 100);
    }

    if (frameCount % 5==0) {
      fill(r2, g2, b2);
      square(450, 400, 100);
    }

    if (frameCount % 5==0) {
      fill(r3, g3, b3);
      square(555, 400, 100);
    }


    if (frameCount % 5==0) {
      fill(r4, g4, b4);
      square(345, 505, 100);
    }

    if (frameCount % 5==0) {
      fill(r5, g5, b5);
      square(450, 505, 100);
    }

    if (frameCount % 5==0) {
      fill(r6, g6, b6);
      square(555, 505, 100);
    }


    if (frameCount % 5==0) {
      fill(r7, g7, b7);
      square(345, 610, 100);
    }

    if (frameCount % 5==0) {
      fill(r8, g8, b8);
      square(450, 610, 100);
    }

    if (frameCount % 5==0) {
      fill(r9, g9, b9);
      square(555, 610, 100);
    }
  } else {
    //reset body
    stroke(000);
    fill(#817A7A);
    square(300, 350, 400);
  }













  /*
  //guidlines
   stroke(255, 000, 000);
   strokeWeight(3);
   line(500, 0, 500, 1000);
   line(0, 500, 1000, 500);
   
   */
}
