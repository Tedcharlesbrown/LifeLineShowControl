class userInputField {
  ControlP5 cp5;
  PFont font = createFont("arial", 5);
  int x, y;
  int index;
  String ID;

  String text = "";

  userInputField(PApplet thePApplet, int tempIndex, String tempID) {
    cp5 = new ControlP5(thePApplet);
    this.index = tempIndex;
    this.ID = tempID;
  }

  void newTextField(int x, int y) {
    this.x = x;
    this.y = y;
    if (this.ID == "ID") {
      cp5.addTextfield(this.ID + ":" + str(this.index))
      .setPosition(this.x, this.y)
      .setSize(80, 15)
      .setFont(createFont("arial", 5))
      .setAutoClear(false)
      .setLabel("")
      .setColorActive(color(0, 0, 255)) //changes outline
      .setColorForeground(color(0, 255, 0)) //outline
      .setColorBackground(color(100, 100, 100)) //background
      .setText("ID") //Default Text
      ;
    } else if (this.ID == "IP") {
      cp5.addTextfield(this.ID + ":" + str(this.index))
      .setPosition(this.x, this.y)
      .setSize(80, 15)
      .setFont(createFont("arial", 5))
      .setAutoClear(false)
      .setLabel("")
      .setColorActive(color(0, 0, 255)) //changes outline
      .setColorForeground(color(0, 255, 0)) //outline
      .setColorBackground(color(100, 100, 100)) //background
      .setText("IP") //Default Text
      ;
    }

    textFont(font);
  }
}