void startScreen() {
  //draw start button and High Score {
  text("W", width/4, height/4-100, 100);
  text("A", width/4-75, height/4, 100);
  text("S", width/4, height/4+100, 100);
  text("D", width/4+75, height/4, 100);

  text("↑", 3*(width/4), height/4-100, 100);
  text("←", 3*(width/4-25), height/4, 100);
  text("↓", 3*(width/4), height/4+100, 100);
  text("→", 3*(width/4+25), height/4, 100);

  stroke(125);
  strokeWeight(10);
  fill(#29901C);
  triangle(width/2-50, 50, width/2+50, 50, width/2, 100);

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
  push();
  push();
  translate(width/2, 3*height/4);
  enemy(250, 0, 64);
  enemy(-250, 100, 100);
  enemy(-150, -150, 75);
  enemy(125, -150, 50);
  enemy(150, 150, 53);
  pop();
  push();//this is my player function however the origional does not accept inputs so I just copied because I did not have time to change anything
  translate(width/2, 3*(height/4));
  fill(255);
  noStroke();
  triangle(-(SP*6), SP*2, (SP*6), SP*2, 0, SP*17);
  circle(0, (SP*5)-(9.3333*SP), SP*10);
  pop();
  pop();
  //start screen scene }





  textSize(100);
  fill(255);
  if (Integer.parseInt(HighScoreSave[0]) > 0) {
    text("High Score:", width/2, height/2-310);
    text(HighScoreSave[0], width/2, height/2-180);
  }
  //draw start button and High Score }
}
void gameScreen() {
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
}
void endScreen() {
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
  fill(255);
  rect(width/2, height-200, 150, 75);
  textSize(50);
  fill(0);
  text("RESET", width/2, height-210);

  rectMode(CENTER);
  fill(255);
  rect(width/2, height-100, 150, 75);
  textSize(50);
  fill(0);
  text("EXIT", width/2, height-110);
  //draw game over screen }
}
