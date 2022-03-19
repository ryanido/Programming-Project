int i;
int o;
void setup(){
  size(200,200);
  noStroke();
  i=0;
  o = -49;
}
void draw(){
  background(255);
  rect (i++,20,50,50);fill(255, 204, 0);
  if (i >=149)
  {
    
    rect(o++,20,50,50);
    if(o >= 0){
    o=-49;
    i=0;
    }
    
  }
}
