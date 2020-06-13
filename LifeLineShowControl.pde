//VERSION 1.2

import java.net.*;

PImage heartOuter;
PImage logo;
PImage splashImage;
PrintWriter errorLog;

int IPTotal = 16;
int heartSize = 100;
int pingUserTimer; // User variable - time between pings

ArrayList<ClassHeart> hearts;
ArrayList<ClassPing> pings;
StringList Names, IPs;
IntList XPos, YPos;

int seconds, halfSeconds, quartSeconds, millis, timer, timerReset;

int bottomFill = 10;
int bottomFiller = 3;

boolean check = true;

String clock, clock1, clock2, clock3, clock4;
int hourClock;

boolean splashScreen = true;
int lockout;

void setup() {
  frameRate(60);
  size(800, 700);
  stringLoad();

  hearts = new ArrayList<ClassHeart>();
  pings = new ArrayList<ClassPing>();

  Names = new StringList();
  IPs = new StringList();
  XPos = new IntList();
  YPos = new IntList();

  splashImage = loadImage("splash.png");
  logo = loadImage("logo.png");
  heartOuter = loadImage("heart.png");

  check = false;
}

void draw() {
  background(0);
  timer();

  heartInit();

  assignName();
  assignIP();
  assignX();
  assignY();

  heartDraw();

  GUI();
}

void timer() {
  seconds = (millis() /1000);
  halfSeconds = (millis() /100);
  quartSeconds = (millis() /10);
  millis = millis();
}

void heartInit() {
  if (hearts.size() < IPTotal) {
    for (int i = 0; i < IPTotal; i++) {
      hearts.add(new ClassHeart(20, heartSize, i));
      pings.add(new ClassPing());
      Names.append("EMPTY");
      IPs.append("EMPTY");
    }
  }
}

void heartDraw() {
  for (int i = 0; i < IPTotal; i++) {
    ClassPing ping = pings.get(i);
    ping.test(IPs.get(i), pingUserTimer);

    ClassHeart heart = hearts.get(i);
    heart.render(Names.get(i), pings.get(i).check, pingUserTimer, XPos.get(i), YPos.get(i));
  }
}

void GUI() {
  timer = seconds % (pingUserTimer + 1);
  //TOP
  stroke(0, 0, 255);
  strokeWeight(1);
  textSize(30);
  if (frameRate <= 10) {
    stroke(255, 0, 0);
  }
  if (pingUserTimer != 0) {
    fill(100);
    rect(0, 600, width, 640);
    if (timer != 0) {
      float timerFill = map(timer, 0, pingUserTimer, 0, width);
      fill(255);
      rect(0, 600, timerFill, 640);
    }
    fill(255, 0, 0);
    text(timer + " / " + pingUserTimer, width/2, height - 85);
  } else {
    if (bottomFill <= 0 || bottomFill >= 255) {
      bottomFiller*= -1;
    }
    fill(bottomFill, bottomFill, 255);
    rect(0, 600, width, 640);
    bottomFill+= bottomFiller;
  }
  //BOTTOM
  fill(25);
  rect(0, 640, width, height);
  //TEXT FORMATTING
  fill(255);
  textAlign(CENTER, CENTER);
  //CLOCK
  tcbClock();
  textSize(30);
  text(clock, width / 2, height - 45);
  //TCB INFO
  textSize(15);
  text("Lifeline v.1.2 || Tedcharlesbrown.com || Tedcharlesbrown@gmail.com", width / 2, height - 15);
  //TCB LOGO
  tint(255);
  image(logo, width - 35, height - 30, 60, 60);
  //OUTSIDE
  noFill();
  strokeWeight(10);
  rect(0, 0, width, height);
}

void tcbClock() {
  hourClock = hour();
  if (hourClock == 0) {
    hourClock = 12;
  } else if (hourClock >= 13) { 
    hourClock = hourClock % 12;
  }
  clock1 = hourClock + ":0" + minute() + ".0" + second();
  clock2 = hourClock + ":" + minute() + ".0" + second();
  clock3 = hourClock + ":0" + minute() + "." + second();
  clock4 = hourClock + ":" + minute() + "." + second();
  if (minute() <= 9 && second() <= 9) {
    clock = clock1;
  } else if (second() <= 9) {
    clock = clock2;
  } else if (minute() <= 9) {
    clock = clock3;
  } else {
    clock = clock4;
  }
  if (hour() >= 12) {
    clock = clock + " PM";
  } else {
    clock = clock + " AM";
  }
}

//void exit() {
// errorLog.flush();
// errorLog.close();
// super.exit();
//}
