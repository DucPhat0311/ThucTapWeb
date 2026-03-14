package controller;

import java.io.IOException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.ProductsDao;
import dao.RememberTokenDao;
import dao.UserDao;
import model.Cart;
import model.Products;
import model.User;
import model.UserSession;
import util.Encode;
import util.Mail;
import util.RandomCode;

@WebServlet("/login/*")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public LoginController() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String path = request.getPathInfo();

	    if (path == null || "/".equals(path)) {
	    	
	        request.getRequestDispatcher("/WEB-INF/views/signin.jsp")
	               .forward(request, response);
	        return;
	    }

	    switch (path) {
	        case "/signin":
	        	String getMsg = request.getParameter("msg");
	        	HttpSession session = request.getSession(false);
	        	String msg = (String) session.getAttribute("getMessage");
	        	session.removeAttribute("getMessage");
	        		if(getMsg !=null ) {
	        			request.setAttribute("msgtype", "sus");
	        			request.setAttribute("msg", "Đổi mật khẩu thành công!");
	        		}
	        		
	            request.getRequestDispatcher("/WEB-INF/views/signin.jsp").forward(request, response);
	            break;

	        case "/signup":
	            request.getRequestDispatcher("/WEB-INF/views/signup.jsp").forward(request, response);
	            break;

	        case "/forgot":
	            request.getRequestDispatcher("/WEB-INF/views/forgotpassword.jsp").forward(request, response);
	            break;

	        case "/logout":
	            Logout(request, response);
	            break;

	        default:
	            response.sendError(404);
	    }
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String path = request.getPathInfo();

	    switch (path) {
	        case "/login":
	            Login(request, response);
	            break;

	        case "/register":
	            Register(request, response);
	            break;

	        case "/forgotpassword":
	            ForgotPassword(request, response);
	            break;

	        case "/resetpassword":
	            ResetPassword(request, response);
	            break;
	            
	        case "/changePass":
	        	changePass(request, response);
	        	break;

	        default:
	            response.sendError(404);
	    }
	}
	private void changePass(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String getCurPassForm = request.getParameter("currPass");
		String getNewPassForm = request.getParameter("password");
		String getNewPassCofirmForm = request.getParameter("password_confirm");
		String url= "/WEB-INF/views/settings_security.jsp";
	

		if(!getNewPassCofirmForm.equals(getNewPassForm)) {

			request.setAttribute("msg_type", "error");
			request.setAttribute("msg", "Mật khẩu xác nhận không khớp!");
			request.getRequestDispatcher(url).forward(request, response);
			return;
		}
		
		String getNewPassFormHash = Encode.hash(getNewPassCofirmForm);
		HttpSession session = request.getSession(false);
		UserDao dao = new UserDao();
		UserSession userSession =(UserSession) session.getAttribute("user");
		User user = dao.selectUserByUserID(userSession.getIdUser());
		
		if(!Encode.verify(getCurPassForm, user.getPassword())) {

			request.setAttribute("msg_type", "error");
			request.setAttribute("msg", "Mật khẩu hiện tại không đúng!");
			
			request.getRequestDispatcher(url).forward(request, response);
			return;
		}
		if(	dao.updatePasswordByUserID(user.getIdUser(), getNewPassFormHash)){
			HttpSession exists = request.getSession(false);
			if(exists !=null) {
				exists.invalidate();
			}
		
			 response.sendRedirect(
			            request.getContextPath() + "/login/signin?msg=changePassword"
			        );
			 return;
		}
	}

	
	private void Logout(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession(false);
		UserSession userSession = (UserSession) session.getAttribute("user");
		if (session != null) {
		    RememberTokenDao tokenDao = new RememberTokenDao();
		    tokenDao.deleteToken(userSession.getIdUser());
		}
		//Cần thêm xóa login
		session.invalidate();
		response.sendRedirect(request.getContextPath()+"/home");

	}

	
	public void Register(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException {
		  request.setCharacterEncoding("UTF-8");
		    response.setCharacterEncoding("UTF-8");
	    String firstname = request.getParameter("firstname");
	    String lastname = request.getParameter("lastname");
	    String username = request.getParameter("username");
	    String email = request.getParameter("email");
	    String verifyCode = request.getParameter("verifyCode");
	    String password = request.getParameter("password");
	    String msg = "";
	    String url = "/WEB-INF/views/signin.jsp";

	    UserDao idao = new UserDao();

	    HttpSession session = request.getSession();


	    //Kiểm tra nếu chưa gửi mã thì gửi code mới
	    if (verifyCode == null || verifyCode.isEmpty()) {
	        String randomCode = RandomCode.generateCode(6);
	        System.out.println(randomCode);
	        session.setAttribute("register_email", email);
	        session.setAttribute("register_code", randomCode);
	        Mail mail = new Mail();
	        mail.SendVerifyMail(email, randomCode);
	        msg = "Đã gửi mã xác thực, vui lòng kiểm tra email.";
	        request.setAttribute("msg", msg);
	        request.setAttribute("msgtype", "sus");
	        request.getRequestDispatcher("/WEB-INF/views/signup.jsp").forward(request, response);
	        return;
	    }

	    //Xác thực tài khoản
	    String codeInSession = (String) session.getAttribute("register_code");
	    String emailInSession = (String) session.getAttribute("register_email");

	    if (idao.checkAccount(username)) {
	        url = "/WEB-INF/views/signup.jsp";
	        msg = "Tài khoản đã tồn tại";
	        request.setAttribute("msg", msg);
	        request.setAttribute("msgtype", "error");
	        request.setAttribute("username", username);
	        request.setAttribute("firstname", firstname);
	        request.setAttribute("lastname", lastname);
	        request.getRequestDispatcher(url).forward(request, response);
	        return;
	    }
	    if (!verifyCode.equals(codeInSession) || !email.equals(emailInSession)) {
	        msg = "Mã xác thực không khớp";
	        request.setAttribute("msg", msg);
	        request.setAttribute("msgtype", "error");
	        request.setAttribute("username", username);
	        request.setAttribute("firstname", firstname);
	        request.setAttribute("lastname", lastname);
	        url = "/WEB-INF/views/signup.jsp";
	        request.getRequestDispatcher(url).forward(request, response);
	        return;
	    } else {
	        User user = new User(firstname, lastname, email, true, username, Encode.hash(password), 1);
	        idao.addUser(user);
	        msg = "Đăng ký thành công";
	        request.setAttribute("msg", msg);
	        request.setAttribute("msgtype", "sus");
	        // XÓA session đã dùng!
	        session.removeAttribute("register_email");
	        session.removeAttribute("register_code");
	    }

	    request.getRequestDispatcher(url).forward(request, response);
	}

	public void Login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
		String password = request.getParameter("password_sigin");
		boolean checked = request.getParameter("checkbox_re") !=null;
	    String url = "/WEB-INF/views/signin.jsp"; 

		String msg = "";

		UserDao dao = new UserDao();
		
		if(!dao.checkAccount(username)) {
			msg= "Tài khoản không tồn tại";
		}else {
			User user = dao.getFullName(username);
			UserSession userSession = new UserSession(user.getIdUser(), user.getFirstName(),user.getLastName(), user.getRole());
			boolean checkPass = Encode.verify(password, user.getPassword());
			
			if(!checkPass) {
				msg = "Sai tài khoản hoặc mật khẩu";
			}else {
				if(user.getStatus() ==0) {
					msg = "Tài khoản của bạn đã bị khóa";
				}else if(user.getStatus() ==1){
					if(checked) {
						//Tạo token ngẫu nhiên
						String token = UUID.randomUUID().toString();
						LocalDateTime expiredAt = LocalDateTime.now().plusDays(30);

						//Lưu vào Database
						RememberTokenDao tokenDao = new RememberTokenDao();
						tokenDao.saveToken(user.getIdUser(), token, expiredAt);
					} else {
					}
					HttpSession session = request.getSession();
					
					
					session.setAttribute("user", userSession);
					String redirectUrl = (String) session.getAttribute("redirectAfterLogin");
				
					if (redirectUrl != null) {
					    session.removeAttribute("redirectAfterLogin");
					    response.sendRedirect( redirectUrl);
					} else if(user.getRole() !=0) {
					    response.sendRedirect(request.getContextPath() + "/home");
					}else if(user.getRole()==0) {
					    response.sendRedirect(request.getContextPath() + "/admin");

					}
		            return;
				}else if(user.getStatus() ==2 ) {
					msg = "Tài khoản của bạn đã bị khóa tạm thời.";
				}else if(user.getStatus() ==-1 ) {
					msg = "Tài khoản của bạn đã bị xóa.";
				}
			
			}
		}
	
		request.setAttribute("msg", msg);
	    request.setAttribute("msgtype", "error");
	    
	    //Forward về lại trang signin.jsp
	    getServletContext().getRequestDispatcher(url).forward(request, response);

	}

	private void ForgotPassword(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException {
	    String email = request.getParameter("email");
	    String verifyCode = request.getParameter("verifyCode");
	    String act = request.getParameter("action");

	    HttpSession session = request.getSession();
	    UserDao userDao = new UserDao();
	    boolean exists = userDao.checkEmail(email);

	    //Nếu bấm Send hoặc chưa nhập verifyCode -> gửi code mới và forward lại forgotpassword.jsp với message
	    if ((verifyCode == null || verifyCode.isEmpty()) || "sendcode".equals(act)) {
	        if (!exists) {
	        	request.setAttribute("email", email);
	            request.setAttribute("msg", "Email không tồn tại!");
	            request.setAttribute("msgtype", "error");
	            request.getRequestDispatcher("/WEB-INF/views/forgotpassword.jsp").forward(request, response);
	        } else {
	        	request.setAttribute("email", email);
	        	
	            String randomCode = RandomCode.generateCode(6);
	            session.setAttribute("reset_email", email);
	            session.setAttribute("reset_code", randomCode);

	            Mail mail = new Mail();
	            mail.SendVerifyMail(email, randomCode);

	            request.setAttribute("msg", "Đã gửi mã xác thực, vui lòng kiểm tra email.");
	            request.setAttribute("msgtype", "sus");
	            request.getRequestDispatcher("/WEB-INF/views/forgotpassword.jsp").forward(request, response);
	        }
	    } 
	    //Nếu bấm Reset Password
	    else {
	        String savedEmail = (String) session.getAttribute("reset_email");
	        String savedCode = (String) session.getAttribute("reset_code");

	        if (!email.equals(savedEmail) || !verifyCode.equals(savedCode)) {

	            request.setAttribute("msg", "Code xác thực không đúng hoặc email không khớp, vui lòng kiểm tra lại!");
	            request.setAttribute("msgtype", "error");
	            request.getRequestDispatcher("/WEB-INF/views/forgotpassword.jsp").forward(request, response);
	        } else {
	            //Đúng code + email, đến trang reset mật khẩu
	            request.getRequestDispatcher("/WEB-INF/views/resetpassword.jsp").forward(request, response);
	        }
	    }
	}
	
	private void ResetPassword(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException {
	    //Lấy email từ session (đã verified qua bước nhập code)
	    HttpSession session = request.getSession();
	    String email = (String) session.getAttribute("reset_email");
	    String newPwd = request.getParameter("password_new");
	    String confirmPwd = request.getParameter("password_confirm_new");
	    String msg = "";
	    String url = "/WEB-INF/views/resetpassword.jsp";

	    //Kiểm tra session
	    if (email == null) {
	        msg = "Phiên làm việc đã hết hoặc email chưa được xác thực.";
	        request.setAttribute("msg", msg);
	        request.setAttribute("msgtype", "error");
	        request.getRequestDispatcher(url).forward(request, response);
	        return;
	    }
	    //Kiểm tra password
	    if (newPwd == null || confirmPwd == null || !newPwd.equals(confirmPwd)) {
	        msg = "Mật khẩu xác nhận không khớp!";
	        request.setAttribute("msg", msg);
	        request.setAttribute("msgtype", "error");
	        request.getRequestDispatcher(url).forward(request, response);
	        return;
	    }
	    if (newPwd.length() < 6) {
	        msg = "Mật khẩu phải có ít nhất 6 ký tự!";
	        request.setAttribute("msg", msg);
	        request.setAttribute("msgtype", "error");
	        request.getRequestDispatcher(url).forward(request, response);
	        return;
	    }
	    //Đổi mật khẩu trên database
	    UserDao userDao = new UserDao();
	    boolean updateOk = userDao.updatePasswordByEmail(email, Encode.hash(newPwd));
	    if (updateOk) {
	        //Xóa session reset_email sau khi đổi xong
	        session.removeAttribute("reset_email");
	        msg = "Đổi mật khẩu thành công! Vui lòng đăng nhập lại.";
	        request.setAttribute("msg", msg);
	        request.setAttribute("msgtype", "sus");
	        //Chuyển về trang đăng nhập
	        request.getRequestDispatcher("/WEB-INF/views/signin.jsp").forward(request, response);
	    } else {
	        msg = "Đổi mật khẩu thất bại! Vui lòng thử lại.";
	        request.setAttribute("msg", msg);
	        request.setAttribute("msgtype", "error");
	        request.getRequestDispatcher(url).forward(request, response);
	    }
	}
}
