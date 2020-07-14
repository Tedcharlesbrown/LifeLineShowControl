import java.net.*;

ArrayList<heartContainer> heart = new ArrayList<heartContainer>();
ArrayList<networkPing> ping = new ArrayList<networkPing>();
ArrayList<userInputField> ipField = new ArrayList<userInputField>();
ArrayList<userInputField> idField = new ArrayList<userInputField>();

userInputField timer;

Settings settings;
GUI gui;

boolean pauseTimer = false;

boolean startUp = false;

String IP;
int hearts = 16;

void setup() {
  size(400, 400);
  frameRate(60);
  gui = new GUI();
  for (int i = 0; i < hearts; i++) {
    heart.add(new heartContainer(i));
    ping.add(new networkPing(i));
    idField.add(new userInputField("ID", i));
    ipField.add(new userInputField("IP", i));
    heart.get(i).heartInit();
  }
  settings = new Settings();
  timer = new userInputField("TIMER");
  for (int i = 0; i < hearts; i++) {
    ipField.get(i).settingsStart(i);
  }
}

void draw() {
  gui.draw();
  int i = 0;
  for (int y = 35; y < height - 10; y += 90) {
    for (int x = 50; x < width; x += 100) {
      heart.get(i).heartDraw(x , y);
      idField.get(i).draw(x, y - 14);
      ipField.get(i).draw(x, y + 1);
      ping.get(i).timer();
      i++;
    }
  }
  timer.drawTimer(width / 2, height - 35 / 2);
  if (millis() < 1000) {
    background(0);
  }
  startUp = true;
}

void mousePressed() {
  for (int i = 0; i < hearts; i++) {
    idField.get(i).mousePressed();
    ipField.get(i).mousePressed();
  }
  timer.mousePressed();
  //ping.get(0).find("192.168.0");
}

void mouseReleased() {
  for (int i = 0; i < hearts; i++) {
    idField.get(i).mouseReleased();
    ipField.get(i).mouseReleased();
  }
  timer.mouseReleased();
}
void keyPressed() {
  settings.keyPressed();
  for (int i = 0; i < hearts; i++) {
    idField.get(i).keyPressed();
    ipField.get(i).keyPressed();
  }
  timer.keyPressed();
}
