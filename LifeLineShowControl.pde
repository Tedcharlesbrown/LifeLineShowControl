import java.net.*;

ArrayList<heartContainer> heart = new ArrayList<heartContainer>();
//ArrayList<networkPing> ping = new ArrayList<networkPing>();
ArrayList<userInputField> ipField = new ArrayList<userInputField>();
ArrayList<userInputField> idField = new ArrayList<userInputField>();

settingsClass settings;
guiClass gui;

boolean startUp = false;

int stopwatch;
int variableTimer = 10;

String IP;
int hearts = 16;

void setup() {
  size(400, 400);
  frameRate(60);
  gui = new guiClass();
  for (int i = 0; i < hearts; i++) {
    heart.add(new heartContainer(i));
    //ping.add(new networkPing(i));
    idField.add(new userInputField("ID", i));
    ipField.add(new userInputField("IP", i));
    heart.get(i).heartInit();
  }
  settings = new settingsClass();
  for (int i = 0; i < hearts; i++) {
    ipField.get(i).settingsStart(i);
  }

  Runnable r = new networkPing(10);
  new Thread(r).start();
}

void draw() {
  Runnable r = new networkPing(10);
  new Thread(r).start();
  gui.draw();
  int i = 0;
  for (int y = 35; y < height - 10; y += 90) {
    for (int x = 50; x < width; x += 100) {
      heart.get(i).heartDraw(x , y);
      idField.get(i).fieldDraw(x, y - 14);
      ipField.get(i).fieldDraw(x, y + 1);
      i++;
    }
  }
  if (millis() < 1000) {
    background(0);
  }
  startUp = true;
  timer();
}

void send(String IP) {
  this.IP = IP;
  int timeOut = variableTimer * 1000;
  //if (this.IP.length() > 0) {
  try {
    InetAddress inet = InetAddress.getByName("192.168.0.24");
    if (inet.isReachable(timeOut)) {
      heart.get(0).reachable = 2;
      println("From: " + 0 + ", " + this.IP + " is reachable.");
    } else {
      heart.get(0).reachable = 1;
      println("From: " + 0 + ", " + this.IP + " NOT reachable.");
    }
  } catch (Exception e) {
    heart.get(0).reachable = 1;
    println("Exception:" + e.getMessage());
  }
  //}
}

void timer() {
  if (millis() > stopwatch && startUp) {
    stopwatch += variableTimer * 1000;
    //thread("send");
  }
}


void mousePressed() {
  for (int i = 0; i < hearts; i++) {
    idField.get(i).mousePressed();
    ipField.get(i).mousePressed();
  }
  //ping.send();
  //ping.get(0).find("192.168.0");
}

void mouseReleased() {
  for (int i = 0; i < hearts; i++) {
    idField.get(i).mouseReleased();
    ipField.get(i).mouseReleased();
  }
}
void keyPressed() {
  settings.keyPressed();
  for (int i = 0; i < hearts; i++) {
    idField.get(i).keyPressed();
    ipField.get(i).keyPressed();
  }
}
