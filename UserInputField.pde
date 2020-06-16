class userInputField {
	float x, y;
	String name;
	int index;

	userInputField(String name, int index) {
		this.name = name;
		this.index = index;
	}

	void fieldDraw(float x, float y) {
		this.x = x;
		this.y = y + 50;
		rectMode(CENTER);
		noFill();
		stroke(0);
		rect(this.x, this.y, 90, 15);
		textDraw();
	}

	void textDraw() {
		textSize(12);
		textAlign(CENTER, CENTER);
		if (this.name == "ID") {
			text("NAME", this.x, this.y - 1);
		} else {
			text("IP ADDRESS", this.x, this.y - 1);
		}
	}

}