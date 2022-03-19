final int A_FORWARD = 0;
final int A_BACKWARD = 1;
final int A_DOWN = 2;
final int TIME_EXPLODED = 50;
class Alien {

  int x;
  int y;
  int lastM = 0;
  int maxY;
  int drop;
  Bomb b;
  PImage appearance;
  PImage exploded;
  boolean reverse = false;
  boolean bomb = false;

  Alien(int xpos, int ypos, PImage alienImage, PImage explodeImage) {
    x = xpos;
    y = ypos;
    maxY = y + ALIEN_HEIGHT;
    appearance = alienImage;
    exploded = explodeImage;
  }
  void move() {
    if ((x <= (SCREENX - ALIEN_WIDTH)) && (reverse == false))
    {
      if (x == (SCREENX - ALIEN_WIDTH))
      {
        y++;
        if (y >= (maxY))
        {
          y = maxY;
          maxY = y + ALIEN_HEIGHT;
          reverse = true;
        }
      } else {
        x++;
      }
    } else if ((reverse == true) && (x >= 0)) {
      if (x == 0)
      { 
        y++;
        if (y >= (maxY))
        {
          y = maxY ;
          reverse = false;
          maxY = y + ALIEN_HEIGHT;
        }
      } else {
        x--;
      }
    }
    drop = (int)random(1,100000);
    if(drop > 99500 && !bomb)
    {
      b = new Bomb(x,y);
      bomb = true;
    }
    if( b != null )
    {
      b.draw();
      b.move();
      if (b.offScreen()){
        bomb = false;
      }
    }
  
  }
  void explode()
  {
      appearance = exploded;
      lastM = millis() + TIME_EXPLODED;
      
  }
  void draw()
  {
    image( appearance, x, y, ALIEN_HEIGHT, ALIEN_WIDTH);
  }
  Bomb getBomb()
  {
    if (b != null)
    {
      return b;
    }
    else return null;
  }
}
