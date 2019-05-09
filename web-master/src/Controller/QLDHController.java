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

@WebServlet("/QLDHController")
public class QLDHController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public QLDHController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession();
		if(session.getAttribute("quyen")==null)
			response.sendRedirect("Home");
		else {
			if(((Quyen)session.getAttribute("quyen")).getDonHang()==1 || ((Quyen)session.getAttribute("quyen")).getAdmin()==1) {
				Connection conn = DBConnection.CreateConnection();
				String loai = request.getParameter("loai");
				if(loai==null) {
					List<DonHang> list = DonHangDAO.LayDonHang(conn, "Đã đặt");
					request.setAttribute("listdh", list);
					RequestDispatcher rd = request.getRequestDispatcher("QLDH.jsp");
					rd.forward(request, response);
				}
				else {
					if(loai.contains("duyet")) {
						List<DonHang> list = DonHangDAO.LayDonHang(conn, "Đã duyệt");
						request.setAttribute("listdh", list);
						RequestDispatcher rd = request.getRequestDispatcher("QLDH-daHT.jsp");
						rd.forward(request, response);
					} else {
						if(loai.contains("giao")) {
							List<DonHang> list = DonHangDAO.LayDonHang(conn, "Đã giao");
							request.setAttribute("listdh", list);
							RequestDispatcher rd = request.getRequestDispatcher("QLDH-dangGiao.jsp");
							rd.forward(request, response);
						} else {
							String madh = request.getParameter("madh");
							DonHang dh = DonHangDAO.LayDonHangTheoMa(conn, madh);
							KhachHang kh = KhachHangDAO.LayKhachHang(conn, dh.getMaNguoiDat());
							List<ChiTietDonHang> list = DonHangDAO.LayChiTietDonHang(conn, madh);
							request.setAttribute("listctdh", list);
							request.setAttribute("donhang", dh);
							request.setAttribute("khachhang", kh);
							RequestDispatcher rd = request.getRequestDispatcher("xemDH.jsp");
							rd.forward(request, response);
						}
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
		case "duyet":
			DuyetDH(request, response);
			break;
		case "xoa":
			XoaDH(request, response);
			break;
		default:
			break;
		}
	}
	
	public void DuyetDH(HttpServletRequest request, HttpServletResponse response) {
		
		Connection conn = DBConnection.CreateConnection();
		String tinhtrang = request.getParameter("tinhtrang");
		String madh = request.getParameter("madh");
		DonHang dh = DonHangDAO.LayDonHangTheoMa(conn, madh);
		dh.setTinhTrang(tinhtrang);
		DonHangDAO.SuaDonHang(conn, dh);
	}

	public void XoaDH(HttpServletRequest request, HttpServletResponse response) {
		
		Connection conn = DBConnection.CreateConnection();
		String madh = request.getParameter("madh");
		List<ChiTietDonHang> list = DonHangDAO.LayChiTietDonHang(conn, madh);
		for(ChiTietDonHang ct : list) {
			DonHangDAO.XoaChiTietDonHang(conn, ct.getMaChiTietDonHang());
		}
		DonHangDAO.XoaDonHang(conn, madh);
	}
}
