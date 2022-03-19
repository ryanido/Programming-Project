Alien theAliens[];
PImage alienImage;
PImage explodeImage;
void settings() {
  size(SCREENX,SCREENY);
}
void setup(){
theAliens = new Alien[10];
alienImage = loadImage("spacer.gif");
explodeImage = loadImage("exploding.gif");
init_aliens(theAliens, alienImage);
}

void init_aliens ( Alien theArray[], PImage theImage){
 for(int i = 0; i < theArray.length; i++)
 {
   theArray[i] = new Alien(int(random(0,SCREENX - ALIEN_WIDTH)), int(random(0,SCREENY/2)), theImage);
 }
}

void draw(){
  background(125);
  for(int i=0; i<theAliens.length; i++)
  {
    theAliens[i].explode(explodeImage);
    theAliens[i].draw();
    theAliens[i].move();
  }
  /* for each alien in the array - move the alien, then draw the alien */

}
