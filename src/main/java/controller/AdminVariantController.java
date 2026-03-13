package controller;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.AdminVariantDao;
import model.ProductVariants;
import model.Products;

@WebServlet("/admin/variant/*")
public class AdminVariantController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public AdminVariantController() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String path = request.getPathInfo();
        AdminVariantDao dao = new AdminVariantDao();

        if (path == null || path.equals("/") || path.equals("")) {
            // Nếu không có productID, redirect về trang product
            String productId = request.getParameter("id");
            if (productId == null) {
                response.sendRedirect(request.getContextPath() + "/admin/product");
                return;
            }
            showVariantList(request, response, dao);
            return;
        }

        String id;
        switch (path) {
            case "/list":
                showVariantList(request, response, dao);
                break;
            case "/lock":
                id = request.getParameter("id");
                lockVariant(request, response, id, dao);
                break;
            case "/unLock":
                id = request.getParameter("id");
                unlockVariant(request, response, id, dao);
                break;
            default:
                response.sendRedirect(request.getContextPath() + "/admin/product");
                break;
        }
    }

//Hiển thị danh sách biến thể của sản phẩm

    private void showVariantList(HttpServletRequest request, HttpServletResponse response, AdminVariantDao dao)
            throws ServletException, IOException {
        String id = request.getParameter("id");
        try {
            int productId = Integer.parseInt(id);
            List<ProductVariants> listPv = dao.selectProductVariantsByProductsID(productId);
            Products p = dao.selectProductsById(productId);
            request.setAttribute("pvList", listPv);
            request.setAttribute("pp", p);
        } catch (Exception e) {
            e.printStackTrace();
        }
        request.setAttribute("choose", 3);
        request.getRequestDispatcher("/WEB-INF/admin/adminVariant.jsp").forward(request, response);
    }

//Khóa biến thể sản phẩm

    private void lockVariant(HttpServletRequest request, HttpServletResponse response, String id, AdminVariantDao dao)
            throws IOException {
        String productId = request.getParameter("pid");
        try {
            int variantId = Integer.parseInt(id);
            dao.lockVariant(variantId);
        } catch (Exception e) {
            e.printStackTrace();
        }
        response.sendRedirect(request.getContextPath() + "/admin/variant?id=" + productId);
    }

//Mở khóa biến thể sản phẩm

    private void unlockVariant(HttpServletRequest request, HttpServletResponse response, String id, AdminVariantDao dao)
            throws IOException {
        String productId = request.getParameter("pid");
        try {
            int variantId = Integer.parseInt(id);
            dao.unLockVariant(variantId);
        } catch (Exception e) {
            e.printStackTrace();
        }
        response.sendRedirect(request.getContextPath() + "/admin/variant?id=" + productId);
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
            case "/add":
                addVariant(request, response);
                break;
            case "/getModify":
                getVariantModify(request, response);
                break;
            case "/modify":
                modifyVariant(request, response);
                break;
            default:
                doGet(request, response);
                break;
        }
    }

//Thêm biến thể sản phẩm mới

    private void addVariant(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        request.setCharacterEncoding("UTF-8");
        AdminVariantDao dao = new AdminVariantDao();

        int productID = Integer.parseInt(request.getParameter("productID"));
        String size = request.getParameter("size");
        int stock = Integer.parseInt(request.getParameter("stock"));
        BigDecimal priceAdjustment = new BigDecimal(request.getParameter("priceAdjustment"));
        String status = request.getParameter("status");

        ProductVariants pv = new ProductVariants(productID, size, priceAdjustment, stock, status);
        if (dao.insertVariant(pv)) {
            response.sendRedirect(request.getContextPath() + "/admin/variant?id=" + productID);
        }
    }

//Lấy thông tin biến thể để sửa (AJAX)

    private void getVariantModify(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        int variantID = Integer.parseInt(request.getParameter("variantID"));
        int productID = Integer.parseInt(request.getParameter("productID"));

        AdminVariantDao dao = new AdminVariantDao();
        ProductVariants pv = dao.selectToModify(variantID, productID);

        response.setContentType("application/json");
        response.getWriter().write(
                "{"
                        + "\"size\":\"" + pv.getSize() + "\","
                        + "\"stock\":" + pv.getStock() + ","
                        + "\"price\":" + pv.getPriceAdjustment() + ","
                        + "\"status\":\"" + pv.getStatus() + "\""
                        + "}"
        );
    }

//Sửa thông tin biến thể sản phẩm

    private void modifyVariant(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {
        request.setCharacterEncoding("UTF-8");
        AdminVariantDao dao = new AdminVariantDao();

        int variantID = Integer.parseInt(request.getParameter("variantID"));
        int productID = Integer.parseInt(request.getParameter("productID"));
        String size = request.getParameter("size");
        int stock = Integer.parseInt(request.getParameter("stock"));
        BigDecimal priceAdjustment = new BigDecimal(request.getParameter("priceAdjustment"));
        String status = request.getParameter("status");

        ProductVariants pv = new ProductVariants();
        pv.setSize(size);
        pv.setPriceAdjustment(priceAdjustment);
        pv.setStock(stock);
        pv.setStatus(status);

        if (dao.updateVariant(pv, productID, variantID)) {
            response.sendRedirect(request.getContextPath() + "/admin/variant?id=" + productID);
        }
    }
}
