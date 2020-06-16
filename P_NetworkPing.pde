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
    int timeOut = int(map(frameRate, 0, 60, variableTimer * 1000, 1000));
    try {
      InetAddress inet = InetAddress.getByName(this.IP);
      if (inet.isReachable(timeOut)) {
        heart.get(this.index).reachable = 2;
        //println("From: " + this.index + ", " + this.IP + " is reachable.");
      } else {
        heart.get(this.index).reachable = 1;
        //println("From: " + this.index + ", " + this.IP + " NOT  reachable.");
      }
    } catch (Exception e) {
      System.out.println("Exception:" + e.getMessage());
    }
  }

  void request(String tempIP) {
    if (this.IP != "IP ADDRESS") {
      this.IP = tempIP;
    }
  }

  void timer() {
    if (millis() > stopwatch) {
      stopwatch += 5000;
      send();
    }
  }
}