public class networkPing implements Runnable {

  String IP;
  int index;
  int variableTimer = 10;
  int stopwatch;
  public networkPing(int tempIndex) {
    stopwatch = millis();
    this.index = tempIndex;
    this.IP = "";
  }

  public void run() {
<<<<<<< Updated upstream
    send();
    println("test");
=======
    println(settings.ipList[this.index]);
>>>>>>> Stashed changes
  }

  void send() {
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
    println("TEST");
    send();
  }
}

  void find(String subnet) {
    int timeout = 5000;
    int found = 0;
    for (int i = 1; i < 255; i++) {
      String host = subnet + "." + i;
      try {
        InetAddress address = InetAddress.getByName(host);
        if (address.isReachable(timeout)) {
          //ipField.get(found).userIP = host;
          println(host + " is reachable " + str(found));
          found++;
          //println(address.getHostName());
        }
      } catch (Exception e) {
      }
    }
  }

  public void request(String tempIP) {
    if (this.IP != "IP ADDRESS") {
      this.IP = tempIP;
    }
  }
}