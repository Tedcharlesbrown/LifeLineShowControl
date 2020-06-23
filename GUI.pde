class guiClass {

	guiClass() {

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
		//int timerLength = (ping.get(0).variableTimer) * 1000;
		fill(255);
		//rect(0, height - 35, map(millis() % timerLength + 50, 0, timerLength, -25, width), 35);
	}
}