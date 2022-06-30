/*
Maxwell Taylor
 6/23/22
 Graded Robot
 */
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
int y1 = 0;
int y2 = 0;
int y3 = 0;
int cx = 0;
int cy = 0;
int cx2 = 0;
int cy2 = 0;
int cx3 = 0;
int cy3 = 0;
int cx4 = 0;
int cy4 = 0;
boolean dir = true;
boolean cdir = true;
boolean dirc = true;
boolean cdir2 = false;
boolean dirc2 = false;
boolean cdir3 = true;
boolean dirc3 = false;
boolean cdir4 = false;
boolean dirc4 = true;

void mousePressed() {
  println(mouseX, mouseY);
}

int start = 1;

void setup() {
  size(1000, 1000);
}

//on/off switch
void mouseClicked() {
  start = start + 1;
}


void draw() {

  background(000);
  fill(255);
  textSize(50);
  text("Maxwell Taylor", 0, 990);


  //dangle
  stroke(#817A7A);
  line(500, 200, 500, 15);
  line(500, 15, 550, 25);
  fill(255, 000, 000);
  strokeWeight(.5);
  circle(550, 25, 10);

  //"neck"
  //idealy i would make it "bounce" but ran out of time
  push();
  fill(000);
  stroke(#49C4F0);
  strokeWeight(5);
  ellipse(500, 330+y1, 100, 20);
  ellipse(500, 310+y2, 150, 25);
  ellipse(500, 290+y3, 200, 30);

  if (frameCount % 10 == 0) {
    if (dir) {
      y1++;
      y2++;
      y3++;
    } else {
      y1--;
      y2--;
      y3--;
    }
    if (y1==5||y1==-5) {
      dir = !dir;
    }
  }



  pop();
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
  fill(#296ECB);
  circle(500+cx, 237.5+cy, 10);
  circle(500+cx2, 237.5+cy2, 10);
  fill(#FC2BC9);
  circle(500+cx3, 237.5+cy3, 10);
  circle(500+cx4, 237.5+cy4, 10);
  if (500+cx >= 550 || 500+cx <= 450) {
    dirc = !dirc;
  }
  if (237.5+cy <= 225||237.5+cy>=250) {
    cdir = !cdir;
  }

  if (dirc) {
    cx++;
  } else {
    cx--;
  }
  if (cdir) {
    cy--;
  } else {
    cy++;
  }

  if (500+cx2 >= 550 || 500+cx2 <= 450) {
    dirc2 = !dirc2;
  }
  if (237.5+cy2 <= 225||237.5+cy2>=250) {
    cdir2 = !cdir2;
  }

  if (dirc2) {
    cx2++;
  } else {
    cx2--;
  }

  if (cdir2) {
    cy2--;
  } else {
    cy2++;
  }
  if (500+cx3 >= 550 || 500+cx3 <= 450) {
    dirc3 = !dirc3;
  }
  if (237.5+cy3 <= 225||237.5+cy3>=250) {
    cdir3 = !cdir3;
  }

  if (dirc3) {
    cx3++;
  } else {
    cx3--;
  }
  if (cdir3) {
    cy3--;
  } else {
    cy3++;
  }
  if (500+cx4 >= 550 || 500+cx4 <= 450) {
    dirc4 = !dirc4;
  }
  if (237.5+cy4 <= 225||237.5+cy4>=250) {
    cdir4 = !cdir4;
  }

  if (dirc4) {
    cx4++;
  } else {
    cx4--;
  }
  if (cdir4) {
    cy4--;
  } else {
    cy4++;
  }



  //supposed to be spider legs/cables that would pulse a color but ran out of time
  //supposed to be on both sides
  stroke(#ffffff);
  noFill();
  arc(225, 485, 300, 300, PI*3/4, PI*5/3);
  arc(225, 650, 300, 300, PI*3/4, PI*5/3);
  arc(225, 815, 300, 300, PI*5/6, PI*5/3);

  if (start % 2 ==0 ) {


    if (frameCount % 5 == 0) {
      //started by looking online.
      //everything i found about random colors involved importing smth that i could not figure out so i came up with this
      r1 = (int)(Math.random()*256);
      g1 = (int)(Math.random()*256);
      b1 = (int)(Math.random()*256);
      r2 = (int)(Math.random()*256);
      g2 = (int)(Math.random()*256);
      b2 = (int)(Math.random()*256);
      r3 = (int)(Math.random()*256);
      g3 = (int)(Math.random()*256);
      b3 = (int)(Math.random()*256);
      r4 = (int)(Math.random()*256);
      g4 = (int)(Math.random()*256);
      b4 = (int)(Math.random()*256);
      r5 = (int)(Math.random()*256);
      g5 = (int)(Math.random()*256);
      b5 = (int)(Math.random()*256);
      r6 = (int)(Math.random()*256);
      g6 = (int)(Math.random()*256);
      b6 = (int)(Math.random()*256);
      r7 = (int)(Math.random()*256);
      g7 = (int)(Math.random()*256);
      b7 = (int)(Math.random()*256);
      r8 = (int)(Math.random()*256);
      g8 = (int)(Math.random()*256);
      b8 = (int)(Math.random()*256);
      r9 = (int)(Math.random()*256);
      g9 = (int)(Math.random()*256);
      b9 = (int)(Math.random()*256);
    }
    stroke(000);
    strokeWeight(1);
    //random color computer square thingies

    fill(r1, g1, b1);
    square(345, 400, 100);



    fill(r2, g2, b2);
    square(450, 400, 100);


    fill(r3, g3, b3);
    square(555, 400, 100);




    fill(r4, g4, b4);
    square(345, 505, 100);



    fill(r5, g5, b5);
    square(450, 505, 100);



    fill(r6, g6, b6);
    square(555, 505, 100);




    fill(r7, g7, b7);
    square(345, 610, 100);



    fill(r8, g8, b8);
    square(450, 610, 100);


    fill(r9, g9, b9);
    square(555, 610, 100);
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
