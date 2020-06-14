class userInputField {
  ControlP5 cp5;
  PFont font = createFont("arial", 20);
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
    textAlign(CENTER,CENTER);
    cp5.addTextfield(str(this.index))
      .setPosition(this.x, this.y)
      .setSize(200, 40)
      .setFont(createFont("arial", 20))
      .setAutoClear(false)
      .setLabel("")
      .setColorActive(color(0, 0, 255)) //changes outline
      .setColorForeground(color(0, 255, 0)) //outline
      .setColorBackground(color(255, 0, 0)) //background
      .setText("IP"); //Default Text
    ;

    textFont(font);
  }
}