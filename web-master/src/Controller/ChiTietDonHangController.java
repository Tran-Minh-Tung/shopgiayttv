package Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import BEAN.ChiTietDonHang;
import java.util.*;
import DAO.DonHangDAO;
import DB.DBConnection;

@WebServlet("/ChiTietDonHangController")
public class ChiTietDonHangController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ChiTietDonHangController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		Connection conn = DBConnection.CreateConnection();
		String madh = request.getParameter("madh");
		List<ChiTietDonHang> list = DonHangDAO.LayChiTietDonHang(conn, madh);
		request.setAttribute("listctdh", list);
		request.setAttribute("tongtien", DonHangDAO.TongTienDonHang(conn, madh));
		RequestDispatcher rd = request.getRequestDispatcher("details-order.jsp");
		rd.forward(request, response);
		try {
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
