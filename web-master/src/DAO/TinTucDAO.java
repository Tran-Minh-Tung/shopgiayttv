package DAO;

import java.util.*;
import java.sql.*;
import BEAN.*;

public class TinTucDAO {
	public static boolean ThemTinTuc(TinTuc qltt, Connection conn)
	{
	
		String sqlStr ="insert into tintuc(MaTinTuc,TieuDe,NoiDung,HinhAnh) values (?, ?, ?, ?)";
		PreparedStatement ptmt=null;
		try {
			ptmt=conn.prepareStatement(sqlStr);
			
			ptmt.setInt(1, qltt.getMaTinTuc());
			ptmt.setString(2, qltt.getTieuDe());
			ptmt.setString(3, qltt.getNoiDung());
			ptmt.setString(4, qltt.getHinhAnh());
			
			if(ptmt.executeUpdate()!=0)
			{
				ptmt.close();
				return true;
			}
			
			ptmt.close();
					
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return false;

			
	}
	public static boolean SuaTinTuc(TinTuc qltt, Connection conn)
	{
		
	        boolean	update = false;
	       String  sqlStr="Update tintuc set TieuDe= ?, NoiDung= ? , HinhAnh= ? where MaTinTuc= ? ";
	       
	        PreparedStatement ptmt =null;
	        try {
	        	
	        	ptmt=conn.prepareStatement(sqlStr);
				
				ptmt.setInt(4, qltt.getMaTinTuc());
				ptmt.setString(1, qltt.getTieuDe());
				ptmt.setString(2, qltt.getNoiDung());
				ptmt.setString(3, qltt.getHinhAnh());
				
				update=ptmt.executeUpdate()>0;
				ptmt.close();
			}  catch (SQLException e) {
				e.printStackTrace();
			}
	        
	        return update;

	}
	public static boolean DeleteTinTuc(int MaTinTuc,Connection conn)
	{
		String sqlStr="Delete from tintuc where MaTinTuc= ?";
		PreparedStatement ptmt=null;
		boolean delete=false;
		try {
			
			ptmt=conn.prepareStatement(sqlStr);
			ptmt.setInt(1,MaTinTuc);
			delete=ptmt.executeUpdate()>0;
			ptmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return delete;
	}
	public static TinTuc LayTinTuc(int MaTinTuc,Connection conn)
	{
		TinTuc qltt=null;
		String sqlStr="Select * from tintuc Where MaTinTuc=?";
		PreparedStatement ptmt=null;
		
		try {
			ptmt=conn.prepareStatement(sqlStr);
			
			ptmt.setInt(1,MaTinTuc);
			
			ResultSet rs=ptmt.executeQuery();
			
			if(rs.next())
			{
				String TieuDe=rs.getString("TieuDe");
				String NoiDung=rs.getString("NoiDung");
				String HinhAnh=rs.getString("HinhAnh");
				
				qltt=new TinTuc(MaTinTuc,TieuDe,NoiDung,HinhAnh);
				rs.close();
				return qltt;
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return qltt;
		
	}
	
	public static List<TinTuc> PhanTrang(Connection conn, int page){
		List<TinTuc> list = new ArrayList<TinTuc>();
		String sql = "select * from tintuc order by MaTinTuc desc limit ?, ?";
		PreparedStatement statement;
		try {
			statement = conn.prepareStatement(sql);
			statement.setInt(1, (page-1)*6);
			statement.setInt(2, (page-1)*6+6);
			ResultSet rs = statement.executeQuery();
			while(rs.next()) {
				int matt = rs.getInt("MaTinTuc");
				String tieude = rs.getNString("TieuDe");
				String nd = rs.getNString("NoiDung");
				String hinh = rs.getNString("HinhAnh");
				TinTuc tintuc = new TinTuc(matt, tieude, nd, hinh);
				list.add(tintuc);
			}
			rs.close();
			statement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	public static List<TinTuc> TatCaTinTuc(Connection conn){
		List<TinTuc> list = new ArrayList<TinTuc>();
		List<TinTuc> listtt = new ArrayList<TinTuc>();
		
		String sql = "SELECT * FROM tintuc";
		Statement statement;
		try {
			statement = conn.createStatement();
			ResultSet rs = statement.executeQuery(sql);
			while (rs.next())
			{
				int matt = rs.getInt("MaTinTuc");
				String tieude = rs.getNString("TieuDe");
				String nd = rs.getNString("NoiDung");
				String hinh = rs.getNString("HinhAnh");
				TinTuc tt= new TinTuc(matt, tieude, nd, hinh);
				list.add(tt);
			}
			rs.close();
			statement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		ListIterator<TinTuc> itr = list.listIterator();
		while(itr.hasNext())
		{
			itr.next();
		}
		while (itr.hasPrevious()) {
			listtt.add(itr.previous());
        }
		return listtt;
	}
	public static List<TinTuc> TinTucNoiBac(Connection conn){
		List<TinTuc> list = TatCaTinTuc(conn);
		List<TinTuc> listtt = new ArrayList<TinTuc>();
		for(TinTuc tt : list)
		{
			listtt.add(tt);
			if(listtt.size()>=3)
				return listtt;
		}
		return listtt;
	}
	public static TinTuc ChiTietTinTuc(Connection conn, int matt) {
		TinTuc tintuc;
		String sql = "SELECT * FROM tintuc WHERE MaTinTuc=?";
		try {
			PreparedStatement statement = conn.prepareStatement(sql);
			statement.setInt(1, matt);
			ResultSet rs = statement.executeQuery();
			if(rs.next()) {
				String tieude = rs.getNString("TieuDe");
				String nd = rs.getNString("NoiDung");
				String hinh = rs.getNString("HinhAnh");
				tintuc = new TinTuc(matt, tieude, nd, hinh);
				rs.close();
				statement.close();
				return tintuc;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
}
