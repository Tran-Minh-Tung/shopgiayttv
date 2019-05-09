package Controller;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import BEAN.TinTuc;
import DAO.TinTucDAO;
import DB.DBConnection;


@WebServlet("/SuaTinTucController")
@MultipartConfig(fileSizeThreshold=1024*1024*2, // 2MB
maxFileSize=1024*1024*10,      // 10MB
maxRequestSize=1024*1024*50)   // 50MB
public class SuaTinTucController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String SAVE_DIR = "C:\\Users\\Admin\\git\\ShopGiay\\WebContent\\";
	private static final String SAVE_DIR1 = "img/blog";
   
    public SuaTinTucController() {
        super();
       
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
        response.sendRedirect("Home");
	}
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8"); 
		 String action = request.getParameter("action");
		 if(action==null)
			 ShowTinTuc(request, response);
		 else {
			 if(action.contains("Update"))	
				 UpdateTinTuc(request, response);
		 }
		
			
	}
	private void ShowTinTuc(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		Connection conn=DBConnection.CreateConnection();
        int MaTinTuc=Integer.parseInt(request.getParameter("MaTinTuc"));
        BEAN.TinTuc qltt=TinTucDAO.LayTinTuc(MaTinTuc, conn);
        RequestDispatcher rd=request.getRequestDispatcher("suaTT.jsp");
        request.setAttribute("tttt", qltt);
        rd.forward(request, response);
        try {
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	private void UpdateTinTuc(HttpServletRequest request, HttpServletResponse response)  throws ServletException, IOException 
	{
		request.setCharacterEncoding("UTF-8");
	 	Connection conn=DBConnection.CreateConnection();
	 	int MaTinTuc=Integer.parseInt(request.getParameter("MaTinTuc"));
        String TieuDe=request.getParameter("TieuDe");
        String NoiDung=request.getParameter("NoiDung");
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
        TinTuc qltt=TinTucDAO.LayTinTuc(MaTinTuc, conn);
        qltt.setTieuDe(TieuDe);
        qltt.setNoiDung(NoiDung);
        if(HinhAnh.length()>1)
        	qltt.setHinhAnh(SAVE_DIR1+"/"+HinhAnh);
        
       boolean kt= TinTucDAO.SuaTinTuc(qltt, conn);
       try {
		conn.close();
	} catch (SQLException e) {
		e.printStackTrace();
	}
	       if(kt)
	       {
	    	   request.setAttribute("msgSuaTinTuc", "Sửa tin tức thành công");
	    	   RequestDispatcher rd = request.getRequestDispatcher("QLTTController");
	  			rd.forward(request, response);
	       }
	       else
	       {
	    	   request.setAttribute("msgSuaTinTuc", "Sửa tin tức thất bại");
	    	   RequestDispatcher rd = request.getRequestDispatcher("QLTTController");
	  			rd.forward(request, response);
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
