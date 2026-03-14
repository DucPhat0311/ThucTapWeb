package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.AddressDao;
import dao.ProductVariantsDao;
import dao.ProductsDao;
import model.*;

@WebServlet("/cart/*")
public class CartController extends HttpServlet {

    public CartController() {
        super();
        // TODO Auto-generated constructor stub
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String path = request.getPathInfo();

        HttpSession session = request.getSession();
        UserSession userSession = (UserSession) session.getAttribute("user");

        System.out.println("Session ID hiện tại: " + session.getId());


        if (path != null) {
            switch (path) {
                case "/checkout":
                    AddressDao address = new AddressDao();
                    List<Address> getAddress = address.selectAddressByUserID(userSession.getIdUser());
                    request.setAttribute("getAddress", getAddress);
                    request.getRequestDispatcher("/WEB-INF/views/checkout_user.jsp").forward(request, response);
                default:
                    throw new IllegalArgumentException("sai " + path);
            }
        } else {
            Cart cart = (Cart) session.getAttribute("Cart");
            if (cart == null) {
                cart = new Cart();
                session.setAttribute("Cart", cart);
            }

            // load products và productsVariant
            ProductVariantsDao variantDao = new ProductVariantsDao();
            ProductsDao productDao = new ProductsDao();

            for (CartItems item : cart.getItems()) {
                ProductVariants var = variantDao.selectById(item.getVariantID());
                Products prod = productDao.selectByVariantId(item.getVariantID());

                item.setVariant(var);
                item.setProducts(prod);
            }
            request.getRequestDispatcher("/WEB-INF/views/cart.jsp").forward(request, response);
        }

    }

    private void changeQuanity(HttpServletRequest request, HttpServletResponse response) {
        int getProductsId = Integer.parseInt(request.getParameter("id"));
        int getQuanity = Integer.parseInt(request.getParameter("quanity"));
        HttpSession session = request.getSession(false);

        Cart getCart = (Cart) session.getAttribute("Cart");

        getCart.changeQuanity(getProductsId, getQuanity);
    }

    private void removeProducts(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int getVariantID = Integer.parseInt(request.getParameter("id"));
        HttpSession session = request.getSession(false);

        Cart getCart = (Cart) session.getAttribute("Cart");

        getCart.removeItems(getVariantID);

        response.setContentType("application/json");
        response.getWriter()
                .write("{\"totalPrice\": " + getCart.getPrice() + ", \"cartCount\": " + getCart.getSize() + "}");

    }

    private void AddProductToCart(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int vID = Integer.parseInt(request.getParameter("variantID"));
        int qty = Integer.parseInt(request.getParameter("quanity"));

        HttpSession session = request.getSession();
        Cart cart = (Cart) session.getAttribute("Cart");

        if (cart == null) {
            cart = new Cart();
        }
        cart.addItem(vID, qty);
        session.setAttribute("Cart", cart);

        Cart curCart = (Cart) session.getAttribute("Cart");

        response.getWriter().write(String.valueOf(curCart.getSize()));
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // TODO Auto-generated method stub
        String action = request.getParameter("action");
        if (action != null) {
            switch (action) {
                case "AddProduct":
                    AddProductToCart(request, response);
                    break;
                case "RemoveProducts":
                    removeProducts(request, response);
                    break;
                case "OnchangeQuanity":
                    changeQuanity(request, response);
                    break;
                default:
                    throw new IllegalArgumentException("no: " + action);
            }
        } else {

            request.setAttribute("active", "cart");
            request.getRequestDispatcher("/WEB-INF/views/cart.jsp").forward(request, response);

        }
    }

}
