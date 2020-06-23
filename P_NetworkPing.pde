class networkPing {
  String IP;
  int index;
  int variableTimer;
  int stopwatch;
  networkPing(int tempIndex) {
    stopwatch = millis();
    this.index = tempIndex;
    this.IP = "";
  }

  void send() {
    int timeOut = int(map(frameRate, 0, 60, variableTimer * 1000, 1000));
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
        System.out.println("Exception:" + e.getMessage());
      }
    }
  }

  void request(String tempIP) {
    if (this.IP != "IP ADDRESS") {
      this.IP = tempIP;
    }
  }

  void timer() {
    if (millis() > stopwatch && !pauseTimer) {
      stopwatch += variableTimer * 1000;
      send();
    }
  }
}