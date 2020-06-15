import java.net.*;
import controlP5.*;


ArrayList<heartContainer> heart = new ArrayList<heartContainer>();
ArrayList<networkPing> ping = new ArrayList<networkPing>();
ArrayList<userInputField> IDField = new ArrayList<userInputField>();
ArrayList<userInputField> IPField = new ArrayList<userInputField>();

String IP;
int variableTimer = 5;
int stopwatch;
int hearts = 16;

String IP0,ID0;

void setup() {
  size(400, 400);
  pixelDensity(displayDensity());
  ;  stopwatch = millis();
  for (int i = 0; i < hearts; i++) {
    heart.add(new heartContainer(i));
    heart.get(i).heartInit();
  }
  for (int i = 0; i < hearts; i++) {
    IDField.add(new userInputField(this, i, "ID"));
    IPField.add(new userInputField(this, i, "IP"));
  }
  int i = 0;
  for (int y = 80; y < height - 10; y += 90) {
    for (int x = 10; x < width; x += 100) {
      IDField.get(i).newTextField(x, y - 15);
      IPField.get(i).newTextField(x, y);
      i++;
    }
  }
}

void draw() {
  background(100);
  timer();
  int i = 0;
  for (int y = 35; y < height - 10; y += 90) {
    for (int x = 50; x < width; x += 100) {
      heart.get(i).heartDraw(x , y);
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
    println(theEvent.getName().equals("ID:0"));
    //println(theEvent.getName() + " = " + theEvent.getStringValue());
    for (int i = 0; i < hearts; i++) {
      if (theEvent.getName().equals(str(i))) {
        IDField.get(i).text = theEvent.getStringValue();
        IPField.get(i).text = theEvent.getStringValue();
      }
    }
  }
}
