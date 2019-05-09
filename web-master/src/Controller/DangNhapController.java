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

import BEAN.*;
import DAO.*;
import DB.DBConnection;

@WebServlet("/DangNhapController")
public class DangNhapController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public DangNhapController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		Connection conn = DBConnection.CreateConnection();
		String username = request.getParameter("username");
		String pass = request.getParameter("password");
		Users user = UsersDAO.KiemTraTaiKhoan(conn, username, pass);
		if(user!=null  && user.getQuyen()==1) {
			HttpSession session = request.getSession();
			session.setAttribute("login", "true");
			KhachHang khachhang = KhachHangDAO.LayKhachHang(conn, username);
			session.setAttribute("khachhang", khachhang);
			session.setAttribute("user", user);
			if(session.getAttribute("giohang")==null) {
				DonHang giohang = DonHangDAO.LayGioHang(conn, username);
				if(giohang!=null) {
					session.setAttribute("giohang", giohang);
				}
			} else {
				DonHang giohang = (DonHang)session.getAttribute("giohang");
				DonHang giohanguser = DonHangDAO.LayGioHang(conn, username);
				if(giohanguser!=null) {
					List<ChiTietDonHang> list = giohanguser.getListCTDH();
					for(ChiTietDonHang ct: giohang.getListCTDH()) {
						DonHangDAO.XoaChiTietDonHang(conn, ct.getMaChiTietDonHang());
						ct.setMaDonHang(giohanguser.getMaDonHang());
						list.add(ct);
						DonHangDAO.ThemChiTietDonHang(conn, ct);
					}
					DonHangDAO.XoaDonHang(conn, giohang.getMaDonHang());
					giohanguser.setTongSanPham(DonHangDAO.TongSanPham(conn, giohanguser.getMaDonHang()));
					session.setAttribute("giohang", giohanguser);
				} else {
					giohang.setMaNguoiDat(username);
					DonHangDAO.SuaDonHang(conn, giohang);
					session.setAttribute("giohang", giohang);
				}
			}
//			response.sendRedirect("TaiKhoanController");
			if(request.getParameter("thaotac")!=null) {
				response.sendRedirect("DatHangController");
			}
			else {
				response.sendRedirect("TaiKhoanController");
			}
		}
		else
		{
			RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
			rd.forward(request, response);
		}
		try {
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
