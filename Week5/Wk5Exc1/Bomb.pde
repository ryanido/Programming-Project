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
