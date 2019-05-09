package DAO;

import java.sql.*;
import BEAN.KhachHang;
import java.util.*;

public class KhachHangDAO {

	public static KhachHang LayKhachHang(Connection conn, String makh) {
		
		String sql = "select * from khachhang where MaKhachHang = ?";
		PreparedStatement statement;
		try {
			statement = conn.prepareStatement(sql);
			statement.setString(1, makh);
			ResultSet rs = statement.executeQuery();
			if(rs.next()) {
				String hoten = rs.getNString("HoTen");
				String mail = rs.getString("Email");
				String sdt = rs.getString("SDT");
				String diachi = rs.getNString("DiaChi");
				KhachHang kh = new KhachHang(makh, hoten, mail, sdt, diachi);
				rs.close();
				statement.close();
				return kh;
			}
			rs.close();
			statement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}		
		return null;
	}
	
	public static boolean ThemKhachHang(Connection conn, KhachHang kh) 
	{
		PreparedStatement statement = null;
		String sql="insert into khachhang(MaKhachHang, HoTen, Email, SDT, DiaChi) values (?, ?, ?, ?, ?)";
		try {
			statement = conn.prepareStatement(sql);
			statement.setString(1, kh.getMaKhachHang());
			statement.setString(2, kh.getHoTen());
			statement.setString(3, kh.getEmail());
			statement.setString(4, kh.getSoDienThoai());
			statement.setString(5, kh.getDiaChi());
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
	
	public static boolean SuaKhachHang(Connection conn, KhachHang kh) {

		String sql = "update khachhang set HoTen = ? , Email = ? , SDT = ? , DiaChi = ? where MaKhachHang = ? ";
		try {
			PreparedStatement statement;
			statement = conn.prepareStatement(sql);
			statement.setString(1, kh.getHoTen());
			statement.setString(2, kh.getEmail());
			statement.setString(3, kh.getSoDienThoai());
			statement.setString(4, kh.getDiaChi());
			statement.setString(5, kh.getMaKhachHang());
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
	
	public static boolean XoaKhachHang(Connection conn, String makh) {

		String sql = "delete from khachhang where MaKhachHang = ?";
		try {
			PreparedStatement statement;
			statement = conn.prepareStatement(sql);
			statement.setString(1, makh);
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
	
	public static List<KhachHang> TatCaKhachHang(Connection conn){
		
		List<KhachHang> list = new ArrayList<KhachHang>();
		String sql = "select * from khachhang";
		Statement statement;
		try {
			statement = conn.createStatement();
			ResultSet rs = statement.executeQuery(sql);
			while(rs.next()) {
				String makh = rs.getString("MaKhachHang");
				String ten = rs.getString("HoTen");
				String mail = rs.getString("Email");
				String sdt = rs.getString("SDT");
				String diachi = rs.getString("DiaChi");
				KhachHang kh = new KhachHang(makh, ten, mail, sdt, diachi);
				list.add(kh);
			}
			rs.close();
			statement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
}
