class Bomb{
  int x,y;
  color bombColour = color(50,50,50);
  Bomb(int xpos,int ypos)
  {
    x = xpos;
    y = ypos;
  }
  void move(){
    y++;
  }
  void draw(){
    rect(x, y, BOMB_WIDTH, BOMB_HEIGHT);
  }
  boolean collide(Player tp){
    if(y <= tp.ypos + PADDLEHEIGHT &&  //top of bomb above or level bottom of paddle
      y+BOMB_HEIGHT > tp.ypos && //bottom of bomb below top of paddle
      x >=tp.xpos && // bomb(X) is greater or equal (left side)paddle(X)
      x <=tp.xpos+ALIEN_WIDTH)// bomb(X) is less or equal (right side)paddle(X)
      {
        return true;
      }
      else{
        return false;
      }
  }
  boolean offScreen(){
    if( y > SCREENY)
    {
      return true;
    }
    else{
      return false;
    }
  }
  
}
