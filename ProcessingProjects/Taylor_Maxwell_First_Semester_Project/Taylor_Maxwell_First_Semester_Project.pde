/*
Maxwell Taylor
 intro CompSci
 semester 1 project
 6/29/22
 */
//used in movement as to not get stuck on wall
String lastWall2;
String lastWall3;
//color choosing and setting
float r2 = 0;//red value of line 2
float g2 = 0;//green value of line 2
float b2 = 0;//blue value of line 2
float r3 = 0;//red value of line 3
float g3 = 0;//green value of line 3
float b3 = 0;//blue value of line 3
float rgb2;//counter for end
float rgb3;//counter for end
int color2;//randomizer
int color3;//randomizer
int colorSpeed = 20;//change per colorSpeed frames
//first line
float startX;
float startY;
float moveX;
float moveY;
float xspeed1;
float yspeed1;
//second and third lines
float line2Startx;
float line3Startx;
float line2Starty;
float line3Starty;
float xspeed2;
float xspeed3;
float yspeed2;
float yspeed3;
//on|off
boolean start = false;
boolean stop = false;
//switch between primary and secondary lines
boolean firstline = true;
void setup() {
  size(1000, 1000, P2D);
  background(000);
}
void mousePressed() {//randomize initial values and on switch
  if (!start) {
    background(000);
    startX=mouseX;
    startY=mouseY;
    moveX=startX;
    moveY=startY;
    xspeed1 = random(-10, 10);
    yspeed1 = random(-10, 10);
    start = true;
    while (color2==color3) {//guarantees colors are not the same
      color2 = (int)random(6);
      color3 = (int)random(6);
    }
  }
}
void draw() {
  if (start) {
    strokeWeight(10);
    stroke(100);
    if (firstline) {//primary line
      line(startX, startY, startX+xspeed1, startY+yspeed1);
      startX+=xspeed1;
      startY+=yspeed1;
      //set secondary line start points to primary line end point
      line2Startx=startX+xspeed1;
      line2Starty=startY+yspeed1;
      line3Startx=startX+xspeed1;
      line3Starty=startY+yspeed1;
      /*custome wall function inputs:
       wall1, wall2, wall3, wall4, x of point, y of point, line number*/
      checkWall(0+10, width-10, 0+10, height-10, startX+xspeed1, startY+yspeed1, 1);
    } else if (!firstline) {//primary|secondary switch
      if (rgb2<156) {
        if (frameCount % colorSpeed ==0) {//speed control
          //different randomized values create different colors
          if (color2==0) {
            r2++;
            //g2++;
            //b2++;
            rgb2++;
          } else if (color2==1) {
            //r2++;
            g2++;
            //b2++;
            rgb2++;
          } else if (color2==2) {
            //r2++;
            //g2++;
            b2++;
            rgb2++;
          } else if (color2==3) {
            r2++;
            g2++;
            //b2++;
            rgb2++;
          } else if (color2==4) {
            r2++;
            //g2++;
            b2++;
            rgb2++;
          } else if (color2==5) {
            //r2++;
            g2++;
            b2++;
            rgb2++;
          }
        }
      }
      stroke(100+r2, 100+g2, 100+b2);//control color using above
      line(line2Startx, line2Starty, line2Startx+xspeed2, line2Starty+yspeed2);
      line2Startx+=xspeed2;
      line2Starty+=yspeed2;
      checkWall(0+10, width-10, 0+10, height-10, line2Startx, line2Starty, 2);
      if (rgb3<156) {
        if (frameCount % colorSpeed == 0) {
          if (color3==0) {
            r3++;
            //g3++;
            //b3++;
            rgb3++;
          } else if (color3==1) {
            //r3++;
            g3++;
            //b3++;
            rgb3++;
          } else if (color3==2) {
            //r3++;
            //g3++;
            b3++;
            rgb3++;
          } else if (color3==3) {
            r3++;
            g3++;
            //b3++;
            rgb3++;
          } else if (color3==4) {
            r3++;
            //g3++;
            b3++;
            rgb3++;
          } else if (color3==5) {
            //r3++;
            g3++;
            b3++;
            rgb3++;
          }
        }
      }
      stroke(100+r3, 100+g3, 100+b3);
      line(line3Startx, line3Starty, line3Startx+xspeed3, line3Starty+yspeed3);
      line3Startx+=xspeed3;
      line3Starty+=yspeed3;
      checkWall(0+10, width-10, 0+10, height-10, line3Startx, line3Starty, 3);
      if (line2Startx+xspeed2==line3Startx+xspeed3&&line3Starty+yspeed2==line3Starty+yspeed3) {
        stop = true;
      }
    }
  }
  if (rgb2>=156&&rgb3>=156) {/*after colors reach there final values the wall function turns off;
   off switch*/
    stop = true;
  }
}
/*the parameters of custome wall function:
 wall1, wall2, wall3, wall4, point checkX, point checkY*/
void checkWall(int x1, int x2, int y1, int y2, float checkX, float checkY, int linenum) {
  if (!stop) {
    if (checkX<=x1) {//left wall
      //first collision switches from primary to secondary
      firstline=false;
      if (linenum==1) {//removes primary line
        background(0);
      }
      if ((linenum==2||linenum==1)&&lastWall2!="left2") {
        xspeed2 = random(10);
        yspeed2 = random(-10, 10);
        lastWall2= "left2";
      }
      if ((linenum==3||linenum==1)&&lastWall3!="left3") {
        xspeed3 = random(10);
        yspeed3 = random(-10, 10);
        lastWall3="left3";
      }
    }
    if (checkX>=x2) {//right wall
      firstline=false;
      if (linenum==1) {
        background(0);
      }
      if ((linenum==2||linenum==1)&&lastWall2!="right2") {
        xspeed2 = random(-10, 0);
        yspeed2 = random(-10, 10);
        lastWall2="right2";
      }
      if ((linenum==3||linenum==1)&&lastWall3!="right3") {
        xspeed3 = random(-10, 0);
        yspeed3 = random(-10, 10);
        lastWall3="right3";
      }
    }
    if (checkY<=y1) {//top wall
      firstline=false;
      if (linenum==1) {
        background(0);
      }
      if ((linenum==2||linenum==1)&&lastWall2!="top2") {
        xspeed2 = random(-10, 10);
        yspeed2 = random(10);
        lastWall2 = "top2";
      }
      if ((linenum==3||linenum==1)&&lastWall3!="top3") {
        xspeed3 = random(-10, 10);
        yspeed3 = random(10);
        lastWall3="top3";
      }
    }
    if (checkY>=y2) {//bottom wall
      firstline=false;
      if (linenum==1) {
        background(0);
      }
      if ((linenum==2||linenum==1)&&lastWall2!="bottom2") {
        xspeed2 = random(-10, 10);
        yspeed2 = random(-10);
        lastWall2="bottom2";
      }
      if (linenum==3||linenum==1&&lastWall3!="bottom3") {
        xspeed3 = random(-10, 10);
        yspeed3 = random(-10);
        lastWall3="bottom3";
      }
    }
  }
}
/*
 feedback:
 reach final color go back
 -is doable however I want my code to prodouce a final image not loop infinitly
 click a second time
 -requires custome line function and arrays
 --origional plan
 width change
 -earlier lines are hidden and looks messy
 proccess:
 my final project was very different from my initial idea.
 my idea began with a line that split into lines that split for ever and ever but I quickly learned that was to complicated.
 the new idea uses similar ideas. However, if we had learned more about functions and arrays, I would have liked to do the full thing.
 a challenging part was making sure the walls worked because initialy the lines would get stuck behined the wall.
 I enjoyed randomizing the angles and coding the color gradient because it had a very clear outcome on the gui.
 it was not my origional goal, however now I cant help but think it looks like the stereotypical 80s year book background.
 */
