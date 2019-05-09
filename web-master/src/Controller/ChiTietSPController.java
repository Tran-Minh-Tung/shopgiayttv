package Controller;

import java.io.IOException;
import java.sql.*;
import java.util.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.CommentDAO;
import DAO.SanPhamDAO;
import DB.DBConnection;
import BEAN.*;

@WebServlet("/ChiTietSPController")
public class ChiTietSPController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ChiTietSPController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		Connection conn = DBConnection.CreateConnection();
		String masp = request.getParameter("masp");
		SanPham sp = SanPhamDAO.LaySanPham(conn, masp);
		List<ChiTietSanPham> ctsp = SanPhamDAO.ChiTietSanPham(conn, masp);
		if(sp !=null && ctsp.size() >0) {
			request.setAttribute("sanpham", sp);
			request.setAttribute("chitiet", ctsp);
			if(session.getAttribute("user")!=null) {
				String makh = ((Users)session.getAttribute("user")).getId();
				request.setAttribute("makh", makh);
			}
			List<Comment> listcm = CommentDAO.DanhSachBinhLuan(conn, masp);
			request.setAttribute("listcm", listcm);
			RequestDispatcher rd = request.getRequestDispatcher("single-product.jsp");
			rd.forward(request, response);
		}
		else
		{
			request.setAttribute("msgChiTietSP", "1");
			RequestDispatcher rd = request.getRequestDispatcher("SanPhamController");
			rd.forward(request, response);
		}
		try {
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String thaotac = request.getParameter("thaotac");
		switch (thaotac) {
		case "ThemBinhLuan":
			ThemBinhLuan(request, response);
			break;
		case "XoaBinhLuan":
			XoaBinhLuan(request, response);
			break;
		default:
			break;
		}
	}
	
	public void ThemBinhLuan(HttpServletRequest request, HttpServletResponse response) {
		
		Connection conn = DBConnection.CreateConnection();
		String makh = request.getParameter("makh");
		String nd = request.getParameter("nd");
		String masp = request.getParameter("masp");
		Comment cm = new Comment(masp, makh, nd);
		CommentDAO.ThemBinhLuan(conn, cm);
		try {
			request.setAttribute("makh", makh);
			request.setAttribute("nd", nd);
			request.setAttribute("macm", cm.getMaComment());
			RequestDispatcher rd = request.getRequestDispatcher("comment.jsp");
			rd.forward(request, response);
		} catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public void XoaBinhLuan(HttpServletRequest request, HttpServletResponse response) {
		
		Connection conn = DBConnection.CreateConnection();
		String macm = request.getParameter("macm");
		CommentDAO.XoaBinhLuan(conn, macm);
	}
}
