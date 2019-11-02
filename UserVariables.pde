String[] settings;
String[] names = new String[16];
String[] IPS = new String[16];

int X, Y, counter;

int timerIndex, nameIndex, ipIndex;

void stringLoad() {
  String[] lines = loadStrings("Settings.txt");
  String linesJoin = join(lines, ";");
  String[] settings = trim(splitTokens(linesJoin, "=;"));

  if (settings[0].equals("Name")) {
    timerIndex = 5;
    nameIndex = 7;
    ipIndex = 9;
  } else {
    timerIndex = 1;
    nameIndex = 3;
    ipIndex = 5;
    lockout = 5;
  }

  pingUserTimer = abs(int(settings[timerIndex])); //1 , 5
  for (int i = 0; i < settings.length; i++) {
    if (settings[i].equals("empty") == true || settings[i].length() == 0) {
      settings[i] = "";
    }
  }
  counter = 0;
  for (int i = nameIndex; i < settings.length; i = i + 4) { //3 , 7
    names[counter] = settings[i];
    counter++;
  }
  counter = 0;
  for (int i = ipIndex; i < settings.length; i = i + 4) { //5 , 9
    IPS[counter] = settings[i];
    counter++;
  }
}

void assignName() {
  for (int i = 0; i < IPTotal; i++) {
    Names.set(i, names[i]);
  }
}

void assignIP() {
  for (int i = 0; i < IPTotal; i++) {
    IPs.set(i, IPS[i]);
  }
}

void assignX() {

  for (int i = 0; i < IPTotal; i++) {
    if (i % 4 == 0) {
      this.X = 100;
    } 
    if (i % 4 == 1) {
      this.X = 300;
    } 
    if (i % 4 == 2) {
      this.X = 500;
    } 
    if (i % 4 == 3) {
      this.X = 700;
    }
    XPos.append(this.X);
  }
}

void assignY() {
  for (int i = 0; i < IPTotal; i++) {
    YPos.append((ceil(i / 4) * 150) + 50);
  }
}
