package Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import DAO.DonHangDAO;
import DB.DBConnection;
import BEAN.*;
import java.sql.*;
import java.util.*;

@WebServlet("/DonHangController")
public class DonHangController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public DonHangController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		Connection conn = DBConnection.CreateConnection();
		HttpSession session = request.getSession();
		if(session.getAttribute("login")!=null) {
			String makh = ((Users)session.getAttribute("user")).getId();
			List<DonHang> list = DonHangDAO.LayDonHangNguoiDung(conn, makh);
			request.setAttribute("listdh", list);
			RequestDispatcher rd = request.getRequestDispatcher("history.jsp");
			rd.forward(request, response);
		}
		else {
			response.sendRedirect("DangNhapController");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Connection conn = DBConnection.CreateConnection();
		String madh = request.getParameter("madh");
		HttpSession session = request.getSession();
		DonHang giohang = (DonHang)session.getAttribute("giohang");
		Users user = (Users)session.getAttribute("user");
		List<ChiTietDonHang> list = DonHangDAO.LayChiTietDonHang(conn, madh);
		if(giohang!=null) {
			List<ChiTietDonHang> listgiohang = DonHangDAO.LayChiTietDonHang(conn, giohang.getMaDonHang());
			for(ChiTietDonHang ct:list) {
				DonHangDAO.XoaChiTietDonHang(conn, ct.getMaChiTietDonHang());
				ct.setMaDonHang(giohang.getMaDonHang());
				DonHangDAO.ThemChiTietDonHang(conn, ct);
				listgiohang.add(ct);
			}
			giohang.setListCTDH(listgiohang);
			DonHangDAO.SuaDonHang(conn, giohang);
		} else {
			giohang = new DonHang(user.getId(), "chưa đặt");
			DonHangDAO.ThemDonHang(conn, giohang);
			for(ChiTietDonHang ct:list) {
				DonHangDAO.XoaChiTietDonHang(conn, ct.getMaChiTietDonHang());
				ct.setMaDonHang(giohang.getMaDonHang());
				DonHangDAO.ThemChiTietDonHang(conn, ct);
			}
			giohang.setListCTDH(list);
		}
		giohang.setTongSanPham(DonHangDAO.TongSanPham(conn, giohang.getMaDonHang()));
		giohang.setTongTien(DonHangDAO.TongTienDonHang(conn, giohang.getMaDonHang()));
		session.setAttribute("giohang", giohang);
		DonHangDAO.XoaDonHang(conn, madh);
		try {
			conn.close();
			response.getWriter().write(String.valueOf(giohang.getTongSanPham()));
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		catch (IOException e) {
			e.printStackTrace();
		}
	
	}

}
