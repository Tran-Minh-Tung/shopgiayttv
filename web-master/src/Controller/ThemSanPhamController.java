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
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import BEAN.*;
import DAO.SanPhamDAO;
import DB.DBConnection;


@WebServlet("/ThemSanPhamController")
@MultipartConfig(fileSizeThreshold=1024*1024*2, // 2MB
maxFileSize=1024*1024*10,      // 10MB
maxRequestSize=1024*1024*50)   // 50MB
public class ThemSanPhamController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String SAVE_DIR = "C:\\Users\\Admin\\git\\ShopGiay\\WebContent\\";
	private static final String SAVE_DIR1 = "img/product";
    
    public ThemSanPhamController() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		if(session.getAttribute("quyen")==null)
			response.sendRedirect("Home");
		else {
			if(((Quyen)session.getAttribute("quyen")).getSanPham()==1 || ((Quyen)session.getAttribute("quyen")).getAdmin()==1) {
				RequestDispatcher rd = request.getRequestDispatcher("themSP.jsp");
				rd.forward(request, response);
			} else {
				response.sendRedirect("DangNhapAdminController");
			}
		}
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		Connection conn = DBConnection.CreateConnection();
		String ThuongHieu=request.getParameter("ThuongHieu");
		String MaSanPham=request.getParameter("MaSanPham");
		String TenSanPham=request.getParameter("TenSanPham");
		String MauSac=request.getParameter("MauSac");
		String GioiTinh=request.getParameter("GioiTinh");
		int KhuyenMai=Integer.parseInt(request.getParameter("KhuyenMai"));
		int Gia=Integer.parseInt(request.getParameter("GiaBan"));
		String HinhAnh="";
		int i=1;
		String appPath = request.getServletContext().getRealPath("");
		String savePath = appPath + File.separator + SAVE_DIR1;
		String savePath1 = SAVE_DIR + SAVE_DIR1;
		File fileSaveDir = new File(savePath);
        if (!fileSaveDir.exists()) {
            fileSaveDir.mkdir();
        }
        for (Part part : request.getParts()) {
        	String fileName = extractFileName(part);
        	fileName = new File(fileName).getName();
            if(fileName.length()>1) {
            	if(i==1) {
            		HinhAnh = fileName;
            		part.write(savePath + File.separator + HinhAnh);
                	part.write(savePath1 + File.separator + HinhAnh);
                	i++;
            	} else {
            		String nameIMG = NameIMG(HinhAnh, i);
            		part.write(savePath + File.separator + nameIMG);
                	part.write(savePath1 + File.separator + nameIMG);
            		i++;
            	}
            }
        }
		SanPham qlsp=new SanPham(MaSanPham, TenSanPham, MauSac, GioiTinh, ThuongHieu, KhuyenMai, Gia, HinhAnh);
		qlsp.setHinhAnh(SAVE_DIR1+"/"+HinhAnh);
		boolean kt=SanPhamDAO.ThemSanPham(qlsp, conn);
		try {
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		if(kt)
       {
			request.setAttribute("msgThemSanPham", "Thêm thành công");
			RequestDispatcher rd = request.getRequestDispatcher("QLSPController");
			rd.forward(request, response);
       }
       else
       {
    	   	request.setAttribute("msgThemSanPham", "Thêm thất bại");
	    	RequestDispatcher rd = request.getRequestDispatcher("QLSPController");
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
	
	private String NameIMG(String HinhAnh, int i) {
		if(HinhAnh.contains(".jpg"))
		{
			String[] array = HinhAnh.split(".jpg");
			return (array[0] + "."+i+".jpg");
		} else {
			if(HinhAnh.contains(".png")) {
				String[] array = HinhAnh.split(".png");
				return (array[0] + "."+i+".png");
			}
		}
        return "";
    }
}
