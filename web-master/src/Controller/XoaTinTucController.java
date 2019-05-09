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
import DAO.TinTucDAO;
import DB.DBConnection;


@WebServlet("/XoaTinTucController")
public class XoaTinTucController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public XoaTinTucController() {
        super();
      
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		if(session.getAttribute("quyen")==null) {
			response.sendRedirect("Home");
		} else {
			if(((Quyen)session.getAttribute("quyen")).getSanPham()==1 || ((Quyen)session.getAttribute("quyen")).getAdmin()==1) {
				Connection conn=DBConnection.CreateConnection();
				int MaTinTuc=Integer.parseInt(request.getParameter("MaTinTuc"));
				boolean kt=TinTucDAO.DeleteTinTuc(MaTinTuc, conn);
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
				if(kt)
			       {
			    	   request.setAttribute("msgXoaTinTuc", "Xóa thành công");
			    	   RequestDispatcher rd = request.getRequestDispatcher("QLTTController");
			  			rd.forward(request, response);
			       }
			       else
			       {
			    	   request.setAttribute("msgXoaTinTuc", "Xóa thất bại");
			    	   RequestDispatcher rd = request.getRequestDispatcher("QLTTController");
			  			rd.forward(request, response);
			       }
			}
			else
				response.sendRedirect("DangXuatController");
		}
	}

}
