package DAO;

import java.sql.*;
import java.util.*;
import BEAN.Comment;

public class CommentDAO {

	public static List<Comment> DanhSachBinhLuan(Connection conn, String masp){
		
		List<Comment> list = new ArrayList<Comment>();
		String sql="select * from comment where MaSanPham = ?";
		PreparedStatement statement;
		try {
			statement = conn.prepareStatement(sql);
			statement.setString(1, masp);
			ResultSet rs = statement.executeQuery();
			while (rs.next()) {
				String macm = rs.getString("MaComment");
				String makh = rs.getString("MaKhachHang");
				String nd = rs.getString("NoiDung");
				Comment cm = new Comment(macm, masp, makh, nd);
				list.add(cm);
			}
			rs.close();
			statement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}	
		return list;
	}
	
	public static void ThemBinhLuan(Connection conn, Comment cm){
		
		String sql="insert into comment(MaComment, MaSanPham, MaKhachHang, NoiDung) values(?, ?, ?, ?)";
		PreparedStatement statement;
		try {
			statement = conn.prepareStatement(sql);
			statement.setString(1, cm.getMaComment());
			statement.setString(2, cm.getMaSanPham());
			statement.setString(3, cm.getMaKhachHang());
			statement.setString(4, cm.getNoiDung());
			statement.executeUpdate();
			statement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}	
	}
	
	public static void XoaBinhLuan(Connection conn, String macm){
		
		String sql="delete from comment where MaComment = ?";
		PreparedStatement statement;
		try {
			statement = conn.prepareStatement(sql);
			statement.setString(1, macm);
			statement.executeUpdate();
			statement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}	
	}
}
