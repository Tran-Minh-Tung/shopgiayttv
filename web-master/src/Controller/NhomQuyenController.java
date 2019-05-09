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
import java.util.*;
import BEAN.Quyen;
import DB.DBConnection;
import DAO.QuyenDAO;

@WebServlet("/NhomQuyenController")
public class NhomQuyenController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public NhomQuyenController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		if(session.getAttribute("quyen")==null)
			response.sendRedirect("Home");
		else {
			if(((Quyen)session.getAttribute("quyen")).getAdmin()==1) {
				Connection conn = DBConnection.CreateConnection();
				String thaotac = request.getParameter("thaotac");
				if(thaotac==null) {
					List<Quyen> list = QuyenDAO.TatCaQuyen(conn);
					request.setAttribute("listq", list);
					RequestDispatcher rd = request.getRequestDispatcher("nhomQuyen-admin.jsp");
					rd.forward(request, response);
				}
				else {
					if(thaotac.contains("them")) {
						RequestDispatcher rd = request.getRequestDispatcher("addNhomQuyen.jsp");
						rd.forward(request, response);
					} else {
						int maquyen = Integer.parseInt(request.getParameter("maquyen"));
						Quyen q = QuyenDAO.LayQuyen(conn, maquyen);
						request.setAttribute("quyen", q);
						RequestDispatcher rd = request.getRequestDispatcher("fixNhomQuyen.jsp");
						rd.forward(request, response);
					}
				}
			} else {
				response.sendRedirect("DangXuatController");
			}
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		String thaotac=request.getParameter("loai").trim();
		switch (thaotac) {
		case "them":
			ThemNhomQuyen(request, response);
			break;
		case "sua":
			SuaNhomQuyen(request, response);
			break;
		case "xoa":
			XoaNhomQuyen(request, response);
			break;
		default:
			break;
		}
	}

	public void ThemNhomQuyen(HttpServletRequest request, HttpServletResponse response) {
		
		Connection conn = DBConnection.CreateConnection();
		String mieuta=request.getParameter("mieuta");
		int ad=0, kh=0, dh=0, sp=0, tt=0;
		if(request.getParameter("ad")!=null)
			ad=1;
		if(request.getParameter("kh")!=null)
			kh=1;
		if(request.getParameter("dh")!=null)
			dh=1;
		if(request.getParameter("sp")!=null)
			sp=1;
		if(request.getParameter("tt")!=null)
			tt=1;
		if(QuyenDAO.ThemQuyen(conn, ad, kh, sp, dh, tt, mieuta)) {
			try {
				doGet(request, response);
			} catch (ServletException | IOException e) {
				e.printStackTrace();
			}
		} else {
			request.setAttribute("msg", "Thêm thất bại");
			RequestDispatcher rd = request.getRequestDispatcher("addNhomQuyen.jsp");
			try {
				rd.forward(request, response);
			} catch (ServletException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
	
	public void SuaNhomQuyen(HttpServletRequest request, HttpServletResponse response) {
		
		Connection conn = DBConnection.CreateConnection();
		int maquyen = Integer.parseInt(request.getParameter("maquyen"));
		String mieuta=request.getParameter("mieuta");
		int ad=0, kh=0, dh=0, sp=0, tt=0;
		if(request.getParameter("ad")!=null)
			ad=1;
		if(request.getParameter("kh")!=null)
			kh=1;
		if(request.getParameter("dh")!=null)
			dh=1;
		if(request.getParameter("sp")!=null)
			sp=1;
		if(request.getParameter("tt")!=null)
			tt=1;
		Quyen q = new Quyen(maquyen, ad, kh, sp, dh, tt, mieuta);
		QuyenDAO.SuaQuyen(conn, q);
		try {
			doGet(request, response);
		} catch (ServletException | IOException e) {
			e.printStackTrace();
		}
	}

	public void XoaNhomQuyen(HttpServletRequest request, HttpServletResponse response) {
	
		Connection conn = DBConnection.CreateConnection();
		int maquyen = Integer.parseInt(request.getParameter("maquyen"));
		QuyenDAO.XoaQuyen(conn, maquyen);
	}
}
