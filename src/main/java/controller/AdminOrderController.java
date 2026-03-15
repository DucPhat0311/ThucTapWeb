package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.AdminOrderDao;
import model.Order;
import model.OrderDetail;

@WebServlet("/admin/order/*")
public class AdminOrderController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public AdminOrderController() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String path = request.getPathInfo();
        AdminOrderDao dao = new AdminOrderDao();

        if (path == null || path.equals("/") || path.equals("")) {
            showOrderList(request, response, dao);
            return;
        }

        switch (path) {
            case "/list":
                showOrderList(request, response, dao);
                break;
            case "/details":
                showOrderDetails(request, response, dao);
                break;
            default:
                response.sendRedirect(request.getContextPath() + "/admin/order");
                break;
        }
    }

//Hiển thị danh sách đơn hàng

    private void showOrderList(HttpServletRequest request, HttpServletResponse response, AdminOrderDao dao)
            throws ServletException, IOException {
        List<Order> orderList = dao.getOrders();
        request.setAttribute("orderList", orderList);
        request.setAttribute("choose", 2);
        request.getRequestDispatcher("/WEB-INF/admin/adminorder.jsp").forward(request, response);
    }

//Hiển thị chi tiết đơn hàng

    private void showOrderDetails(HttpServletRequest request, HttpServletResponse response, AdminOrderDao dao)
            throws ServletException, IOException {
        String id = request.getParameter("id");
        try {
            int orderId = Integer.parseInt(id);
            List<OrderDetail> listOD = dao.getOrdersDetailsByOrderID(orderId);
            Order order = dao.getOrdersFromOrderIDToOrderDetails(orderId);
            request.setAttribute("odList", listOD);
            request.setAttribute("o2", order);
        } catch (Exception e) {
            e.printStackTrace();
        }
        request.setAttribute("choose", 2);
        request.getRequestDispatcher("/WEB-INF/admin/adminorderdetails.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String path = request.getPathInfo();
        
        if (path == null) {
            doGet(request, response);
            return;
        }

        switch (path) {
            case "/updateStatus":
                updateStatusOrders(request, response);
                break;
            default:
                doGet(request, response);
                break;
        }
    }

//Cập nhật trạng thái đơn hàng

    private void updateStatusOrders(HttpServletRequest request, HttpServletResponse response) 
            throws IOException {
        AdminOrderDao dao = new AdminOrderDao();
        String status = request.getParameter("status").toUpperCase();
        int orderID = Integer.parseInt(request.getParameter("orderID"));

        if (dao.updateNewStatusOrder(orderID, status)) {
            response.setStatus(HttpServletResponse.SC_OK);
        }
    }
}
