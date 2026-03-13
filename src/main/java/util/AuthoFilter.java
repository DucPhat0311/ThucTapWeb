package util;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.UserSession;

public class AuthoFilter implements Filter {

    public AuthoFilter() {
        // TODO Auto-generated constructor stub
    }

	public void destroy() {
		// TODO Auto-generated method stub
	}

	 @Override
	    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
	        throws IOException, ServletException {
	        HttpServletRequest req = (HttpServletRequest) request;
	        HttpServletResponse resp = (HttpServletResponse) response;
	        HttpSession session = req.getSession(); // Lấy hoặc tạo mới session nếu chưa có
	        String path = req.getServletPath();

	        // Khai báo các đường dẫn KHÔNG cần đăng nhập (Public)
	        // Bao gồm trang chủ, shop, login, register và các file static (css, js, img)
	        boolean isPublicPath = path.equals("/signin") || path.equals("/signup") || 
	                               path.equals("/home") || path.equals("/shop") ||
	                               path.startsWith("/assets") || path.startsWith("/css");

	        // Lấy user từ session
	        UserSession user = (UserSession) session.getAttribute("user");

	        // Kiểm tra quyền truy cập
	        if (user == null && !isPublicPath) {
	            //Nếu chưa đăng nhập và cố tình vào trang bảo mật (như /profile, /checkout, /admin)
	            if ("GET".equalsIgnoreCase(req.getMethod())) {
	                String uri = req.getRequestURI();
	                String query = req.getQueryString();
	                String originalUrl = uri + (query != null ? "?" + query : "");
	                session.setAttribute("redirectAfterLogin", originalUrl);
	            }
	            
	            req.setAttribute("msgtype", "error");
	            req.setAttribute("msg", "Please login to continue!");
	            req.getRequestDispatcher("/WEB-INF/views/signin.jsp").forward(req, resp);
	            return;
	        }

	        // Lọc quyền Admin
	        if (path.startsWith("/admin")) {
	            if (user == null || user.getRole() != 0) { // Giả sử 0 là ADMIN
	                resp.sendError(HttpServletResponse.SC_FORBIDDEN, "Bạn không có quyền truy cập!"); 
	                return;
	            }
	        }

	        // Nếu mọi thứ ok thì đi tiếp
	        chain.doFilter(request, response);
	    }

	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
