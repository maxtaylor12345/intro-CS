/*
Maxwell Taylor
 Summer Intro CompSci Final Project
 7/8/2022
 
 In this game, the player controls a character who must avoid an ever increasing amount of obstacles in an attemp to claim the high score.
 Using WASD or arrow keys, the player moves the character along a 2D plain as randomly sized balls spawn every fifty points.
 
 Sources:
 Avery Feingold
 Angie Cortez
 https://www.javatpoint.com/java-int-to-string
 https://forum.processing.org/one/topic/vector-arrays.html
 https://processing.org/reference/saveStrings_.html
 https://processing.org/reference/loadStrings_.html
 */
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
boolean gameOver = false;//alive = 0
String[] wall = new String[1];//track wall hit for balls
int pointScale = 10;//how fast you gain points. also new ball every perPoint points
int perPoint = 50;
int Countdown = -1;//countdown before balls spawn
int count;//count frames for countdown
int count2;//counts frames for score
int score = 0;//tracks score
int level = 0;//tracks level
float SP = 3.75;//size of player
float[] ballSize = new float[1];//size of balls
float[] ballX = new float[1];//X of balls
float[] ballY = new float[1];//Y of balls
boolean alive = true;//tracks if player has been hit
boolean newHighScore = false;//check if new high score
String[] HighScoreSave = new String[1];//save high score to .txt file
//all functions related to reading and writing .txt files comes from processing refference page
//all functions related to casting between ints and strings is from https://www.javatpoint.com/java-int-to-string
//PVector idea from Feingold, use of arrays from https://forum.processing.org/one/topic/vector-arrays.html
PVector[] ballSpeed = new PVector[1];//tracks speeds for each ball
int speedBall = 10;//regulated speed of balls
void setup() {
  HighScoreSave = loadStrings("HighScore.txt");//set string HighScoreSave to the lines of the .txt file
  size(1000, 1000);
  background(000);
  //centers player
  pX = width/2;
  pY = height/2;

  for (int i = 0; i<ballSize.length; i++) {//gives values to the first ball
    ballSize[i] = random(50, 100);//random size
    ballX[i] = width/2;
    ballY[i] = 100;
    ballSpeed[i] = new PVector(random(-1, 1), random(0, 1));//PVector saves and X and a Y in one spot
    ballSpeed[i] = ballSpeed[i].normalize().mult(map(ballSize[i], 50, 100, speedBall, speedBall/3));//normalize function makes speed consistent even with random X and Y speed I do not know the math
    //the map function make bigger balls slower and smaller balls faster
  }
}
void draw() {
  if (!gameOver) {//gameOver Check
    if (start) {//start Check
      background(000);
      direction();
      //move Player {
      pX+=pXspeed;
      pY+=pYspeed;
      //move Player }
      player();//draw Player
      count++;//increase count
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
        if (count2 % (pointScale*perPoint) == 0) {//every perPoint points create new ball
          //append arrays to add new ball {
          ballSize = append(ballSize, random(50, 100));
          ballX = append(ballX, width/2);
          ballY = append(ballY, 100);
          wall = append(wall, "empty");
          PVector hold = new PVector(random(-1, 1), random(0, 1));//hold is a temporary variable to save a value in order to add it to an array without the for loop
          hold = hold.normalize().mult(map(ballSize[ballSize.length-1], 50, 100, speedBall, speedBall/3));
          ballSpeed = (PVector[])append(ballSpeed, hold);
          level++;
          //append arrays to add new ball }
        }
        //draw balls {
        for (int i = 0; i<ballSize.length; i++) {
          if (rectangleCircleCollisionCheck(pX, pY+SP*2.5, SP*12.5, SP*28, ballX[i], ballY[i], ballSize[i])) {//check collision between player hitbox and balls
            stroke(255, 0, 0);
            fill(255, 0, 0);
            alive=false;
          } else {
            stroke(255);
            strokeWeight(5);
            fill(#20A1C6);
          }
          ballX[i]+=ballSpeed[i].x;
          ballY[i]+=ballSpeed[i].y;
          enemy(ballX[i], ballY[i], ballSize[i]);
          checkWallBall(0, width, 0, height, ballX[i], ballY[i], ballSize[i], i);//i is included as a parameter so that the array space being changed is consistent throughout the function as opposed to another for loop which would affect every spot in the array
        }
        //draw Balls }
      }
      //draw spawn triangle, score, and level {
      textAlign(CENTER, CENTER);
      textSize(50);
      fill(255);
      text(score, width-100, 100);
      text(level, width-100, 150);
      stroke(125);
      strokeWeight(10);
      fill(#29901C);
      triangle(width/2-50, 50, width/2+50, 50, width/2, 100);
      //draw spawn triangle, score, and level }
    } else {
      //draw start button and High Score {
      rectMode(CENTER);
      fill(255);
      strokeWeight(5);
      stroke(0);
      rect(width/2, height/2-50, 100, 50);
      textAlign(CENTER, CENTER);
      fill(000);
      textSize(25);
      text("Start", width/2, height/2-55);

      stroke(255);
      strokeWeight(5);
      fill(#20A1C6);
      //start screen scene {
      enemy(width-250, 3*(height/4), 64);
      enemy(width/2-250, 3*(height/4)+100, 100);
      enemy(width/2-150, 3*(height/4)-150, 75);
      enemy(width/2+125, 3*(height/4)-150, 50);
      enemy(width/2+150, 3*(height/4)+150, 53);
      push();//this is my player function however the origional does not accept inputs so I just copied because I did not have time to change anything
      translate(width/2, 3*(height/4));
      fill(255);
      noStroke();
      triangle(-(SP*6), SP*2, (SP*6), SP*2, 0, SP*17);
      circle(0, (SP*5)-(9.3333*SP), SP*10);
      pop();
      //start screen scene }


      textSize(100);
      fill(255);
      if (Integer.parseInt(HighScoreSave[0]) > 0) {
        text("High Score:", width/2, 100);
        text(HighScoreSave[0], width/2, 250);
      }
      //draw start button and High Score }
    }
  } else if (gameOver) {
    if (score>Integer.parseInt(HighScoreSave[0])) {//pulls the integer value from a string
      HighScoreSave[0] = String.valueOf(score+1);//create string value of an integer. the +1 is to not create an endless loop in the if statement
      saveStrings("HighScore.txt", HighScoreSave);//save string to .txt
      newHighScore = true;//toggle different end screens
    }
    if (newHighScore) {
      background(000);
      textAlign(CENTER, CENTER);
      fill(255);
      textSize(100);
      text("GAME OVER", width/2, height/2-250);
      text("New High Score:", width/2, height/2-150);
      text(score, width/2, height/2-50);
      text("Level:", width/2, height/2+50);
      text(level, width/2, height/2+150);
    } else {
      //draw game over screen {
      background(000);
      textAlign(CENTER, CENTER);
      fill(255);
      textSize(100);
      text("GAME OVER", width/2, height/2-250);
      text("Score:", width/2, height/2-150);
      text(score, width/2, height/2-50);
      text("Level:", width/2, height/2+50);
      text(level, width/2, height/2+150);
    }
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
    start = false;
    newHighScore = false;
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
    alive = true;
    //PVector idea from Feingold, use of arrays from https://forum.processing.org/one/topic/vector-arrays.html
    ballSpeed = new PVector[1];
    speedBall = 10;
    level = 0;
    HighScoreSave = loadStrings("HighScore.txt");
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

/*
 The first idea my peers gave me was to include some motivation to move as opposed to staying still. This was something I had already thought about, and we came to two ideas:
 1. add randomly spawning "coins" that you have to go collect
 2. instead of gaining a point every so often, gain a point after moving a certain distance
 I decided to try #2, however I did not have time so it was not implamented.
 
 The second idea was to make the start screen more intresting which I did.
 
 With more time I would implament both motives for movement, add music and SFX, and if I had A LOT more time, create the ability for "special balls" to spawn that would behave differently and dissapear after a certain amount of time.
 If I had EVEN MORE time and I knew how I would create an input field in which you can type certain variables, mainly pointScale, perPoint, a name input for the High Score, and possibly others such as min/max ball size/speed or player size.a
 Some especially challenging parts were:
 Making the PVectors normalize how I wanted them to(based on ball size)
 Working with arrays that had to remain consistent through functions
 Changing things I had already done to work with arrays
 */
