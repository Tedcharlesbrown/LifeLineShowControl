class userInputField {
  ControlP5 cp5;
  PFont font = createFont("arial", 10);
  int x, y;
  int index;

  String text = "";

  userInputField(PApplet thePApplet, int tempIndex) {
    cp5 = new ControlP5(thePApplet);
    this.index = tempIndex;
  }

  void newTextField(int x, int y) {
    this.x = x;
    this.y = y;
    cp5.addTextfield(str(this.index))
      .setPosition(this.x, this.y)
      .setSize(80, 15)
      .setFont(createFont("arial", 10))
      .setAutoClear(false)
      .setLabel("")
      .setColorActive(color(0, 0, 255)) //changes outline
      .setColorForeground(color(0, 255, 0)) //outline
      .setColorBackground(color(100, 100, 100)) //background
      .setText("IP"); //Default Text
    ;

    textFont(font);
  }
}