package Controller;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import BEAN.Quyen;
import BEAN.SanPham;

import DAO.SanPhamDAO;

import DB.DBConnection;


@WebServlet("/SuaSanPhamController")
@MultipartConfig(fileSizeThreshold=1024*1024*2, // 2MB
maxFileSize=1024*1024*10,      // 10MB
maxRequestSize=1024*1024*50)   // 50MB
public class SuaSanPhamController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String SAVE_DIR = "C:\\Users\\Admin\\git\\ShopGiay\\WebContent\\";
	private static final String SAVE_DIR1 = "img/product";
   
    public SuaSanPhamController() {
        super();
      
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		if(session.getAttribute("quyen")==null) {
			response.sendRedirect("Home");
		} else {
			if(((Quyen)session.getAttribute("quyen")).getSanPham()==1 || ((Quyen)session.getAttribute("quyen")).getAdmin()==1) {
				request.setCharacterEncoding("UTF-8"); 
				 String action = request.getParameter("action");
				 if(action==null)
					 ShowSanPham(request, response);
				 else {
					 if(action.contains("Update"))		
							UpdateSanPham(request, response);
				 }
			}
			else
				response.sendRedirect("DangXuatController");
		}
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		doGet(request, response);
	}

	private void ShowSanPham(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		Connection conn=DBConnection.CreateConnection();
        String MaSanPham=request.getParameter("MaSanPham");
        BEAN.SanPham qlsp=SanPhamDAO.LaySanPham(conn, MaSanPham);
        RequestDispatcher rd=request.getRequestDispatcher("suaSP.jsp");
        request.setAttribute("ttsp", qlsp);
        rd.forward(request, response);
	}
	
	private void UpdateSanPham(HttpServletRequest request, HttpServletResponse response)  throws ServletException, IOException 
	{
		request.setCharacterEncoding("UTF-8");
		Connection conn = DBConnection.CreateConnection();
		String MaSanPham=request.getParameter("MaSanPham");
		String MauSac=request.getParameter("MauSac");
		int KhuyenMai=Integer.parseInt(request.getParameter("KhuyenMai"));
		int Gia=Integer.parseInt(request.getParameter("GiaBan"));
		String HinhAnh="";
		SanPham qlsp = SanPhamDAO.LaySanPham(conn, MaSanPham);
		qlsp.setMauSac(MauSac);
		qlsp.setKhuyenMai(KhuyenMai);
		qlsp.setGia(Gia);
		String HinhAnhCon=qlsp.getHinhAnh().substring(11);
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
            	if(i==8) {
            		HinhAnh = fileName;
            		qlsp.setHinhAnh(SAVE_DIR1+"/"+HinhAnh);
            		HinhAnhCon = HinhAnh;
            		part.write(savePath + File.separator + HinhAnh);
                	part.write(savePath1 + File.separator + HinhAnh);
            	} else {
            		String nameIMG = NameIMG(HinhAnhCon, i-7);
            		part.write(savePath + File.separator + nameIMG);
                	part.write(savePath1 + File.separator + nameIMG);
            	}
            }
            i++;
        }
		boolean kt=SanPhamDAO.UpdateSanPham(qlsp, conn);
		if(kt)
		{
			request.setAttribute("msgSuaSanPham", "Sửa sản phẩm thành công");
			RequestDispatcher rd = request.getRequestDispatcher("QLSPController");
  			rd.forward(request, response);
		}
		else
		{
			request.setAttribute("msgSuaSanPham", "Sửa sản phẩm thất bại");
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
