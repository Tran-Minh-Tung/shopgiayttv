package DB;

import java.sql.*;

public class DBConnection {

	public static Connection CreateConnection() {
		Connection conn=null;
		String url="jdbc:mysql://localhost:3306/quanlyshopgiay?useUnicode=yes&characterEncoding=UTF-8";
		String username="root";
		String pass="TranMinhTung20091998";
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
