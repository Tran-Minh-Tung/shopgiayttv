package Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.sql.*;
import BEAN.*;
import DAO.*;
import DB.DBConnection;
import java.util.*;
import javax.mail.*;
import javax.mail.internet.*;

@WebServlet("/QuenMatKhauController")
public class QuenMatKhauController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public QuenMatKhauController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		RequestDispatcher rd = request.getRequestDispatcher("forgot-password.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		Connection conn = DBConnection.CreateConnection();
		String id = request.getParameter("username");
		String mail = request.getParameter("email");
		Users user = UsersDAO.LayTaiKhoan(conn, id);
		if(user!=null) {
			KhachHang kh = KhachHangDAO.LayKhachHang(conn, id);
			if(mail.contains(kh.getEmail())) {
				sendMail(mail, kh.getHoTen(), user.getPass());
				request.setAttribute("msgLayMK", "Đã gửi email");
			} else {
				request.setAttribute("msgLayMK", "Email của bạn không đúng");
			}
		} else {
			request.setAttribute("msgLayMK", "Tên đăng nhập không tồn tại");
		}
		try {
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		RequestDispatcher rd = request.getRequestDispatcher("forgot-password.jsp");
		rd.forward(request, response);
	}

	public void sendMail(String mail, String ten, String pass) {
		 Properties props = new Properties();
		 props.put("mail.smtp.auth", "true");
	     props.put("mail.smtp.starttls.enable", "true");
	     props.put("mail.smtp.host", "smtp.gmail.com");
	     props.put("mail.smtp.port", "587");
	     Session session = Session.getInstance(props,
	                new javax.mail.Authenticator() {
	            @Override
	            protected PasswordAuthentication getPasswordAuthentication() {
	                return new PasswordAuthentication("giayneptt@gmail.com", "giayne123");
	            }
	     });
	     try {
	    	 Message message = new MimeMessage(session);
	    	 message.setHeader("Content-Type", "text/plain; charset=UTF-8");
	    	 message.setFrom(new InternetAddress("blogkenhlaptrinh@gmail.com"));
	    	 message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(mail));
	    	 message.setSubject("Shop Giày Nè PTT");
	    	 message.setText("Xin chào: "+ten +".\nMật khẩu của bạn là: "+pass);
	    	 Transport.send(message);
	     } catch (MessagingException e) {
	        	e.printStackTrace();
	     }
	}
}
