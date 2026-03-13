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

