ArrayList theAliens;
Player thePlayer;
Bullet bullet;
Bomb bomb;
PImage alienImage;
PImage explodeImage;
boolean shoot = false;
void settings() {
  size(SCREENX,SCREENY);
}
void setup(){
theAliens = new ArrayList();
thePlayer = new Player(SCREENY - MARGIN 
    - PADDLEHEIGHT);
bullet = new Bullet(thePlayer);
bomb = new Bomb(50,50);
alienImage = loadImage("spacer.gif");
explodeImage = loadImage("exploding.gif");
init_aliens(theAliens, alienImage);
}

void init_aliens ( ArrayList theList, PImage theImage){
 for(int i = 0; i < 10; i++)
 {
   theList.add(new Alien(i*(ALIEN_WIDTH + GAP), 10, theImage,explodeImage));
 }
}

void draw(){
  background(125);
  bomb.draw();
  bomb.move();
  for(int i=0; i<theAliens.size(); i++)
  {
    Alien tA = (Alien) theAliens.get(i);
    tA.draw();
    tA.move();
    bullet.collide(tA);
      if((tA.lastM != 0) && millis() > tA.lastM)
      {
         theAliens.remove(i);
      }
  }
  
  thePlayer.draw();
  thePlayer.move(mouseX);
  if (shoot) {
    bullet.draw();
    bullet.move(thePlayer.xpos + PADDLEWIDTH/2);
  }
  
  /* for each alien in the array - move the alien, then draw the alien */

}

void mousePressed() {
  shoot = true; 
  }
