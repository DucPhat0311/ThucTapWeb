package controller;

import dao.OrdersDao;
import model.Order;
import model.UserSession;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/user/*")
public class UserController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public UserController() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String path = request.getPathInfo();
        HttpSession session = request.getSession();
        UserSession userSession = (UserSession) session.getAttribute("user");
        OrdersDao orDao = new OrdersDao();
        String selected ="";
        String condition=null;
        List<Order> listOrder =null;


        switch (path) {

            case "/review":
                request.getRequestDispatcher("/WEB-INF/views/reviews.jsp")
                        .forward(request, response);
                break;

            case "/orders_his":

                condition = request.getParameter("search");
                if(condition != null) {
                    switch (condition) {
                        case "today":
                            selected = "today";
                            listOrder = orDao.selectOrdersByToday(userSession.getIdUser());
                            break;
                        case "week":
                            selected = "week";

                            listOrder = orDao.selectOrdersByWeek(userSession.getIdUser());
                            break;
                        case "month":
                            selected = "month";
                            listOrder = orDao.selectOrdersByMonth(userSession.getIdUser());
                            break;
                        case "all":
                            selected = "all";
                            listOrder = orDao.selectOrderByUserID(userSession.getIdUser());
                            break;
                        default:
                            throw new IllegalArgumentException("Unexpected value: " + condition);
                    }
                }else {
                    selected = "all";
                    listOrder = orDao.selectOrderByUserID(userSession.getIdUser());
                }
                request.setAttribute("choose", selected);
                request.setAttribute("orders", listOrder);
                request.setAttribute("account",4);
                request.getRequestDispatcher("/WEB-INF/views/orders_his.jsp")
                        .forward(request, response);
                break;

            case "/orders_shipping":
                request.getRequestDispatcher("/WEB-INF/views/orders_shipping2.jsp")
                        .forward(request, response);
                break;

            case "/orders_delivered":
                request.getRequestDispatcher("/WEB-INF/views/orders_delivered2.jsp")
                        .forward(request, response);
                break;

            case "/settings":
                request.getRequestDispatcher("/WEB-INF/views/settings.jsp")
                        .forward(request, response);
                break;

            case "/security":
                request.getRequestDispatcher("/WEB-INF/views/settings_security.jsp")
                        .forward(request, response);
                break;

            case "/address":
                request.getRequestDispatcher("/WEB-INF/views/settings_address.jsp")
                        .forward(request, response);
                break;

            case "/help":
                request.getRequestDispatcher("/WEB-INF/views/help.jsp")
                        .forward(request, response);
                break;

            default:
                response.sendError(HttpServletResponse.SC_NOT_FOUND);
        }
    }

}