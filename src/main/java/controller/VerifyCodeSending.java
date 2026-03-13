package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserDao;
import util.Mail;
import util.RandomCode;

@WebServlet("/verifyCode")
public class VerifyCodeSending extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public VerifyCodeSending() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    UserDao user = new UserDao();
	    response.setContentType("application/json");
	    response.setCharacterEncoding("UTF-8");

	    
	    String email = request.getParameter("email");
	    
	    boolean isExists = user.isEmailExists(email);
	    if(isExists) {
	        response.getWriter().write("{\"status\":\"failed\"}");
	    	return;
	    }
	    // Sinh code mới
	    String code = RandomCode.generateCode(6);
	    // Lưu code vào session đúng email
	    request.getSession().setAttribute("register_email", email);
	    request.getSession().setAttribute("register_code", code);

	    Mail mail = new Mail();
	    boolean sent = mail.SendVerifyMail(email, code);

	    if(!sent) {
	        response.getWriter().write("{\"status\":\"error\"}");
	        return;

	    }
	    response.getWriter().write("{\"status\":\"success\"}");

	}

}
