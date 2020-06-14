import java.net.*;

networkPing ping = new networkPing();

PShape heart;

String IP;
int variableTimer = 5;
int stopwatch;

float heartSize = 300;
float heartScale = 0.25;

int Width, Height;

void setup() {
  size(400, 400);
  Width = width;
  Height = height;
  surface.setResizable(true);
  stopwatch = millis();
  heartInit();
  registerMethod("pre", this);
}

void pre() {
  if (Width != width || Height != height) {
    Width = width;
    Height = height;
    windowResized();
  }
}

void draw() {
  background(100);
  timer();
  heartDraw();
  println(heartSize);
}

void heartInit() {
  heart = loadShape("heart.svg");
  heart.scale(heartScale);
  heartScale = 1 - heartScale;
  heartSize *= heartScale;
}

void heartReDraw() {
  
}

void heartDraw() {
  shapeMode(CENTER);
  translate(50, 50);
  shape(heart, heartSize / 2, heartSize / 2);
}

void timer() {
  if (millis() > stopwatch) {
    stopwatch += 5000;
    //ping.sendPing("192.168.0.20");
  }
}

void windowResized() {
  heartReDraw();
}
