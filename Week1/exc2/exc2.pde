int i;
void setup(){
  size(200,200);
  noStroke();
  i=0;
}
void draw(){
  background(255);
  rect (i++,20,50,50);fill(255, 204, 0);
  if (i >=199)
  {
    i = 0;
  }
}
