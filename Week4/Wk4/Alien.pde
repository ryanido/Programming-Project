final int A_FORWARD = 0;
final int A_BACKWARD = 1;
final int A_DOWN = 2;
class Alien {

  int x;
  int y;
  int maxY;
  PImage appearance;
  PImage exploded;
  boolean reverse = false;

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
  }
  void explode()
  {
      appearance = exploded;
  }
  void draw()
  {
    image( appearance, x, y, ALIEN_HEIGHT, ALIEN_WIDTH);
  }
}
