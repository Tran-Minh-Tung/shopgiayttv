package DAO;

import java.sql.*;
import java.util.*;
import BEAN.Quyen;


public class QuyenDAO {

	public static boolean ThemQuyen(Connection conn, int ad, int kh, int sp, int dh, int tt, String mieuta) {
		String sql = "insert into quyen (Admin, KhachHang, SanPham, DonHang, TinTuc, MieuTa) values (?, ?, ?, ?, ?, ?)";
		PreparedStatement statement;
		try {
			statement = conn.prepareStatement(sql);
			statement.setInt(1, ad);
			statement.setInt(2, kh);
			statement.setInt(3, sp);
			statement.setInt(4, dh);
			statement.setInt(5, tt);
			statement.setString(6, mieuta);
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
	public static boolean SuaQuyen(Connection conn, Quyen q) {
		String sql = "update quyen set Admin = ?, KhachHang = ?, SanPham = ?, DonHang = ?, TinTuc = ?, MieuTa = ? where IDQuyen = ?";
		PreparedStatement statement;
		try {
			statement = conn.prepareStatement(sql);
			statement.setInt(1, q.getAdmin());
			statement.setInt(2, q.getKhachHang());
			statement.setInt(3, q.getSanPham());
			statement.setInt(4, q.getDonHang());
			statement.setInt(5, q.getTinTuc());
			statement.setString(6, q.getMieuTa());
			statement.setInt(7, q.getMaQuyen());
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
	public static void XoaQuyen(Connection conn, int maquyen) {
		String sql = "delete from quyen where IDQuyen = ?";
		PreparedStatement statement;
		try {
			statement = conn.prepareStatement(sql);
			statement.setInt(1, maquyen);
			statement.executeUpdate();
			statement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}	
	}
	public static Quyen LayQuyen(Connection conn, int maquyen) {
		String sql = "select * from quyen where IDQuyen = ?";
		PreparedStatement statement;
		try {
			statement = conn.prepareStatement(sql);
			statement.setInt(1, maquyen);
			ResultSet rs = statement.executeQuery();
			if (rs.next())
			{
				int ad = rs.getInt("Admin");
				int kh = rs.getInt("KhachHang");
				int sp = rs.getInt("SanPham");
				int dh = rs.getInt("DonHang");
				int tt = rs.getInt("TinTuc");
				String mt = rs.getString("MieuTa");
				Quyen q = new Quyen(maquyen, ad, kh, sp, dh, tt, mt);
				rs.close();
				statement.close();
				return q;
			}
			rs.close();
			statement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}	
		return null;
	}
	
	public static List<Quyen> TatCaQuyen(Connection conn) {
		
		List<Quyen> list = new ArrayList<Quyen>();
		String sql = "select * from quyen";
		Statement statement;
		try {
			statement = conn.createStatement();
			ResultSet rs = statement.executeQuery(sql);
			while (rs.next())
			{
				int maquyen = rs.getInt("IDQuyen");
				int ad = rs.getInt("Admin");
				int kh = rs.getInt("KhachHang");
				int sp = rs.getInt("SanPham");
				int dh = rs.getInt("DonHang");
				int tt = rs.getInt("TinTuc");
				String mt = rs.getString("MieuTa");
				Quyen q = new Quyen(maquyen, ad, kh, sp, dh, tt, mt);
				list.add(q);
			}
			rs.close();
			statement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}	
		return list;
	}
}
