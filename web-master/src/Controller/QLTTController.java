package Controller;

import java.io.IOException;
import java.sql.Connection;
import java.util.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import BEAN.Quyen;
import DAO.TinTucDAO;
import DB.*;



@WebServlet("/QLTTController")
public class QLTTController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public QLTTController() {
        super();
      
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		HttpSession session = request.getSession();
		if(session.getAttribute("quyen")==null) {
			response.sendRedirect("Home");
		} else {
			if(((Quyen)session.getAttribute("quyen")).getTinTuc()==1 || ((Quyen)session.getAttribute("quyen")).getAdmin()==1)
				ListTinTuc(request, response);
			else
				response.sendRedirect("DangXuatController");
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	
	private void ListTinTuc(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		Connection conn=DBConnection.CreateConnection();
		List<BEAN.TinTuc>list=TinTucDAO.TatCaTinTuc(conn);
		request.setAttribute("listQLTT", list);
		RequestDispatcher rd=request.getRequestDispatcher("QLTT.jsp");
		rd.forward(request, response);
	}
}
