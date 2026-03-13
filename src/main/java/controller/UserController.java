package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/user/*")
public class UserController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public UserController() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String path = request.getPathInfo();

        if (path == null) {
            path = "/settings";
        }

        switch (path) {

            case "/review":
                request.getRequestDispatcher("/WEB-INF/views/reviews.jsp")
                        .forward(request, response);
                break;

            case "/order_history":
                request.getRequestDispatcher("/WEB-INF/views/order_history.jsp")
                        .forward(request, response);
                break;

            case "/orders_his":
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