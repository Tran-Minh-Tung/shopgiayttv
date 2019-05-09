package Controller;

import java.io.IOException;
import java.sql.Connection;
import java.util.List;

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

@WebServlet("/QLKHController")
public class QLKHController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public QLKHController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		HttpSession session = request.getSession();
		if(session.getAttribute("quyen")==null)
			response.sendRedirect("Home");
		else {
			if(((Quyen)session.getAttribute("quyen")).getKhachHang()==1 || ((Quyen)session.getAttribute("quyen")).getAdmin()==1) {
				Connection conn = DBConnection.CreateConnection();
					List<KhachHang> list = KhachHangDAO.TatCaKhachHang(conn);
					request.setAttribute("listkh", list);
					RequestDispatcher rd = request.getRequestDispatcher("QLKH.jsp");
					rd.forward(request, response);
			} else {
				response.sendRedirect("DangXuatController");
			}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		Connection conn = DBConnection.CreateConnection();
		String makh = request.getParameter("makh");
		KhachHangDAO.XoaKhachHang(conn, makh);
		UsersDAO.XoaTaiKhoan(conn, makh);
	}

}
