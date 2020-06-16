class heartContainer {

	PImage heartIMG, heartBGIMG;
	int size = 60;
	float x, y;
	int index;

	heartContainer(int tempIndex) {
		this.index = tempIndex;
	}


	void heartInit() {
		heartIMG = loadImage("heart.png");
		heartIMG.resize(size,size);
	}

	void heartDraw(float x, float y) {
		this.x = x;
		this.y = y;
		imageMode(CENTER);
		image(heartIMG, this.x, this.y);
	}
}