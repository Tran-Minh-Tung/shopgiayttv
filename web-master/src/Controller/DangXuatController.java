package Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/DangXuatController")
public class DangXuatController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public DangXuatController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		HttpSession session = request.getSession();
		if(session!=null) {
			if(session.getAttribute("quyen")!=null) {
				session.invalidate();
				response.sendRedirect("DangNhapAdminController");
			} else {
				session.invalidate();
				response.sendRedirect("Home");
			}
		} else {
			response.sendRedirect("Home");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
