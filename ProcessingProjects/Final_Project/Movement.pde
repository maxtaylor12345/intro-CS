
void keyPressed() {
  if (keyCode==87) {
    wasd[0]=true;
  } else if (keyCode==65) {
    wasd[1] = true;
  } else if (keyCode==83) {
    wasd[2] = true;
  } else if (keyCode==68) {
    wasd[3]= true;
  }
}
void keyReleased() {
  if (keyCode==87) {
    wasd[0]=false;
  } else if (keyCode==65) {
    wasd[1]=false;
  } else if (keyCode==83) {
    wasd[2]=false;
  } else if (keyCode==68) {
    wasd[3]=false;
  }
}
void direction() {
  if (wasd[0]&&Wgo) {
    pYspeed=-speed;
  } else if (wasd[2]&&Sgo) {
    pYspeed = speed;
  } else {
    pYspeed = 0;
  }
  if (wasd[1]&&Ago) {
    pXspeed=-speed;
  } else if (wasd[3]&&Dgo) {
    pXspeed=speed;
  } else {
    pXspeed=0;
  }
}
