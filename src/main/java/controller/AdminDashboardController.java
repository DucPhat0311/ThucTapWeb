package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.AdminDashboardDao;
import model.Order;

//Xử lý thống kê, tổng quan hệ thống

@WebServlet("/admin/dashboard/*")
public class AdminDashboardController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public AdminDashboardController() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String path = request.getPathInfo();
        AdminDashboardDao dao = new AdminDashboardDao();

//Nếu không có path cụ thể, mặc định hiển thị dashboard

        if (path == null || path.equals("/") || path.equals("")) {
            showDashboard(request, response, dao);
            return;
        }

        switch (path) {
            case "/index":
                showDashboard(request, response, dao);
                break;
            default:
                response.sendRedirect(request.getContextPath() + "/admin/dashboard");
                break;
        }
    }

    private void showDashboard(HttpServletRequest request, HttpServletResponse response, AdminDashboardDao dao)
            throws ServletException, IOException {
        List<Order> listOr = dao.selectOrdersRecent();
        int totalUsers = dao.selectTotalUser();
        int revenue = dao.selectSumRevenue();
        int orders = dao.selectCountOrders();
        int products = dao.selectTotalProducts();

        request.setAttribute("ttu", totalUsers);
        request.setAttribute("rev", revenue);
        request.setAttribute("tto", orders);
        request.setAttribute("ttp", products);
        request.setAttribute("oor", listOr);
        request.setAttribute("choose", 1);

        request.getRequestDispatcher("/WEB-INF/admin/adminindex.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
