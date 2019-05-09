package DAO;

import java.sql.*;
import BEAN.*;
import java.util.*;

public class NhanVienDAO {
	
	public static boolean ThemNhanVien(Connection conn, NhanVien nv) {
		String sql = "insert into nhanvien (MaNhanVien, HoTen, Email, SDT, IDQuyen) values (?, ?, ?, ?, ?)";
		PreparedStatement statement;
		try {
			statement = conn.prepareStatement(sql);
			statement.setString(1, nv.getMaNhanVien());
			statement.setString(2, nv.getHoTen());
			statement.setString(3, nv.getEmail());
			statement.setString(4, nv.getSDT());
			statement.setInt(5, nv.getQuyen().getMaQuyen());
			if(statement.executeUpdate()>0) {
				statement.close();
				return true;
			}
			statement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}		
		return false;
	}
	public static boolean SuaNhanVien(Connection conn, NhanVien nv) {
		String sql = "update nhanvien set HoTen = ?, Email = ?, SDT = ?, IDQuyen = ? where MaNhanVien = ?";
		PreparedStatement statement;
		try {
			statement = conn.prepareStatement(sql);
			statement.setString(1, nv.getHoTen());
			statement.setString(2, nv.getEmail());
			statement.setString(3, nv.getSDT());
			statement.setInt(4, nv.getQuyen().getMaQuyen());
			statement.setString(5, nv.getMaNhanVien());
			if(statement.executeUpdate()>0) {
				statement.close();
				return true;
			}
			statement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}		
		return false;
	}
	public static void XoaNhanVien(Connection conn, String manv) {
		String sql = "delete from nhanvien where MaNhanVien = ?";
		PreparedStatement statement;
		try {
			statement = conn.prepareStatement(sql);
			statement.setString(1, manv);
			statement.executeUpdate();
			statement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}	
	}
	public static NhanVien LayNV(Connection conn, String manv) {
		String sql = "select * from nhanvien where MaNhanVien = ?";
		PreparedStatement statement;
		try {
			statement = conn.prepareStatement(sql);
			statement.setString(1, manv);
			ResultSet rs = statement.executeQuery();
			if (rs.next())
			{
				String ten = rs.getString("HoTen");
				String mail = rs.getString("Email");
				String sdt = rs.getString("SDT");
				Quyen q = QuyenDAO.LayQuyen(conn, rs.getInt("IDQuyen"));
				NhanVien nv = new NhanVien(manv, ten, sdt, mail, q);
				rs.close();
				statement.close();
				return nv;
			}
			rs.close();
			statement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}	
		return null;
	}
	
	public static List<NhanVien> TatCaNV(Connection conn) {
		
		List<NhanVien> list = new ArrayList<NhanVien>();
		String sql = "select * from nhanvien";
		Statement statement;
		try {
			statement = conn.createStatement();
			ResultSet rs = statement.executeQuery(sql);
			while (rs.next())
			{
				String manv = rs.getString("MaNhanVien");
				String ten = rs.getString("HoTen");
				String mail = rs.getString("Email");
				String sdt = rs.getString("SDT");
				Quyen q = QuyenDAO.LayQuyen(conn, rs.getInt("IDQuyen"));
				NhanVien nv = new NhanVien(manv, ten, sdt, mail, q);
				list.add(nv);
			}
			rs.close();
			statement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}	
		return list;
	}

}
