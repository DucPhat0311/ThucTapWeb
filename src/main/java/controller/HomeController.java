package controller;

import dao.ProductsDao;
import model.Products;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/home")
public class HomeController extends HttpServlet {

    public HomeController() {
        super();
        // TODO Auto-generated constructor stub
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ProductsDao dao = new ProductsDao();

        String url ="/WEB-INF/views/index.jsp";
        List<Products> pro1 = dao.SelectAll(0, 16);

        request.setAttribute("active", "index");
        request.setAttribute("Product1", pro1);


        request.getRequestDispatcher(url).forward(request, response);


    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // TODO Auto-generated method stub
        doGet(request, response);
    }

}
