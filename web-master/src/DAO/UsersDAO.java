package DAO;

import java.sql.*;
import BEAN.Users;

public class UsersDAO {
	
	public static Users KiemTraTaiKhoan(Connection conn, String username, String pass) {
		
		String sql = "select * from user where ID = ? and Pass = ?";
		PreparedStatement statement;
		try {
			statement = conn.prepareStatement(sql);
			statement.setString(1, username);
			statement.setString(2, pass);
			ResultSet rs = statement.executeQuery();
			if(rs.next()) {
				int quyen = rs.getInt("Quyen");
				Users user = new Users(username, pass, quyen);
				rs.close();
				statement.close();
				return user;
			}
			rs.close();
			statement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}		
		return null;
	}

	public static Users LayTaiKhoan(Connection conn, String username) {
		
		String sql = "select * from user where ID = ?";
		PreparedStatement statement;
		try {
			statement = conn.prepareStatement(sql);
			statement.setString(1, username);
			ResultSet rs = statement.executeQuery();
			if(rs.next()) {
				int quyen = rs.getInt("Quyen");
				String pass = rs.getString("Pass");
				Users user = new Users(username, pass, quyen);
				rs.close();
				statement.close();
				return user;
			}
			rs.close();
			statement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}		
		return null;
	}
	
	public static boolean ThemTaiKhoan(Connection conn, Users user) 
	{
		PreparedStatement statement = null;
		String sql="insert into user(id,pass,quyen) values (?, ?, ?)";
		try {
			statement = conn.prepareStatement(sql);
			statement.setString(1, user.getId());
			statement.setString(2, user.getPass());
			statement.setInt(3, user.getQuyen());
			if(statement.executeUpdate()!=0) {
				statement.close();
				return true;
			}
			statement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}		
		return false;
	}
	
	public static boolean SuaTaiKhoan(Connection conn, Users user) {
		
		String sql = "update user set Pass = ? where ID = ?";
		PreparedStatement statement;
		try {
			statement = conn.prepareStatement(sql);
			statement.setString(1, user.getPass());
			statement.setString(2, user.getId());
			if(statement.executeUpdate()!=0) {
				statement.close();
				return true;
			}
			statement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}	
		return false;
	}
	
	public static void XoaTaiKhoan(Connection conn, String id) {
		String sql = "delete from user where ID = ?";
		PreparedStatement statement;
		try {
			statement = conn.prepareStatement(sql);
			statement.setString(1, id);
			statement.executeUpdate();
			statement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}	
	}
}
