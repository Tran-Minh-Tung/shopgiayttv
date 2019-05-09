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

import DB.DBConnection;
import DAO.TinTucDAO;
import BEAN.TinTuc;

@WebServlet("/ChiTietTTController")
public class ChiTietTTController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ChiTietTTController() {
        super();
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		Connection conn = DBConnection.CreateConnection();
		int matt = Integer.parseInt(request.getParameter("matt"));
		TinTuc tintuc = TinTucDAO.ChiTietTinTuc(conn, matt);
		request.setAttribute("blog", tintuc);
		RequestDispatcher rd = request.getRequestDispatcher("single-blog.jsp");
		rd.forward(request, response);
		try {
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
