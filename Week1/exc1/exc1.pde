int i = 10;
int o = 70;
int p = 40;
void setup(){
size(200, 200);
noStroke(); fill(204, 204, 0);
}
void draw(){
background(255);
rect(i--, 10, 50, 50); fill(255, 0, 0);
rect(70, o++, 50, 50); fill(0, 0, 255);
rect(p++, 40, 50, 50); fill(0, 255, 0);
if(i <= 0) 
{
  i=199;
}
if(o >= 199) 
{
  o=0;
}
if(p >= 199) 
{
  p=0;
}
}
