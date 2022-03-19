final int A_FORWARD = 0;
final int A_BACKWARD = 1;
final int A_DOWN = 2;
class Alien {

  int x;
  int y;
  int maxY;
  PImage appearance;
  boolean reverse = false;
  boolean sinusoidal = false;
  int i = 0;
  int t = 0;
  boolean reverseY = false;

  Alien(int xpos, int ypos, PImage alienImage) {
    x = xpos;
    y = ypos;
    maxY = y + ALIEN_HEIGHT;
    appearance = alienImage;
    int type = int(random(1, 100));
    if (type > 50) {
      sinusoidal = true;
    }
  }
  void move() {
    if ((x <= (SCREENX - ALIEN_WIDTH)) && (reverse == false))
    {
      if (x >= (SCREENX - ALIEN_WIDTH))
      {
        x = SCREENX - ALIEN_WIDTH;
        y++;
        if (y >= (maxY))
        {
          y = maxY;
          maxY = y + ALIEN_HEIGHT;
          reverse = true;
          i = 0;
        }
      } else {
        if (t < 500)
        {
          x++;
          t++;
        } else {
          x+=2;
        }

        if (sinusoidal == true) {
          if (reverseY == false) {
            y++;
            i++;
            if (i > ALIEN_HEIGHT/2) {
              reverseY = true;
            }
          } else {
            y--;
            i--;
            if (i <= 0)
            {
              reverseY = false;
            }
          }
        }
      }
    } else if ((reverse == true) && (x >= -1)) {
      if (x <= 0)
      { 
        y++;
        x = 0;
        if (y >= (maxY))
        {
          y = maxY ;
          reverse = false;
          maxY = y + ALIEN_HEIGHT;
          i = 0;
        }
      } else {
        if (t < 500)
        {
          x--;
          t++;
        } else {
          x+=2;
        }
        if (sinusoidal == true) {
          if (reverseY == false) {
            y++;
            i++;
            if (i > ALIEN_HEIGHT/2) {
              reverseY = true;
            }
          } else {
            y--;
            i--;
            if (i <= 0) {
              reverseY = false;
            }
          }
        }
      }
    }
  }
  void explode(PImage exploded)
  {
    int state = int(random(0, 1000));
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
