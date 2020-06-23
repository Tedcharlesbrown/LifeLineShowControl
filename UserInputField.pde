class userInputField {
	float x, y;
	String name, address;
	int index;
	boolean clicked = false;

	String userID = "";
	String userIP = "";

	userInputField(String name, int index) {
		this.name = name;
		this.index = index;
		this.address = this.name + str(this.index);
	}

	void fieldDraw(float x, float y) {
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

	void fieldText() {
		textSize(10);
		textAlign(CENTER, CENTER);
		fill(0);
		if (this.name == "ID") {
			if ((!this.clicked) && this.userID.length() == 0) {
				text("NAME", this.x, this.y - 1);
			} else {
				text(this.userID, this.x, this.y - 1);
			}
		} else {
			if ((!this.clicked) && this.userIP.length() == 0) {
				text("IP ADDRESS", this.x, this.y - 1);
			} else {
				text(this.userIP, this.x, this.y - 1);
			}
		}
	}

	void fieldClicked() {
		if (dist(mouseX, this.y, this.x, this.y) < 90 / 2) {
			if (dist(this.x, mouseY, this.x, this.y) < 15 / 2) {
				this.clicked = true;
			}
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
			} else if (keyCode >= 65 && keyCode <= 90) {
				this.userID += key;
			} else if ((keyCode >= 48 && keyCode <= 57) || (keyCode >= 96 && keyCode <= 105) || key == '.') {
				this.userID += key;
				this.userIP += key;
			} else if (key == ENTER || key == RETURN) {
				this.clicked = false;
				//ping.get(this.index).request(this.userIP);
			}
		}
	}

	void settingsStart(int index) {
		this.index = index;
		if (this.userIP.length() > 0) {
			//ping.get(this.index).request(this.userIP);
		}

	}

	void mousePressed() {
		fieldClicked();
		//println(this.address);
	}

	void mouseReleased() {
		//this.clicked = false;
		//println(this.address);
	}

}