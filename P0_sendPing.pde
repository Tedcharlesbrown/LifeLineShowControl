class networkPing {
  String IP;
  networkPing() {
  }

  void sendPing(String tempIP) {
    int timeOut = int(map(frameRate, 0, 60, variableTimer * 1000, 1000));
    this.IP = tempIP;
    if (this.IP != "EMPTY" && this.IP != "") {
      try {
        InetAddress inet = InetAddress.getByName(this.IP);
        if (inet.isReachable(timeOut)) {
          println(this.IP + " is reachable.");
        } else {
          println(this.IP + " NOT reachable.");
        }
      }
      catch (Exception e) {
        System.out.println("Exception:" + e.getMessage());
      }
    }
  }
}
