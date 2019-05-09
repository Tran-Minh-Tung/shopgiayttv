package Controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import BEAN.*;
import DAO.*;
import DB.DBConnection;

@WebServlet("/QLTKController")
public class QLTKController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public QLTKController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession();
		if(session.getAttribute("quyen")==null)
			response.sendRedirect("Home");
		else {
			NhanVien nv = (NhanVien)session.getAttribute("nhanvien");
			request.setAttribute("nv", nv);
			RequestDispatcher rd = request.getRequestDispatcher("QLTK.jsp");
			rd.forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		String thaotac=request.getParameter("loai").trim();
		switch (thaotac) {
		case "suathongtin":
			SuaThongTin(request, response);
			break;
		case "doimk":
			DoiMatKhau(request, response);
			break;
		default:
			break;
		}
	}

	public void SuaThongTin(HttpServletRequest request, HttpServletResponse response) {
		
		Connection conn = DBConnection.CreateConnection();
		String hoten = request.getParameter("name");
		String sdt = request.getParameter("phone");
		String email = request.getParameter("mail");
		HttpSession session = request.getSession();
		NhanVien nv = (NhanVien)session.getAttribute("nhanvien");
		nv.setHoTen(hoten);
		nv.setSDT(sdt);
		nv.setEmail(email);
		if(NhanVienDAO.SuaNhanVien(conn, nv)) {
			request.setAttribute("msg", "Sửa tài khoản thành công");
		} else {
			request.setAttribute("msg", "Sửa tài khoản thất bại");
		}
		session.setAttribute("nhanvien", nv);
		try {
			conn.close();
			doGet(request, response);
		} catch (SQLException e) {
			e.printStackTrace();	
		} catch (ServletException e1) {
			e1.printStackTrace();
		} catch (IOException e1) {
			e1.printStackTrace();
		}
	}
	
	public void DoiMatKhau(HttpServletRequest request, HttpServletResponse response) {
		
		Connection conn = DBConnection.CreateConnection();
		HttpSession session = request.getSession();
		Users user = (Users)session.getAttribute("user");
		String oldpass = request.getParameter("oldpassword");
		String newpass = request.getParameter("password1");
		if(oldpass.contains(user.getPass())) {
			user.setPass(newpass);
			if(UsersDAO.SuaTaiKhoan(conn, user)) 
				request.setAttribute("msg", "Đổi mật khẩu thành công");
			else
				request.setAttribute("msg", "Đổi mật khẩu thất bại");
			session.setAttribute("user", user);
		} 
		else 
			request.setAttribute("msg", "Mật khẩu cũ sai");
		try {
			conn.close();
			doGet(request, response);
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ServletException | IOException e) {
			e.printStackTrace();
		}
	}
}
