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

import java.util.*;
import DAO.*;
import BEAN.*;
import DB.DBConnection;


@WebServlet("/XoaSanPhamController")
public class XoaSanPhamController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public XoaSanPhamController() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		if(session.getAttribute("quyen")==null) {
			response.sendRedirect("Home");
		} else {
			if(((Quyen)session.getAttribute("quyen")).getSanPham()==1 || ((Quyen)session.getAttribute("quyen")).getAdmin()==1) {
				Connection conn=DBConnection.CreateConnection();
				String MaSanPham=request.getParameter("MaSanPham");
				List<Comment> listcm = CommentDAO.DanhSachBinhLuan(conn, MaSanPham);
				for(Comment cm : listcm) {
					CommentDAO.XoaBinhLuan(conn, cm.getMaComment());
				}
				List<ChiTietSanPham> listctsp = SanPhamDAO.ChiTietSanPham(conn, MaSanPham);
				for(ChiTietSanPham ctsp : listctsp) {
					SanPhamDAO.DeleteChiTietSanPham(MaSanPham, ctsp.getSize(), conn);
				}
				boolean kt=SanPhamDAO.DeleteSanPham(MaSanPham, conn);	
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
				if(kt)
				{
					request.setAttribute("msgXoaSanPham", "Xóa thành công");
					RequestDispatcher rd = request.getRequestDispatcher("QLSPController");
		  			rd.forward(request, response);
				}
				else
				{
					request.setAttribute("msgXoaSanPham", "Xóa thất công");
					RequestDispatcher rd = request.getRequestDispatcher("QLSPController");
		  			rd.forward(request, response);
				}
			}
			else
				response.sendRedirect("DangXuatController");
		}
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
