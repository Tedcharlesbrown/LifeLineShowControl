class GUI {
	Boolean resetTimer = false;
	int currentTime, oldTime = 0;

	GUI() {

	}

	void draw() {
		drawBG();
		timerDraw();
	}

	void drawBG() {
		rectMode(CORNER);
		background(100);
		fill(0);
		rect(0, height - 35, width, 35);
	}

	void timerDraw() {
		if (!pauseTimer) {
			if (resetTimer) {
				oldTime = millis();
				resetTimer = false;
			}
			currentTime = millis() - oldTime;
			int timerLength = (ping.get(0).variableTimer) * 1000;

			int offsetTimer = millis() % timerLength - currentTime;

			fill(255);

			if (offsetTimer > 0) {
				rect(0, height - 35, map(currentTime % timerLength, 0, timerLength - offsetTimer, 0, width), 35);
			} else {
				rect(0, height - 35, width, 35);
			}
		}
	}
}