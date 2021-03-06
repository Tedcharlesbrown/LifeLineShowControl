class networkPing {

  String IP;
  int index;
  int variableTimer = 5;
  int stopwatch;
  networkPing(int tempIndex) {
    stopwatch = millis();
    this.index = tempIndex;
    this.IP = "";
  }

  void send() {
    int timeOut = 1000;
    gui.resetTimer = true;
    if (this.IP.length() > 0) {
      try {
        InetAddress inet = InetAddress.getByName(this.IP);
        if (inet.isReachable(timeOut)) {
          heart.get(this.index).reachable = 2;
          println("From: " + this.index + ", " + this.IP + " is reachable.");
        } else {
          heart.get(this.index).reachable = 1;
          println("From: " + this.index + ", " + this.IP + " NOT reachable.");
        }
      } catch (Exception e) {
        heart.get(this.index).reachable = 1;
        println("Exception:" + e.getMessage());
      }
    } else {
      heart.get(this.index).reachable = 0;
    }
  }

  void find(String subnet) {
    int timeout = 100;
    int found = 0;
    for (int i = 1; i < 255; i++) {
      String host = subnet + "." + i;
      try {
        InetAddress address = InetAddress.getByName(host);
        if (address.isReachable(timeout)) {
          ipField.get(found).userIP = host;
          ping.get(found).IP = host;
          println(host + " is reachable " + str(found));
          found++;
          println(address.getHostName());
        }
      } catch (Exception e) {
      }
    }
  }

  void request(String tempIP) {
    if (this.IP != "IP ADDRESS") {
      this.IP = tempIP;
    }
  }

  void timer() {
    if (millis() > stopwatch && !pauseTimer && startUp) {
      stopwatch += variableTimer * 1000;
      send();
    }
  }
}