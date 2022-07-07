void hitBox(float centerX, float centerY, float radx, float rady, boolean circle) {//draws hittbox around target
  if (hbShow) {//visible hitbox can be turned on and off
    strokeWeight(1);
    noFill();
    stroke(255, 000, 000);
  } else {
    noFill();
    noStroke();
  } //<>//
  if (circle) {
    circle(centerX, centerY, radx); 
  } else {
    rectMode(CENTER);
    rect(centerX, centerY, radx, rady);
    checkWallRect(0, width, 0, height, (centerX-radx/2)-2, (centerX+radx/2)+2, (centerY-rady/2)-3, (centerY+rady/2)+3.5, true);//call check wall function
  }
}
void checkWallRect(int x1, int x2, int y1, int y2, float checkX1, float checkX2, float checkY1, float checkY2, boolean player) {//check wall for rectangles
  if (player) {
    if (checkX1<=x1) {//left wall
      pXspeed = 0;
      wasd[1]=false;
      Ago = false;
    } else {
      Ago = true;
    }
    if (checkX2>=x2) {//right wall
      pXspeed = 0;
      wasd[3]=false;
      Dgo = false;
    } else {
      Dgo = true;
    }
    if (checkY1<=y1) {//top wall
      pYspeed = 0;
      wasd[0] = false;
      Wgo = false;
    } else {
      Wgo = true;
    }
    if (checkY2>=y2) {//bottom wall
      pYspeed = 0;
      wasd[2] = false;
      Sgo = false;
    } else {
      Sgo = true;
    }
  }
}
void checkWallBall(float x1, float x2, float y1, float y2, float checkX, float checkY, float checkR, int i) {//check wall for ball
  if (checkX-checkR/2<=x1&&wall[i]!="left") {
    ballSpeed[i] = new PVector(random(0, 1), random(-1, 1));
    ballSpeed[i] = ballSpeed[i].normalize().mult(map(ballSize[i], 5, 100, speedBall, speedBall/3));
    wall[i] = "left";
  } else if (checkX+checkR/2>=x2&&wall[i]!="right") {
    ballSpeed[i] = new PVector(random(-1, 0), random(-1, 1));
    ballSpeed[i] = ballSpeed[i].normalize().mult(map(ballSize[i], 5, 100, speedBall, speedBall/3));
    wall[i] = "right";
  } else if (checkY-checkR/2<=y1&&wall[i]!="top") {
    ballSpeed[i] = new PVector(random(-1, 1), random(0, 1));
    ballSpeed[i] = ballSpeed[i].normalize().mult(map(ballSize[i], 5, 100, speedBall, speedBall/3));
    wall[i] = "top";
  } else if (checkY+checkR/2>=y2&&wall[i]!="bottom") {
    ballSpeed[i] = new PVector(random(0, 1), random(-1, 0));
    ballSpeed[i] = ballSpeed[i].normalize().mult(map(ballSize[i], 5, 100, speedBall, speedBall/3));
    wall[i] = "bottom";
  }
}



//from Feingold start
boolean circleCircleCollisionCheck(float x1, float y1, float d1, float x2, float y2, float d2) {
  float distance = dist(x1, y1, x2, y2);
  return (distance <= d1 + d2);
}
boolean rectangleCircleCollisionCheck(float rx, float ry, float rw, float rh,
  float cx, float cy, float cd) {
  float testX = cx;
  float testY = cy;

  if (cx < rx) testX = rx;
  else if (cx > rx + rw) testX = rx + rw;
  if (cy < ry) testY = ry;
  else if (cy > ry + rh) testY = ry + rh;
  float dX = cx - testX;
  float dY = cy - testY;
  float distance = sqrt(dX*dX + dY*dY);
  return (distance < cd/2);
}
//from Feingold end
