package Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.sql.*;
import BEAN.*;
import DAO.DonHangDAO;
import DB.DBConnection;

@WebServlet("/DatHangController")
public class DatHangController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public DatHangController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		if(session.getAttribute("giohang")!=null) {
			DonHang giohang = (DonHang)session.getAttribute("giohang");
			request.setAttribute("giohang", giohang);
		}
		if(session.getAttribute("login")!=null) {
			String dangnhap = (String)session.getAttribute("login");
			KhachHang khachhang = (KhachHang)session.getAttribute("khachhang");
			request.setAttribute("dangnhap", dangnhap);
			request.setAttribute("khachhang", khachhang);
		}
		RequestDispatcher rd = request.getRequestDispatcher("order.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		Connection conn = DBConnection.CreateConnection();
		String madh = request.getParameter("madh");
		HttpSession session = request.getSession();
		KhachHang khachhang= (KhachHang)session.getAttribute("khachhang");
		int tongtien = DonHangDAO.TongTienDonHang(conn, madh);
		DonHang dh = new DonHang(madh, java.sql.Date.valueOf(java.time.LocalDate.now()), khachhang.getMaKhachHang(), tongtien, "Đã đặt");
		DonHangDAO.SuaDonHang(conn, dh);
		session.removeAttribute("giohang");
		try {
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
