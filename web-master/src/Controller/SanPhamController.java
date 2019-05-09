package Controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import BEAN.SanPham;
import DAO.SanPhamDAO;
import DB.DBConnection;

@WebServlet("/SanPhamController")
public class SanPhamController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SanPhamController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		Connection conn = DBConnection.CreateConnection();
		String th = request.getParameter("thuonghieu");
		String gt = request.getParameter("gioitinh");
		String m = request.getParameter("mau");
		String si = request.getParameter("size");
		String gia = request.getParameter("gia");
		int page = 1;
		if(request.getParameter("page")!=null)
			page=Integer.parseInt(request.getParameter("page"));
		String[] thuonghieu=null;
		String[] gioitinh=null;
		String[] mau=null;
		String[] size=null;
		if(th !=null)
			thuonghieu = th.split(",");
		if(gt !=null)
			gioitinh = gt.split(",");
		if(m !=null)
			mau = m.split(",");
		if(si !=null)
			size = si.split(",");
		List<SanPham> list = SanPhamDAO.LocSanPham(conn, thuonghieu, gioitinh, size, mau, gia);
		String sapxep = request.getParameter("sapxep");
		String msgChiTietSP = (String)request.getAttribute("msgChiTietSP");
		if(sapxep!=null) {
			if(sapxep.contains("low")) 
				list = SanPhamDAO.GiaCaoDan(conn, list);
			else if(sapxep.contains("high")) 
				list = SanPhamDAO.GiaThapDan(conn, list);
		}
		list = SanPhamDAO.PhanTrang(conn, list, page);
		request.setAttribute("list", list);
		request.setAttribute("msgChiTietSP", msgChiTietSP);
		request.setAttribute("page", page);
		RequestDispatcher rd = request.getRequestDispatcher("shop.jsp");
		rd.forward(request, response);
		try {
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		String timkiem = request.getParameter("timkiem");
		if(timkiem!=null || timkiem !="") {
			Connection conn = DBConnection.CreateConnection();
			List<SanPham> list = SanPhamDAO.TimKiemSanPham(conn, timkiem);
			String sapxep = request.getParameter("sapxep");
			if(list!=null) {
				if(sapxep!=null) {
					if(sapxep.contains("low")) 
						list = SanPhamDAO.GiaCaoDan(conn, list);
					else if(sapxep.contains("high")) 
						list = SanPhamDAO.GiaThapDan(conn, list);
				}
				request.setAttribute("list", list);
			} else {
				request.setAttribute("msgChiTietSP", "Sản phẩm bạn tìm không có");
			}
			RequestDispatcher rd = request.getRequestDispatcher("shop.jsp");
			rd.forward(request, response);
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

}
