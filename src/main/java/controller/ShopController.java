package controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.math.BigDecimal;
import java.util.Arrays;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ProductVariantsDao;
import dao.ProductsDao;
import dao.ShopDao;
import model.Category;
import model.ProductVariants;
import model.Products;


@WebServlet("/shop")
public class ShopController extends HttpServlet {

    public ShopController() {
        super();
        // TODO Auto-generated constructor stub
    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action= request.getParameter("action");
        request.setAttribute("active", "shop");
        switch (action) {
            case "showCard":
                ShopShowCard(request, response);
                break;
            case "SProduct":
                ShowSProduct(request,response);
                break;
            case "search":
                searchHandle(request, response);
                break;
        }
    }

    private void searchHandle(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        String keyword = request.getParameter("keyword");
        String url = "/WEB-INF/views/shop.jsp";
        ProductsDao dao = new ProductsDao();
        List<Products> productsSearch = dao.selectProductsByKeyWord(keyword);

        request.setAttribute("key", keyword);
        request.setAttribute("ListProducts", productsSearch);

        getServletContext().getRequestDispatcher(url).forward(request, response);

    }


    private void ShowSProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        int getID = Integer.parseInt( request.getParameter("productID"));
        int getType = Integer.parseInt(request.getParameter("type"));
        ProductsDao dao= new ProductsDao();
        ProductVariantsDao product_variantsDao = new ProductVariantsDao();

        List<ProductVariants> productVariant = product_variantsDao.SelectByProductIDInProductVariants(getID);
        Products product=	dao.SelectByProductID(getID);
        List<Products> rq = dao.SelectByCategory(getType);
        request.setAttribute("getVariants", productVariant);
        request.setAttribute("TypeClothe", rq);
        request.setAttribute("sproduct", product);
        getServletContext().getRequestDispatcher("/WEB-INF/views/sproduct.jsp").forward(request, response);
    }

    public void ShopShowCard(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = "/WEB-INF/views/shop.jsp";
        ProductsDao dao = new ProductsDao();
        List<Products> products = dao.SelectAll();

        request.setAttribute("ListProducts", products);

        getServletContext().getRequestDispatcher(url).forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }



}
