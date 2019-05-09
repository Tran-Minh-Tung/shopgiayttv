package Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import BEAN.*;
import DAO.KhachHangDAO;
import DB.DBConnection;
import java.sql.*;

@WebServlet("/SuaTaiKhoanController")
public class SuaTaiKhoanController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SuaTaiKhoanController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession();
		if(session.getAttribute("login")!=null) {
			KhachHang kh = (KhachHang)session.getAttribute("khachhang");
			request.setAttribute("khachhang", kh);
			RequestDispatcher rd = request.getRequestDispatcher("information.jsp");
			rd.forward(request, response);
		} else {
			response.sendRedirect("DangNhapController");
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		Connection conn = DBConnection.CreateConnection();
		String thaotac = request.getParameter("thaotac");
		String hoten = request.getParameter("name");
		String sdt = request.getParameter("numberphone");
		String diachi = request.getParameter("addresshome");
		String email = request.getParameter("email");
		HttpSession session = request.getSession();
		KhachHang kh = (KhachHang)session.getAttribute("khachhang");
		kh.setHoTen(hoten);
		kh.setSoDienThoai(sdt);
		kh.setDiaChi(diachi);
		if(email!=null)
			kh.setEmail(email);
		boolean f = KhachHangDAO.SuaKhachHang(conn, kh);
		if(thaotac!=null) {
			response.sendRedirect("DatHangController");
		
		} else {
			if(f)
				request.setAttribute("msgSuaTaiKhoan", "Sửa tài khoản thành công");
			else
				request.setAttribute("msgSuaTaiKhoan", "Sửa tài khoản thất bại");
			doGet(request, response);
		}
		session.setAttribute("khachhang", kh);
		try {
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
