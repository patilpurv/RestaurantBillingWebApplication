package org.resbill.config;

import java.sql.*;

public class DBConfig {

	protected Connection conn;
	protected PreparedStatement stmt;
	protected ResultSet rs;
	Statement stmts;

	public DBConfig() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			// local
			 conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/Restaurant","root","0808");

			// server
			//conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/smprowor_restaurant", "smprowor_purva",
			//		"gIn3+*8aVO^h");
		} catch (Exception ex) {
			System.out.println("Error is " + ex);
		}
	}
}
