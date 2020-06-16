class heartContainer {

	PImage heartIMG, heartBGIMG;
	int size = 60;
	float x, y;
	int index;

	int reachable;

	int tintFade = 0;

	heartContainer(int tempIndex) {
		this.index = tempIndex;
		this.reachable = 0;
	}


	void heartInit() {
		heartIMG = loadImage("heart.png");
		heartIMG.resize(size, size);
	}

	void heartDraw(float x, float y) {
		this.x = x;
		this.y = y;
		heartColor();
		imageMode(CENTER);
		image(heartIMG, this.x, this.y);
	}

	void heartColor() {
		if (this.reachable == 1) { //FALSE
			tint(255, 255 - tintFade , 255 - tintFade);
			tintFade = tintFade + 2;
		} else if (this.reachable == 2) { //TRUE
			tint(255 - tintFade, 255, 255 - tintFade);
			tintFade = tintFade + 2;
		} else {
			tint(255);
		}
	}
}