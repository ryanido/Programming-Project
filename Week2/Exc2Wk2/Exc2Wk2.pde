Player thePlayer;
Ball theBall;
Player theComputer;
int compMove;
boolean lose;
boolean win;
void settings() {
  size(SCREENX, SCREENY);
}
void setup() {
  lose = false;
  win = false;
  PFont myFont = loadFont("Impact-40.vlw");
  textFont(myFont);
  thePlayer = new Player(SCREENY - MARGIN 
    - PADDLEHEIGHT);
  theComputer = new Player(MARGIN);
  theBall = new Ball();
  ellipseMode(RADIUS);
}

void draw() {
  background(0);
  theBall.move();
  if (theBall.x > theComputer.xpos) compMove++;
  else if (theBall.x < theComputer.xpos) compMove--;
  if (compMove>=(SCREENX - PADDLEWIDTH)) compMove = (SCREENX - PADDLEWIDTH);
  if (compMove<=0 ) compMove = 0;
  theComputer.move(compMove);
  thePlayer.move(mouseX);
  theBall.collide(thePlayer, theComputer);
  theBall.draw();
  theComputer.draw();
  thePlayer.draw();
  if (lose) {
    text("Game Over", SCREENX/4, SCREENY/2);fill(255, 0, 0);
    if (mousePressed == true) {
      lose = false;
      theComputer.lives = STARTINGLIVES;
      thePlayer.lives = STARTINGLIVES;
    }
  }
  if (win) {
    text("You Win!!", SCREENX/4, SCREENY/2); fill(0, 255, 0);
    if (mousePressed == true) {
      win = false;
      theComputer.lives = STARTINGLIVES;
      thePlayer.lives = STARTINGLIVES;
    }
  }
   if ( theBall.y  < 0)
  {
    theComputer.lives--;
    if (theComputer.lives == 0) {
      win = true;
    }
  }
  if ( theBall.y  > SCREENY)
  {
    thePlayer.lives--;
    if (thePlayer.lives == 0) {
      lose = true;
    }
  }
  theBall.reset();
  println("" + theComputer.lives + " " + thePlayer.lives);
 
}
