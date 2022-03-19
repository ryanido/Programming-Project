class Bullet {
  float x; 
  float y;
  int m;
  int i = 0;
  color bulletColor = color(200, 0, 0);

  Bullet(Player player) {
    y = player.ypos;
  }
  void move(float xpos ){
    y--;
    if(i < 1)
    {
      x = xpos;
      i++;
    }
    
  }
  void draw(){
    fill(bulletColor);
    rect(x, y, BULLET_HEIGHT, BULLET_WIDTH);
  }
  void collide(Alien tA) {
    if (y <= tA.y + ALIEN_HEIGHT &&  //top of bullet above or level bottom of alien
      y+BULLET_HEIGHT > tA.y && //bottom of bullet below top of alien paddle
      x >=tA.x && // bullet(X) is greater or equal (left side)alien(X)
      x <=tA.x+ALIEN_WIDTH)// bullet(X) is less or equal (right side)alien(X)
    {
      println("collided!");
      tA.explode();
     
    }
  }
}
