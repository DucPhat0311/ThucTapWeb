package controller;

import java.io.File;
import java.io.IOException;
import java.math.BigDecimal;
import java.nio.file.Paths;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import dao.AdminProductDao;
import model.Category;
import model.Products;

@MultipartConfig(
    fileSizeThreshold = 1024 * 1024,      // 1MB
    maxFileSize = 1024 * 1024 * 5,         // 5MB
    maxRequestSize = 1024 * 1024 * 10      // 10MB
)
@WebServlet("/admin/product/*")
public class AdminProductController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public AdminProductController() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String path = request.getPathInfo();
        AdminProductDao dao = new AdminProductDao();

        if (path == null || path.equals("/") || path.equals("")) {
            showProductList(request, response, dao);
            return;
        }

        String id;
        switch (path) {
            case "/list":
                showProductList(request, response, dao);
                break;
            case "/lock":
                id = request.getParameter("id");
                lockProduct(id, dao);
                response.sendRedirect(request.getContextPath() + "/admin/product");
                break;
            case "/unLock":
                id = request.getParameter("id");
                unlockProduct(id, dao);
                response.sendRedirect(request.getContextPath() + "/admin/product");
                break;
            default:
                response.sendRedirect(request.getContextPath() + "/admin/product");
                break;
        }
    }

//Hiển thị danh sách sản phẩm

    private void showProductList(HttpServletRequest request, HttpServletResponse response, AdminProductDao dao)
            throws ServletException, IOException {
        List<Products> listProducts = dao.selectListProducts();
        List<Category> categoryList = dao.selectAllCategory();
        request.setAttribute("productsList", listProducts);
        request.setAttribute("categoryList", categoryList);
        request.setAttribute("choose", 3);
        request.getRequestDispatcher("/WEB-INF/admin/adminproducts.jsp").forward(request, response);
    }

//Khóa sản phẩm

    private void lockProduct(String id, AdminProductDao dao) {
        try {
            int productId = Integer.parseInt(id);
            dao.lockProductsByProductsID(productId);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

//Mở khóa sản phẩm

    private void unlockProduct(String id, AdminProductDao dao) {
        try {
            int productId = Integer.parseInt(id);
            dao.unLockProductsByProductsID(productId);
        } catch (Exception e) {
            e.printStackTrace();
        }
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
                addProducts(request, response);
                break;
            case "/getModify":
                getProductModify(request, response);
                break;
            case "/modify":
                modifyProducts(request, response);
                break;
            default:
                doGet(request, response);
                break;
        }
    }

//Thêm sản phẩm mới

    private void addProducts(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {
        request.setCharacterEncoding("UTF-8");
        AdminProductDao dao = new AdminProductDao();

        String name = request.getParameter("productName");
        int categoryID = Integer.parseInt(request.getParameter("categoryID"));
        BigDecimal price = new BigDecimal(request.getParameter("price"));
        String status = request.getParameter("status");
        String description = request.getParameter("description");

        Part image = request.getPart("image");
        String fileName = System.currentTimeMillis() + "_" +
                Paths.get(image.getSubmittedFileName())
                        .getFileName()
                        .toString();

        String getUploadFolder = request.getServletContext().getInitParameter("upload");
        if (getUploadFolder == null || getUploadFolder.trim().isEmpty()) {
            getUploadFolder = "uploads"; 
        }
        
        String uploadPath = request.getServletContext().getRealPath("/") + getUploadFolder;
        String fileUrl = getUploadFolder + "/" + fileName;

        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdirs();
        }
        image.write(uploadPath + File.separator + fileName);

        Products p = new Products();
        p.setProductName(name);
        p.setCategoryID(categoryID);
        p.setPrice(price);
        p.setStatus(status);
        p.setDescription(description);
        p.setImg(fileUrl);
        dao.insertProduct(p);

        response.sendRedirect(request.getContextPath() + "/admin/product");
    }

//Lấy thông tin sản phẩm để sửa 

    private void getProductModify(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        int productId = Integer.parseInt(request.getParameter("productID"));
        AdminProductDao dao = new AdminProductDao();
        Products p = dao.selectProductsByID(productId);

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        response.getWriter().write(
                "{"
                        + "\"productName\":\"" + p.getProductName() + "\","
                        + "\"categoryID\":" + p.getCategoryID() + ","
                        + "\"price\":" + p.getPrice() + ","
                        + "\"status\":\"" + p.getStatus() + "\","
                        + "\"description\":\"" + p.getDescription() + "\","
                        + "\"img\":\"" + p.getImg() + "\""
                        + "}"
        );
    }

//Sửa thông tin sản phẩm

    private void modifyProducts(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {
        request.setCharacterEncoding("UTF-8");
        AdminProductDao dao = new AdminProductDao();

        int pid = Integer.parseInt(request.getParameter("pid"));
        String name = request.getParameter("productName");
        int categoryID = Integer.parseInt(request.getParameter("categoryID"));
        BigDecimal price = new BigDecimal(request.getParameter("price"));
        String status = request.getParameter("status");
        String description = request.getParameter("description");
        String fileUrl = "";

        Part image = request.getPart("image");
        if (image != null && image.getSize() > 0) {
            String fileName = System.currentTimeMillis() + "_" +
                    Paths.get(image.getSubmittedFileName())
                            .getFileName()
                            .toString();

            String getUploadFolder = request.getServletContext().getInitParameter("upload");
            String uploadPath = request.getServletContext().getRealPath(getUploadFolder);
            fileUrl = getUploadFolder + "/" + fileName;

            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) {
                uploadDir.mkdirs();
            }
            image.write(uploadPath + File.separator + fileName);
        }

        Products p = new Products();
        p.setProductName(name);
        p.setCategoryID(categoryID);
        p.setPrice(price);
        p.setStatus(status);
        p.setDescription(description);
        p.setImg(fileUrl);

        if (dao.updateModifyProducts(p, pid)) {
            response.sendRedirect(request.getContextPath() + "/admin/product");
        }
    }
}
