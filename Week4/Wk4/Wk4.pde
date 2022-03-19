Alien theAliens[];
Player thePlayer;
Bullet bullet;
PImage alienImage;
PImage explodeImage;
boolean shoot = false;
void settings() {
  size(SCREENX,SCREENY);
}
void setup(){
theAliens = new Alien[10];
thePlayer = new Player(SCREENY - MARGIN 
    - PADDLEHEIGHT);
bullet = new Bullet(thePlayer);
alienImage = loadImage("spacer.gif");
explodeImage = loadImage("exploding.gif");
init_aliens(theAliens, alienImage);
}

void init_aliens ( Alien theArray[], PImage theImage){
 for(int i = 0; i < theArray.length; i++)
 {
   theArray[i] = new Alien(i*(ALIEN_WIDTH + GAP), 10, theImage,explodeImage);
 }
}

void draw(){
  background(125);
  for(int i=0; i<theAliens.length; i++)
  {
    theAliens[i].draw();
    theAliens[i].move();
    bullet.collide(theAliens[i]);
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
