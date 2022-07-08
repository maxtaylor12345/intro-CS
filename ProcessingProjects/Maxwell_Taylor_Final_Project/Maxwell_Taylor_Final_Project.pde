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
  fullScreen();
  //background(000);
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
  background(000);
  if (!gameOver) {//gameOver Check
    if (start) {//start Check
      gameScreen();
    } else {
      startScreen();
    }
  } else if (gameOver) {
    endScreen();
  }
}
void mousePressed() {
  if (mouseX>=width/2-50&&mouseX<=width/2+50&&mouseY>=height/2-75&&mouseY<=height/2+25&&!start) {//checking start button
    start = true;
    Countdown = 3;
  } else if (mouseX>=width/2-75&&mouseX<=width/2+75&&mouseY>=height-137.5&&mouseY<=height-62.5&&gameOver) {
    exit();
  } else if (mouseX>=width/2-75&&mouseX<=width/2+75&&mouseY>=height-237.5&&mouseY<=height-162.5&&gameOver) {//checking restart button
    endClick();
  }
}
/*
 The first idea my peers gave me was to include some motivation to move as opposed to staying still. This was something I had already thought about, and we came to two ideas:
 1. add randomly spawning "coins" that you have to go collect
 2. instead of gaining a point every so often, gain a point after moving a certain distance
 I decided to try #2, however I did not have time so it was not implamented.
 
 The second idea was to make the start screen more intresting which I did.
 
 With more time I would implament both motives for movement, add music and SFX, and if I had A LOT more time, create the ability for "special balls" to spawn that would behave differently and dissapear after a certain amount of time.
 If I had EVEN MORE time and I knew how I would create an input field in which you can type certain variables, mainly pointScale, perPoint, a name input for the High Score, and possibly others such as min/max ball size/speed or player size.
 Also have size and speed of balls scale with size of GUI
 
 Some especially challenging parts were:
 Making the PVectors normalize how I wanted them to(based on ball size)
 Working with arrays that had to remain consistent through functions
 Changing things I had already done to work with arrays
 Storing the High Score in a .txt
 */
