void keyPressed() {//track pressing of WASD or arrow keys
  if (keyCode==87||keyCode==38) {//up
    wasd[0]=true;
  } else if (keyCode==65||keyCode==37) {//left
    wasd[1] = true;
  } else if (keyCode==83||keyCode==40) {//down
    wasd[2] = true;
  } else if (keyCode==68||keyCode==39) {//right
    wasd[3]= true;
  }
}
void keyReleased() {//track releasing of WASD or arrow keys
  if (keyCode==87||keyCode==38) {
    wasd[0]=false;
  } else if (keyCode==65||keyCode==37) {
    wasd[1]=false;
  } else if (keyCode==83||keyCode==40) {
    wasd[2]=false;
  } else if (keyCode==68||keyCode==39) {
    wasd[3]=false;
  }
}
void direction() {//sets speeds based off of above
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
  if (pXspeed!=0&&pYspeed!=0) {
    pXspeed=pXspeed/sqrt(2);
    pYspeed=pYspeed/sqrt(2);
  }
}
