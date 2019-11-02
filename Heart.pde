class ClassHeart {

  String name;
  int r, inner, outer, x, y, font, index, timeCount, userTime;
  boolean check;

  int tintCheck;

  ClassHeart(int tempFont, int tempSize, int tempI) {
    this.inner = tempSize/4;
    this.outer = tempSize;
    this.r = tempSize;
    this.font = tempFont;
    this.index = tempI;
    this.tintCheck = tintCheck;
  }

  void render(String tempName, boolean tempCheck, int tempUserTime, int tempX, int tempY) {
    this.name = tempName;
    this.x = tempX;
    this.y = tempY;
    this.check = tempCheck;
    this.timeCount = seconds % (tempUserTime + 1);
    this.userTime = tempUserTime;

    fill(255, 255, 0);
    textSize(this.font);
    textAlign(CENTER, CENTER);

    imageMode(CENTER);
    heartOuter.resize(this.outer, this.outer);

    if (pings.get(this.index).IP != "") {
      if (this.check == true) {
        tint(0, 255, 0);
      } else {
        tint (255, 0, 0);
      }
    } else {
      tint(100);
    }
    if (this.name == "" && pings.get(this.index).IP != "") {
      text(pings.get(this.index).IP, this.x, this.y + (this.outer - this.inner - this.font));
    } else if (this.name == "") {
      tint(100);
    } else {
      text(this.name, this.x, this.y + (this.outer - this.inner - this.font));
    }  
    if (this.name != "" && pings.get(this.index).IP != "") {
      text(pings.get(this.index).IP, this.x, this.y + (this.outer - this.font));
    }
    image(heartOuter, this.x, this.y);
  }
}
