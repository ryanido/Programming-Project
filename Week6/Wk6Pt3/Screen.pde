class Screen {
  ArrayList widgets;
  color screenColor;
  int event;
  Screen(ArrayList widgetList, color background )
  {
    screenColor = background;
    widgets = widgetList;
  }
  void draw() {
    for (int i = 0; i<widgets.size(); i++) {
      Widget aWidget = (Widget) widgets.get(i);
      aWidget.draw();
    }
  }
  int getEvent() {
    int i = 0;
    boolean eventOngoing = false;
    while (i<widgets.size() && (eventOngoing == false)) {
      Widget aWidget = (Widget) widgets.get(i);
      event = aWidget.getEvent(mouseX, mouseY);
      if (event != EVENT_NULL)
      {
        eventOngoing = true;
      }
      i++;
    }
    return event;
  }
  void addWidget(Widget widget) {
    widgets.add(widget);
  }
  
}
