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
import javax.servlet.http.Part;
import java.io.File;
import javax.servlet.annotation.MultipartConfig;

import BEAN.*;
import DAO.TinTucDAO;
import DB.DBConnection;



@WebServlet("/ThemTinTucController")
@MultipartConfig(fileSizeThreshold=1024*1024*2, // 2MB
maxFileSize=1024*1024*10,      // 10MB
maxRequestSize=1024*1024*50)   // 50MB
public class ThemTinTucController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String SAVE_DIR = "C:\\Users\\Admin\\git\\ShopGiay\\WebContent\\";
	private static final String SAVE_DIR1 = "img/blog";
    public ThemTinTucController() {
        super();
       
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		if(session.getAttribute("quyen")==null)
			response.sendRedirect("Home");
		else {
			if(((Quyen)session.getAttribute("quyen")).getTinTuc()==1 || ((Quyen)session.getAttribute("quyen")).getAdmin()==1) {
				RequestDispatcher rd = request.getRequestDispatcher("themTT.jsp");
				rd.forward(request, response);
			} else {
				response.sendRedirect("DangNhapAdminController");
			}
		}
		
	}

	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		Connection conn = DBConnection.CreateConnection();
		String appPath = request.getServletContext().getRealPath("");
		String savePath = appPath + File.separator + SAVE_DIR1;
		String savePath1 = SAVE_DIR + SAVE_DIR1;
		File fileSaveDir = new File(savePath);
        if (!fileSaveDir.exists()) {
            fileSaveDir.mkdir();
        }
        String HinhAnh = "";
        for (Part part : request.getParts()) {
        	HinhAnh = extractFileName(part);
        	HinhAnh = new File(HinhAnh).getName();
            if(HinhAnh.length()>1) {
            	part.write(savePath + File.separator + HinhAnh);
            	part.write(savePath1 + File.separator + HinhAnh);
            }
            	
        }
        String TieuDe=request.getParameter("TieuDe");
        String NoiDung=request.getParameter("NoiDung");
        TinTuc qltt=new TinTuc();
        qltt.setTieuDe(TieuDe);
        qltt.setNoiDung(NoiDung);
        qltt.setHinhAnh(SAVE_DIR1+"/"+HinhAnh);
        
       boolean kt= TinTucDAO.ThemTinTuc(qltt, conn);
       if(kt)
       {
    	   request.setAttribute("msgThemTinTuc", "Thêm thành công");
    	   RequestDispatcher rd = request.getRequestDispatcher("QLTTController");
  			rd.forward(request, response);
       }
       else
       {
    	   request.setAttribute("msgThemTinTuc", "Thêm thất bại");
    	   RequestDispatcher rd = request.getRequestDispatcher("QLTTController");
  			rd.forward(request, response);
       }
        
		try {
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	private String extractFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                return s.substring(s.indexOf("=") + 2, s.length()-1);
            }
        }
        return "";
    }
}