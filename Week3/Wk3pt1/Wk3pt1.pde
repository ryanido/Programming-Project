Alien theAlien;
PImage alienImage;
void settings() {
  size(SCREENX,SCREENY);
}
void setup(){
  alienImage = loadImage("spacer.gif");
  theAlien = new Alien(0,0,alienImage);
  
}

void draw(){
  background(125);
  theAlien.move();
  theAlien.draw();
  println("" + theAlien.maxY);
}
