import java.net.*;
import controlP5.*;


ArrayList<heartContainer> heart = new ArrayList<heartContainer>();
ArrayList<networkPing> ping = new ArrayList<networkPing>();
ArrayList<userInputField> IPField = new ArrayList<userInputField>();

String IP;
int variableTimer = 5;
int stopwatch;

void setup() {
  size(400, 400);
  stopwatch = millis();
  for (int i = 0; i < 16; i++) {
    heart.add(new heartContainer(i));
    heart.get(i).heartInit();
  }
  for (int i = 0; i < 4; i++) {
    IPField.add(new userInputField(this, i));
  }
  IPField.get(0).newTextField(10, 80);
  IPField.get(1).newTextField(110, 80);
  IPField.get(2).newTextField(210, 80);
  IPField.get(3).newTextField(310, 80);
}

void draw() {
  background(100);
  timer();
  int i = 0;
  for (int y = 35; y < height - 10; y += 90) {
    for (int x = 50; x < width; x += 100) {
      heart.get(i).heartDraw(x , y);
      fill(0);
      textAlign(CENTER, CENTER);
      textSize(15);
      text("EMPTY", x, y + 35);
      textSize(10);
      text("192.168.0.20", x, y + 50);
      i++;
    }
  }
}

void timer() {
  if (millis() > stopwatch) {
    stopwatch += 5000;
    //ping.sendPing("192.168.0.20");
  }
}

void controlEvent(ControlEvent theEvent) {
  if (theEvent.isAssignableFrom(Textfield.class)) {
    println(theEvent.getName()+": "+theEvent.getStringValue());
    if (theEvent.getName().equals("0")) {
      IPField.get(0).text = theEvent.getStringValue();
    }
  }
}