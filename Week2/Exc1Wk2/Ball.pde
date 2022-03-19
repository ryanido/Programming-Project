class Ball {
  float x; 
  float y;
  float dx; 
  float dy;
  int radius;
  color ballColor = color(200, 100, 50);

  Ball() {
    x = random(SCREENX/4, SCREENX/2);
    y = random(SCREENY/4, SCREENY/2);
    dx = random(1, 2); 
    dy = random(1, 2);
    radius=5;
  }
  void move() {
    x = x+dx; 
    y = y+dy;
  }
  void draw() {
    fill(ballColor);
    ellipse(int(x), int(y), radius, radius);
  }
  void collide(Player tp) {
    if (x-radius <=0) dx =-dx;// if ball leftside touches left side reverse x dir
    else if (x+radius >= SCREENX) dx=-dx;// " right "
    if (y+radius >= tp.ypos &&  //bottom of ball below or level top of paddle
      y-radius < tp.ypos + PADDLEHEIGHT && //top of ball above bottom paddle
      x >=tp.xpos && // ball(X) is greater or equal (left side)paddle(X)
      x <=tp.xpos+PADDLEWIDTH)// ball(X) is less or equal (right side)paddle(X)
    {
      println("collided!");
      dy=-dy;//move opp. y direction with same x velocity
    }
  }
  
}
