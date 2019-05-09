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
import DAO.*;
import DB.DBConnection;

@WebServlet("/DangNhapAdminController")
public class DangNhapAdminController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public DangNhapAdminController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		RequestDispatcher rd = request.getRequestDispatcher("login-admin.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		Connection conn = DBConnection.CreateConnection();
		String username = request.getParameter("username");
		String pass = request.getParameter("pass");
		Users user = UsersDAO.KiemTraTaiKhoan(conn, username, pass);
		if(user!=null && user.getQuyen()==0) {
			HttpSession session = request.getSession();
			session.setAttribute("user", user);
			NhanVien nv = NhanVienDAO.LayNV(conn, username);
			session.setAttribute("nhanvien", nv);
			Quyen q = nv.getQuyen();
			session.setAttribute("quyen",q);
			response.sendRedirect("header-admin.jsp");
		} else {
			request.setAttribute("msg", "Tên đăng nhập hoặc mật khẩu không đúng");
			doGet(request, response);
		}
	}

}
