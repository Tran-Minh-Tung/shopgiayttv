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

import BEAN.Quyen;
import DAO.*;

import DB.DBConnection;

@WebServlet("/XoaCTSPController")
public class XoaCTSPController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public XoaCTSPController() {
        super();
       
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		if(session.getAttribute("quyen")==null) {
			response.sendRedirect("Home");
		} else {
			if(((Quyen)session.getAttribute("quyen")).getSanPham()==1 || ((Quyen)session.getAttribute("quyen")).getAdmin()==1) {
				Connection conn=DBConnection.CreateConnection();
				String MaSanPham=request.getParameter("MaSanPham");
				int Size=Integer.parseInt(request.getParameter("Size"));		
				boolean kt=SanPhamDAO.DeleteChiTietSanPham(MaSanPham, Size, conn);	
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
				  if(kt)
			        {
			     	   request.setAttribute("msgXoaCTSP", "Xóa thành công");
			     	   RequestDispatcher rd = request.getRequestDispatcher("ChiTietSanPhamController?MaSanPham="+MaSanPham);
			   			rd.forward(request, response);
			        }
			        else
			        {
			        	request.setAttribute("msgThemCTSP", "Xóa thất bại");
			     	   RequestDispatcher rd = request.getRequestDispatcher("ChiTietSanPhamController?MaSanPham="+MaSanPham);
			   			rd.forward(request, response);
			        }
				
			}
			else
				response.sendRedirect("DangXuatController");
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
