package DB;

import java.sql.*;

public class DBConnection {

	public static Connection CreateConnection() {
		Connection conn=null;
		String url="jdbc:mysql://den1.mysql6.gear.host/shopgiayttv?useUnicode=yes&characterEncoding=UTF-8";
		String username="shopgiayttv";
		String pass="shopgiayttv@1";
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(url, username, pass);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
		return conn;
	}
}
