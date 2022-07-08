void endClick() {
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
