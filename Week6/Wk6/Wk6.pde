ArrayList widgetList;
PFont stdFont;
color square = color(0, 0, 0);
final int EVENT_BUTTON1=1;
final int EVENT_BUTTON2=2;
final int EVENT_BUTTON3=3;
final int EVENT_NULL=0;
final color red = color(255, 0, 0);
final color green = color(0, 255, 0);
final color blue = color(0, 0, 255);
void setup() {
  Widget redButton, greenButton, blueButton;
  size(400, 400);
  stdFont=loadFont("Impact-20.vlw"); 
  textFont(stdFont);
  redButton = new Widget(100, 100, 100, 40, 
    "red", color(100), stdFont, 
    EVENT_BUTTON1);
  greenButton = new Widget(100, 200, 100, 40, 
    "green", color(100), stdFont, EVENT_BUTTON2);
  blueButton = new Widget(100, 300, 100, 40, 
    "blue", color(100), stdFont, EVENT_BUTTON3);
  widgetList = new ArrayList();
  widgetList.add(redButton); 
  widgetList.add(greenButton);
  widgetList.add(blueButton);
}
void draw() {
  for (int i = 0; i<widgetList.size(); i++) {
    Widget aWidget = (Widget) widgetList.get(i);
    aWidget.draw();
  }
  noStroke();
  fill(square); 
  rect(300, 200, 40, 40);
}
void mousePressed() {
  int event;
  for (int i = 0; i<widgetList.size(); i++) {
    Widget aWidget = (Widget) widgetList.get(i);
    event = aWidget.getEvent(mouseX, mouseY);
    switch(event) {
    case EVENT_BUTTON1:
      println("red!");
      square = red;
      break;
    case EVENT_BUTTON2:
      println("green!");
      square = green;
      break;
    case EVENT_BUTTON3:
      println("blue!");
      square = blue;
      break;
    }
  }
}
void mouseMoved() {
  for (int i = 0; i<widgetList.size(); i++) {
    Widget aWidget = (Widget) widgetList.get(i);
    if (mouseX > aWidget.x && 
      mouseX < aWidget.x+aWidget.width && 
      mouseY >aWidget.y && 
      mouseY <aWidget.y+aWidget.height)
    {
      aWidget.strokeColor = color(255, 255, 255);
    } else {
      aWidget.strokeColor = color(0);
    }
  }
}
