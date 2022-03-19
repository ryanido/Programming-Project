ArrayList theAliens;
Player thePlayer;
ArrayList theBullets;
Alien tA;
Bullet tB;
Bomb aBomb;
PImage alienImage;
PImage explodeImage;
boolean shoot = false;
boolean over = false;
boolean lose = false;
void settings() {
  size(SCREENX, SCREENY);
}
void setup() {
  theAliens = new ArrayList();
  thePlayer = new Player(SCREENY - MARGIN 
    - PADDLEHEIGHT);
  PFont myFont = loadFont("Impact-40.vlw");
  textFont(myFont);
  theBullets = new ArrayList();
  alienImage = loadImage("spacer.gif");
  explodeImage = loadImage("exploding.gif");
  init_aliens(theAliens, alienImage);
}

void init_aliens ( ArrayList theList, PImage theImage) {
  for (int i = 0; i < 10; i++)
  {
    theList.add(new Alien(i*(ALIEN_WIDTH + GAP), 10, theImage, explodeImage));
  }
}

void draw() {
  background(125);
  for (int i=0; i<theAliens.size(); i++)
  {
    Alien tA = (Alien) theAliens.get(i);
    tA.draw();
    tA.move();
    if ((tA.lastM != 0) && millis() > tA.lastM)
    {
      theAliens.remove(i);
    }
  }
  if (lose)
  { 
    text("Game Over", SCREENX/4, SCREENY/2);
    for (int i = 0; i < theAliens.size(); i++)
    {
      theAliens.remove(i);
    }
  }
  for (int o = 0; theAliens.size() > o; o++) 
  {
    tA = (Alien) theAliens.get(o);
    if (tA.getBomb() != null)
    {
      aBomb = tA.getBomb();
      if (aBomb.collide(thePlayer))
      {
        lose = true;
      }
    }
  }
  for (int o=0; theBullets.size()>o; o++)
  {
    tB = (Bullet) theBullets.get(o);
    tB.draw();
    tB.move(thePlayer.xpos + PADDLEWIDTH/2);
    tB.collide(theAliens);
  }
  if (theAliens.size() <= 0 && !lose)
  {
    text("You Win", SCREENX/4, SCREENY/2);
  }
  thePlayer.draw();
  thePlayer.move(mouseX);
}

void mousePressed() {
  theBullets.add(new Bullet(thePlayer));
}
