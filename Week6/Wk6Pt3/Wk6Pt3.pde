ArrayList widgetList;
Screen screen1;
ArrayList widgetList2;
Screen screen2;
Screen currentScreen;
PFont stdFont;
color square = color(0, 0, 0);
final int BACKWARD = 7;
final int FORWARD = 6;
final int EVENT_BUTTON1=1;
final int EVENT_BUTTON2=2;
final int EVENT_BUTTON3=3;
final int EVENT_NULL=0;
int event = EVENT_NULL;
void setup() {
  Widget buttonOne, buttonTwo, backwardsButton, forwardsButton;
  size(400, 400);
  stdFont=loadFont("Impact-20.vlw"); 
  textFont(stdFont);
  buttonOne = new Widget(100, 100, 100, 40, 
    "Button 1", color(100), stdFont, 
    EVENT_BUTTON1);
  buttonTwo = new Widget(100, 100, 100, 40, 
    "Button 2", color(100), stdFont, EVENT_BUTTON2);
  backwardsButton = new Widget(100, 300, 100, 40, 
    "Backward", color(100), stdFont, BACKWARD);
  forwardsButton = new Widget(100, 300, 100, 40, 
    "Forward", color(100), stdFont, FORWARD);
  widgetList = new ArrayList();
  screen1 = new Screen(widgetList, color(125, 0, 0));
  screen1.addWidget(forwardsButton); screen1.addWidget(buttonOne);
  widgetList2 = new ArrayList();
  screen2 = new Screen(widgetList2, color(0, 0, 125));
  screen2.addWidget(backwardsButton); screen2.addWidget(buttonTwo);
  currentScreen = screen1;
}
void draw() {
  background(currentScreen.screenColor);
  currentScreen.draw();
}
void mousePressed() {
  event = currentScreen.getEvent();
  if (event == EVENT_BUTTON1) {
    println("button 1!");
  }
  if (event == EVENT_BUTTON2) {
    println("button 2!");
  }
  if (event == BACKWARD) {
    println("switch screens!");
    currentScreen = screen1;
  }
  if (event == FORWARD) {
    println("switch screens!");
    currentScreen = screen2;
  }
}
