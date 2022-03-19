int i;
int o;
int a;
int e;
void setup(){
size(200, 200);
noStroke(); 
i=0;
o=-50;
a=149;
e=199;
}
void draw(){
background(255);
rect(i++, 20, 50, 50);fill(255, 204, 0);
if(i>=149)
{
  rect(o++, 20, 50, 50);fill(255, 204, 0);
  if(o >= 0 )
  {
    i=0;
    o = -50;
  }
}
rect(a--, 80, 50, 50); fill(255,0,0);
if(a <= 0)
{
  rect(e--, 80, 50, 50); fill(255,0,0);
  if(e <= 149)
  {
    a=149;
    e=199;
  }
}
    
}
