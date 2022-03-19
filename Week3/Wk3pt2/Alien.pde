final int A_FORWARD = 0;
final int A_BACKWARD = 1;
final int A_DOWN = 2;
class Alien {

  int x;
  int y;
  int maxY;
  PImage appearance;
  boolean reverse = false;

  Alien(int xpos, int ypos, PImage alienImage) {
    x = xpos;
    y = ypos;
    maxY = y + ALIEN_HEIGHT;
    appearance = alienImage;
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
  void explode(PImage exploded)
  {
    int state = int(random(0,1000));
    if (state >= 999)
    {
      appearance = exploded;
    }
  }
  void draw()
  {
    image( appearance, x, y, ALIEN_HEIGHT, ALIEN_WIDTH);
  }
}
