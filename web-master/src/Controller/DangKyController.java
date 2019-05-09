package Controller;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import BEAN.*;
import DAO.*;
import DB.DBConnection;

import java.sql.*;

@WebServlet("/DangKyController")
public class DangKyController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public DangKyController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		Connection conn = DBConnection.CreateConnection();
		String hoten = request.getParameter("name");
		String email = request.getParameter("email");
		String sdt = request.getParameter("numberphone");
		String diachi = request.getParameter("addresshome");
		String id = request.getParameter("username");
		String pass = request.getParameter("password");
		Users user = new Users(id, pass, 1);
		KhachHang kh = new KhachHang(id, hoten, email, sdt, diachi);
		boolean kt= UsersDAO.ThemTaiKhoan(conn, user);
		if(kt) {
			KhachHangDAO.ThemKhachHang(conn, kh);
			request.setAttribute("msgDangKy", "Ðăng ký thành công");
			request.setAttribute("user", user);
			RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
			rd.forward(request, response);
		}
		else {
			request.setAttribute("msgDangKy", "Tên đăng nhập đã tồn tại");
			RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
			rd.forward(request, response);
		}
		try {
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
