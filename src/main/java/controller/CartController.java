package controller;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.*;
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
                case "orders":
                    getOrders(request, response);
                    break;
                case "getShippingPrice":
                    getShippingPrice(request, response);
                    break;
                default:
                    throw new IllegalArgumentException("no: " + action);
            }
        } else {

            request.setAttribute("active", "cart");
            request.getRequestDispatcher("/WEB-INF/views/cart.jsp").forward(request, response);

        }
    }
    private void getOrders(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {
        // TODO Auto-generated method stub
        OrdersDao dao = new OrdersDao();
        HttpSession session = request.getSession(false);
        UserSession userSession = (UserSession) session.getAttribute("user");
        Cart cart = (Cart) session.getAttribute("Cart");
        String getAddressId = request.getParameter("address");
        String shipping_fee = request.getParameter("shipping");
        String getNote = request.getParameter("note");
        String getSubTotal = request.getParameter("subtotal");
        String getPaymentMethod = request.getParameter("payment");
        String getDiscount = request.getParameter("discount_fee");
        String getTotalAmount = request.getParameter("finalTotal");

        try {

            // các giá trị bị dính prefix đồng tiền ở cuối ví dụ: 78 đ

            int addID = Integer.parseInt(getAddressId);
            BigDecimal shipping =pareString(shipping_fee);
            BigDecimal subtotal = pareString(getSubTotal);

            BigDecimal discount = pareString(getDiscount);

            BigDecimal total = pareString(getTotalAmount);

            Order or = new Order(userSession.getIdUser(), addID, shipping, getNote, subtotal, getPaymentMethod,
                    discount, total);

            int key = dao.insertOrders(or);
            if (key >= 0) {
                for (int i = 0; i < cart.getSize(); i++) {
                    OrderDetail od = new OrderDetail(key, cart.getItems().get(i).getProducts().getProductID(), cart.getItems().get(i).getVariantID(),
                            cart.getItems().get(i).getQuanity(), cart.getItems().get(i).getSubtotal());
                    dao.insertOrdersDetails(od);
                }
            }
            session.removeAttribute("Cart"); // xóa cart trong session
            response.sendRedirect(request.getContextPath() + "/user/orders_his");
            return;
        } catch (Exception e) {
            e.printStackTrace();
        }
        request.getRequestDispatcher("/WEB-INF/views/checkout_user.jsp").forward(request, response);

    }
    private BigDecimal pareString(String str) {
        if(str.isEmpty()) {
            return BigDecimal.ZERO;
        }else {
            return new BigDecimal(str);
        }
    }
    private void getShippingPrice(HttpServletRequest request, HttpServletResponse response) throws IOException {
        // TODO Auto-generated method stub
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String getCity = request.getParameter("city");

        ServicesTaxDao dao = new ServicesTaxDao();
        BigDecimal price = dao.getPriceByCity(getCity);

        response.setContentType("application/json;charset=UTF-8");

        response.getWriter().write("{\"price\":" + price.toPlainString() + "}");
    }
}
