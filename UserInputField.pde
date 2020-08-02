class userInputField {
	float x, y;
	String name, address;
	int index;
	boolean clicked = false;

	String userID = "";
	String userIP = "";
	String userTimer = "5";

	userInputField(String name, int index) {
		this.name = name;
		this.index = index;
		this.address = this.name + str(this.index);
	}

	userInputField(String name) {
		this.name = name;
	}

	void draw(float x, float y) {
		this.x = x;
		this.y = y + 50;
		rectMode(CENTER);
		noFill();
		if (this.clicked) {
			stroke(0, 0, 255);
			strokeWeight(2);
		} else {
			stroke(0);
			strokeWeight(0.5);
		}
		rect(this.x, this.y, 90, 15);
		fieldText();
	}

	void drawTimer(float x, float y) {
		this.x = x;
		this.y = y;
		rectMode(CENTER);
		noFill();
		if (this.clicked) {
			stroke(0, 0, 255);
			strokeWeight(2);
		} else {
			stroke(255 / 2);
			strokeWeight(1);
		}
		rect(this.x, this.y, 90, 30);
		fieldText();
	}

	void fieldText() {
		textAlign(CENTER, CENTER);
		fill(0);
		textSize(10);
		if (this.name == "ID") {
			if ((!this.clicked) && this.userID.length() == 0) {
				text("NAME", this.x, this.y - 1);
			} else {
				text(this.userID, this.x, this.y - 1);
			}
		} else if (this.name == "IP") {
			if ((!this.clicked) && this.userIP.length() == 0) {
				text("IP ADDRESS", this.x, this.y - 1);
			} else {
				text(this.userIP, this.x, this.y - 1);
			}
		} else if (this.name == "TIMER") {
			fill(255 / 2);
			textSize(25);
			text(userTimer, this.x, this.y - 1);
		}
	}

	void keyPressed() {
		if (this.clicked) {
			if (key == BACKSPACE || keyCode == 8) {
				if (this.userID.length() == 0) {
					//return;
				} else {
					this.userID = this.userID.substring(0, this.userID.length() - 1);
				}
				if (this.userIP.length() == 0) {
					return;
				} else {
					this.userIP = this.userIP.substring(0, this.userIP.length() - 1);
				}
				if (userTimer.length() == 0) {
					return;
				} else {
					userTimer = userTimer.substring(0, userTimer.length() - 1);
				}
			} else if (keyCode >= 65 && keyCode <= 90) { //LETTERS
				this.userID += key;
			} else if ((keyCode >= 48 && keyCode <= 57) || (keyCode >= 96 && keyCode <= 105) || key == '.') { //NUMBERS
				this.userID += key;
				this.userIP += key;
				userTimer += key;
			} else if (key == ENTER || key == RETURN) {
				this.clicked = false;
				pauseTimer = false;
				if (this.name == "IP") {
					ping.get(this.index).request(this.userIP);
				}
				if (this.name == "TIMER") {
					if (userTimer.length() == 0) {
						userTimer = "5";
						return;
					}
					adjustTimer(userTimer);
				}
			}
		}
	}

	void adjustTimer(String _userTime) {
		for (int i = 0; i < hearts; i++) {
			ping.get(i).variableTimer = int(_userTime);
		}
	}

	void settingsStart(int index) {
		this.index = index;
		if (this.userIP.length() > 0) {
			ping.get(this.index).request(this.userIP);
		}

	}

	void mousePressed() {
		if (!pauseTimer) {
			if (dist(mouseX, this.y, this.x, this.y) < 90 / 2) {
				if (dist(this.x, mouseY, this.x, this.y) < 15 / 2) {
					this.clicked = true;
					pauseTimer = true;
					if (this.name == "TIMER") {
						userTimer = "";
					}
				}
			}
		}
		//println(this.address);
	}

	void mouseReleased() {
		//this.clicked = false;
		//println(this.address);
	}

}