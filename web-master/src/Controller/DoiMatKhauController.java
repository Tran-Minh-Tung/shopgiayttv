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

import BEAN.Users;
import DAO.UsersDAO;
import DB.DBConnection;

@WebServlet("/DoiMatKhauController")
public class DoiMatKhauController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public DoiMatKhauController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		HttpSession session = request.getSession();
		if(session.getAttribute("login")!=null) {
			RequestDispatcher rd = request.getRequestDispatcher("change-password.jsp");
			rd.forward(request, response);
		} else {
			response.sendRedirect("DangNhapController");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		Connection conn = DBConnection.CreateConnection();
		HttpSession session = request.getSession();
		Users user = (Users)session.getAttribute("user");
		String oldpass = request.getParameter("oldpassword");
		String newpass = request.getParameter("password1");
		if(oldpass.contains(user.getPass())) {
			user.setPass(newpass);
			if(UsersDAO.SuaTaiKhoan(conn, user)) 
				request.setAttribute("msgDoiMatKhau", "Đổi mật khẩu thành công");
			else
				request.setAttribute("msgDoiMatKhau", "Đổi mật khẩu thất bại");
			session.setAttribute("user", user);
		} 
		else 
			request.setAttribute("msgDoiMatKhau", "Mật khẩu cũ sai");
		try {
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		doGet(request, response);
	}

}
