class Settings {
	Table table;

	Settings() {
		table = loadTable("LifeLineSettings.csv", "header");
		try {
			for (int i = 0; i < table.getRowCount(); i++) {
				TableRow row = table.getRow(i);
				idField.get(i).userID = row.getString("NAME");
				ipField.get(i).userIP = row.getString("IP");
				//ping.get(i).variableTimer = row.getInt("TIME");
			}
		} catch (NullPointerException e) {
			table = new Table();
			table.addColumn("NAME");
			table.addColumn("IP");
			for (int i = 0; i < hearts; i++) {
				TableRow row = table.addRow();
				row.setString("NAME", "");
				row.setString("IP", "");
				row.setString("TIME", "");
				table.setInt(i,"TIME",5);
				//ping.get(i).variableTimer = 5;
			}
		}
	}

	void get() {
		for (int i = 0; i < table.getRowCount(); i++) {
			table.setString(i, "NAME", idField.get(i).userID);
			table.setString(i, "IP", ipField.get(i).userIP);
		}
		saveTable(table, "LifeLineSettings.csv");
	}

	void keyPressed() {
		if (key == ENTER || key == RETURN) {
			get();
		}
	}
}