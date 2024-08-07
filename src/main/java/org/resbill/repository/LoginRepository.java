package org.resbill.repository;

import java.sql.SQLException;

import org.resbill.config.DBConfig;

public class LoginRepository extends DBConfig {

	public boolean verifyAdmin(String username, String password) {
		int i = 0;
		try {
			stmt = conn.prepareStatement("select * from admin where admin=? and password=?");
			stmt.setString(1, username);
			stmt.setString(2, password);
			rs = stmt.executeQuery();
			while (rs.next()) {
				i++;
			}

			return i > 0 ? true : false;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}

	}
}
