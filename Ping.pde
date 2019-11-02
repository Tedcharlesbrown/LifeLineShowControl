class ClassPing {

  String IP;
  boolean check;
  int userTime, time, timeCount;
  int initRun = 1;
  int timeOut;

  void test(String tempIP, int tempTime) {
    this.IP = tempIP;
    this.userTime = tempTime;
    this.time = tempTime;

    this.timeCount = seconds % (this.time + 1);

    timeOut = int(map(frameRate, 0, 60, pingUserTimer * 1000, 1000));

    if (!splashScreen) {
      if (this.IP != "EMPTY" && this.IP != "") {
        if (this.time == this.timeCount || initRun == 1 || mousePressed == true) {
          try {
            InetAddress inet = InetAddress.getByName(this.IP);
            if (inet.isReachable(timeOut)) {
              //          println(this.IP + " is reachable.");
              this.check = true;
              this.time = this.userTime;
            } else {
              //          println(this.IP + " NOT reachable.");
              this.check = false;
              this.time = 0;
            }
          }
          catch (Exception e) {
            System.out.println("Exception:" + e.getMessage());
          }
          initRun = 0;
        }
      }
    }
  }
}
