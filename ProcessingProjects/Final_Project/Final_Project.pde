float pX; //player location X
float pY; //player location Y
boolean[] wasd = new boolean[4];//used to track keys
float pXspeed = 0;//used in X movement
float pYspeed = 0;//used in Y movement
float speed = 5;//speed of player
boolean hbShow = false;//show hit box
//track wall hit for player {
boolean Wgo = true;
boolean Ago = true;
boolean Sgo = true;
boolean Dgo = true;
//track wal hit for player }
boolean start = false;//start button pressed
boolean gameOver = false;//health = 0
String[] wall = new String[1];//track wall hit for balls
int pointScale = 10;//how fast you gain points. also new ball every 50 points
int Countdown = -1;//countdown before balls spawn
int count;//count frames for countdown
int count2;//counts frames for score
int score = 0;//tracks score
int ballCount = 1;//tracks ball count
float SP = 3.75;//size of player
float[] ballSize = new float[1];//size of balls
float[] ballX = new float[1];//X of balls
float[] ballY = new float[1];//Y of balls
boolean health = true;//tracks if player has been hit

String[] HighScoreSave = loadStrings("HighScore.txt");
int HighScore = Integer.parseInt(HighScoreSave[0]);

//PVector idea from Feingold, use of arrays from https://forum.processing.org/one/topic/vector-arrays.html
PVector[] ballSpeed = new PVector[1];//tracks speeds for each ball
int speedBall = 10;//regulated speed of balls
void setup() {
  size(1000, 1000);
  background(000);
  //centers player
  pX = width/2;
  pY = height/2;

  for (int i = 0; i<ballSize.length; i++) {//gives values to the first ball
    ballSize[i] = random(5, 100);
    ballX[i] = width/2;
    ballY[i] = 100;
    ballSpeed[i] = new PVector(random(0, 1), random(0, 1));
    ballSpeed[i] = ballSpeed[i].normalize().mult(map(ballSize[i], 5, 100, speedBall, speedBall/3));
  }
}
void draw() {
  if (!gameOver) {//gameOver Check
    if (start) {//start Check
      count++;//increase count
      background(000);
      direction();
      //move Player {
      pX+=pXspeed;
      pY+=pYspeed;
      //move Player }
      player();//draw Player

      if (Countdown>=0) {
        //draws countdown {
        stroke(125);
        strokeWeight(10);
        fill(#29901C);
        triangle(width/2-50, 50, width/2+50, 50, width/2, 100);
        fill(255);
        textAlign(CENTER, CENTER);
        textSize(100);
        text(Countdown, width/2, height/2-300);
        //draw countdown }
        if (count % 60 == 0) {//because default frame rate is 60fps, countdown will decrease once every second
          Countdown--;
        }
      } else {
        count2++;//increase count every frame after count down ends
        if (count2 % pointScale == 0) {//gain one point every pointScale frames
          score++;
        }
        if (count2 % (pointScale*50) == 0) {//every 50 points create new ball
          //append arrays to add new ball {
          ballSize = append(ballSize, random(50, 100));
          ballX = append(ballX, width/2);
          ballY = append(ballY, 100);
          wall = append(wall, "empty");
          PVector hold = new PVector(random(0, 1), random(0, 1));
          hold = hold.normalize().mult(map(ballSize[ballSize.length-1], 50, 100, speedBall, speedBall/3));
          ballSpeed = (PVector[])append(ballSpeed, hold);
          ballCount++;
          //append arrays to add new ball }
        }
        //draw balls {
        for (int i = 0; i<ballSize.length; i++) {
          if (rectangleCircleCollisionCheck(pX, pY+SP*2.5, SP*12.5, SP*28, ballX[i], ballY[i], ballSize[i])) {
            stroke(255, 0, 0);
            fill(255, 0, 0);
            health=false;
          } else {
            stroke(255);
            strokeWeight(5);
            fill(#20A1C6);
          }
          ballX[i]+=ballSpeed[i].x;
          ballY[i]+=ballSpeed[i].y;
          enemy(ballX[i], ballY[i], ballSize[i]);
          checkWallBall(0, width, 0, height, ballX[i], ballY[i], ballSize[i], i);
        }
        //draw Balls }
      }
      //draw spawn triangle, score, and ball count {
      textAlign(CENTER, CENTER);
      textSize(50);
      fill(255);
      text(score, width-100, 100);
      text(ballCount, width-100, 150);
      stroke(125);
      strokeWeight(10);
      fill(#29901C);
      triangle(width/2-50, 50, width/2+50, 50, width/2, 100);
      //draw spawn triangle }
    } else {
      //draw start button {
      rectMode(CENTER);
      fill(255);
      strokeWeight(5);
      stroke(0);
      rect(width/2, height/2-50, 100, 50);
      textAlign(CENTER, CENTER);
      fill(000);
      textSize(25);
      text("Start", width/2, height/2-55);
      //draw start button }
    }
  } else if (gameOver) {
    if (score>HighScore){
      HighScore=score;
      HighScoreSave[0] = String.valueOf(score);
      saveStrings("HighScore.txt", HighScoreSave);
    }
    //draw game over screen {
    background(000);
    textAlign(CENTER, CENTER);
    fill(255);
    textSize(100);
    text("GAME OVER", width/2, height/2-250);
    text("Score:", width/2, height/2-150);
    text(score, width/2, height/2-50);
    text("Ball Count:", width/2, height/2+50);
    text(ballCount, width/2, height/2+150);

    rectMode(CENTER);
    rect(width/2, height-200, 150, 75);
    textSize(50);
    fill(0);
    text("RESET", width/2, height-210);
    //draw game over screen }
  }
}
void mousePressed() {
  if (mouseX>=width/2-50&&mouseX<=width/2+50&&mouseY>=height/2-75&&mouseY<=height/2+25&&!start) {//checking start button
    start=true;
    Countdown=3;
  } else if (mouseX>=width/2-75&&mouseX<=width/2+75&&mouseY>=height-237.5&&mouseY<=height-162.5&&gameOver) {//checking restart button
    //reset all variables {
    pX = 0;
    pY = 0;
    wasd = new boolean[4];
    pXspeed = 0;
    pYspeed = 0;
    speed = 5;
    Wgo = true;
    Ago = true;
    Sgo = true;
    Dgo = true;
    gameOver = false;
    wall = new String[1];
    pointScale = 10;
    Countdown = 3;
    count = 0;
    count2 = 0;
    score = 0;
    SP = 3.75;
    ballSize = new float[1];
    ballX = new float[1];
    ballY = new float[1];
    health = true;
    //PVector idea from Feingold, use of arrays from https://forum.processing.org/one/topic/vector-arrays.html
    ballSpeed = new PVector[1];
    speedBall = 10;

    background(000);
    pX = width/2;
    pY = height/2;
    for (int i = 0; i<ballSize.length; i++) {
      ballSize[i] = random(5, 100);
      ballX[i] = width/2;
      ballY[i] = 100;
      ballSpeed[i] = new PVector(random(0, 1), random(0, 1));
      ballSpeed[i] = ballSpeed[i].normalize().mult(map(ballSize[i], 5, 100, speedBall, speedBall/3));
    }
    //reset all variables }
  }
}
