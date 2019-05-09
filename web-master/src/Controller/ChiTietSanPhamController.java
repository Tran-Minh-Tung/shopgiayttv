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


@WebServlet("/ChiTietSanPhamController")
public class ChiTietSanPhamController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public ChiTietSanPhamController() {
        super();
       
    }

	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		HttpSession session = request.getSession();
		if(session.getAttribute("quyen")==null) {
			response.sendRedirect("Home");
		} else {
			if(((Quyen)session.getAttribute("quyen")).getSanPham()==1 || ((Quyen)session.getAttribute("quyen")).getAdmin()==1) {
				Connection conn = DBConnection.CreateConnection();
				String MaSanPham=request.getParameter("MaSanPham");
				SanPham qlsp=SanPhamDAO.LaySanPham(conn, MaSanPham);
				List<ChiTietSanPham> ctsp=SanPhamDAO.ChiTietSanPham(conn, MaSanPham);
				request.setAttribute("ThongTinSanPham",qlsp);
				request.setAttribute("ThongTinChiTietSanPham", ctsp);
				RequestDispatcher rd = request.getRequestDispatcher("chiTietSLSP.jsp");
				rd.forward(request, response);
			} else {
				response.sendRedirect("DangNhapAdminController");
			}
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
