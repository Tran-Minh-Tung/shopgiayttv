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

@WebServlet("/QLNVController")
public class QLNVController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public QLNVController() {
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
					List<NhanVien> list = NhanVienDAO.TatCaNV(conn);
					request.setAttribute("listnv", list);
					RequestDispatcher rd = request.getRequestDispatcher("QLNV.jsp");
					rd.forward(request, response);
				}
				else {
					if(thaotac.contains("them")) {
						List<Quyen> list = QuyenDAO.TatCaQuyen(conn);
						request.setAttribute("listq", list);
						RequestDispatcher rd = request.getRequestDispatcher("addNV.jsp");
						rd.forward(request, response);
					} else {
						String manv = request.getParameter("manv");
						if(manv.contains("admin")==false) {
							NhanVien nv = NhanVienDAO.LayNV(conn, manv);
							Users user = UsersDAO.LayTaiKhoan(conn, manv);
							List<Quyen> list = QuyenDAO.TatCaQuyen(conn);
							request.setAttribute("nv", nv);
							request.setAttribute("pass", user.getPass());
							request.setAttribute("listq", list);
							RequestDispatcher rd = request.getRequestDispatcher("fixNV.jsp");
							rd.forward(request, response);
						} else {
							List<NhanVien> list = NhanVienDAO.TatCaNV(conn);
							request.setAttribute("listnv", list);
							RequestDispatcher rd = request.getRequestDispatcher("QLNV.jsp");
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
		case "them":
			ThemNV(request, response);
			break;
		case "sua":
			SuaNV(request, response);
			break;
		case "xoa":
			XoaNV(request, response);
			break;
		default:
			break;
		}
	}
	
	public void ThemNV(HttpServletRequest request, HttpServletResponse response) {
		
		Connection conn = DBConnection.CreateConnection();
		int maquyen=Integer.parseInt(request.getParameter("maquyen"));
		String username = request.getParameter("username");
		String pass = request.getParameter("password1");
		String ten = request.getParameter("name");
		String sdt = request.getParameter("phone");
		String mail = request.getParameter("mail");
		if(UsersDAO.ThemTaiKhoan(conn, new Users(username, pass, 0))) {
			Quyen q = new Quyen(maquyen);
			NhanVien nv = new NhanVien(username, ten, sdt, mail, q);
			NhanVienDAO.ThemNhanVien(conn, nv);
			try {
				doGet(request, response);
			} catch (ServletException | IOException e) {
				e.printStackTrace();
			}
		}
		else {
			request.setAttribute("msg", "Tài khoản đã tồn tại");
			RequestDispatcher rd = request.getRequestDispatcher("addNV.jsp");
			try {
				rd.forward(request, response);
			} catch (ServletException | IOException e) {
				e.printStackTrace();
			}
		}
	}
	
	public void SuaNV(HttpServletRequest request, HttpServletResponse response) {
		
		Connection conn = DBConnection.CreateConnection();
		int maquyen = Integer.parseInt(request.getParameter("maquyen"));
		String manv=request.getParameter("manhanvien");
		System.out.println(manv);
		String pass = request.getParameter("password");
		String ten = request.getParameter("name");
		String sdt = request.getParameter("phone");
		String mail = request.getParameter("mail");
		Users user = new Users(manv, pass, 0);
		Quyen q = new Quyen(maquyen);
		NhanVien nv = new NhanVien(manv, ten, sdt, mail, q);
		UsersDAO.SuaTaiKhoan(conn, user);
		NhanVienDAO.SuaNhanVien(conn, nv);
		try {
			doGet(request, response);
		} catch (ServletException | IOException e) {
			e.printStackTrace();
		}
	}

	public void XoaNV(HttpServletRequest request, HttpServletResponse response) {
	
		Connection conn = DBConnection.CreateConnection();
		String id = request.getParameter("id");
		NhanVienDAO.XoaNhanVien(conn, id);
		UsersDAO.XoaTaiKhoan(conn, id);
	}

}
