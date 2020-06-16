import java.net.*;
import controlP5.*;


ArrayList<heartContainer> heart = new ArrayList<heartContainer>();
ArrayList<networkPing> ping = new ArrayList<networkPing>();
ArrayList<userInputField> ipField = new ArrayList<userInputField>();
ArrayList<userInputField> idField = new ArrayList<userInputField>();

String IP;
int variableTimer = 5;
int stopwatch;
int hearts = 16;

String IP0,ID0;

void setup() {
  size(400, 400);
  stopwatch = millis();
  for (int i = 0; i < hearts; i++) {
    heart.add(new heartContainer(i));
    idField.add(new userInputField("ID", i));
    ipField.add(new userInputField("IP", i));
    heart.get(i).heartInit();
  }
}

void draw() {
  background(100);
  timer();
  int i = 0;
  for (int y = 35; y < height - 10; y += 90) {
    for (int x = 50; x < width; x += 100) {
      heart.get(i).heartDraw(x , y);
      idField.get(i).fieldDraw(x, y - 14);
      ipField.get(i).fieldDraw(x, y + 1);
      i++;
    }
  }
  fill(255);
  rect(width / 2,400,width,70);
}

void timer() {
  if (millis() > stopwatch) {
    stopwatch += 5000;
    //ping.sendPing("192.168.0.20");
  }
}
