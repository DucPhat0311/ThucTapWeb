package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.AdminUserDao;
import model.User;


@WebServlet("/admin/user/*")
public class AdminUserController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public AdminUserController() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String path = request.getPathInfo();
        AdminUserDao dao = new AdminUserDao();

        if (path == null || path.equals("/") || path.equals("")) {
            showUserList(request, response, dao);
            return;
        }

        String id;
        switch (path) {
            case "/list":
                showUserList(request, response, dao);
                break;
            case "/ban":
                id = request.getParameter("id");
                banUser(id, dao);
                response.sendRedirect(request.getContextPath() + "/admin/user");
                break;
            case "/unBan":
                id = request.getParameter("id");
                unbanUser(id, dao);
                response.sendRedirect(request.getContextPath() + "/admin/user");
                break;
            case "/delete":
                id = request.getParameter("id");
                deleteUser(id, dao);
                response.sendRedirect(request.getContextPath() + "/admin/user");
                break;
            case "/add":
            	response.sendRedirect(request.getContextPath() + "/login/signup");
            	break;
            default:
                response.sendRedirect(request.getContextPath() + "/admin/user");
                break;
        }
    }


//Hiển thị danh sách người dùng

    private void showUserList(HttpServletRequest request, HttpServletResponse response, AdminUserDao dao)
            throws ServletException, IOException {
        List<User> userList = dao.selectListUser();
        request.setAttribute("userList", userList);
        request.setAttribute("choose", 4);
        request.getRequestDispatcher("/WEB-INF/admin/adminuser.jsp").forward(request, response);
    }


//Khóa tài khoản người dùng

    private void banUser(String id, AdminUserDao dao) {
        try {
            int userId = Integer.parseInt(id);
            dao.bannedAccount(userId);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }


//Mở khóa tài khoản người dùng

    private void unbanUser(String id, AdminUserDao dao) {
        try {
            int userId = Integer.parseInt(id);
            dao.unBannedAccount(userId);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }


//Xóa tài khoản người dùng

    private void deleteUser(String id, AdminUserDao dao) {
        try {
            int userId = Integer.parseInt(id);
            dao.deleteAccount(userId);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
