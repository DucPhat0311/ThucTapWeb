package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import model.Category;
import model.Products;

public class AdminProductDao extends BaseDao {

//Lấy danh sách tất cả sản phẩm với số lượng biến thể

    public List<Products> selectListProducts() {
        List<Products> listProducts = new ArrayList<>();
        String sql = "SELECT p.*, c.categoryName, IFNULL(v.SoLuongBienThe, 0) AS SoLuongBienThe "
                + "FROM products p "
                + "JOIN category c ON c.categoryID = p.categoryID "
                + "LEFT JOIN (SELECT productID, COUNT(*) AS SoLuongBienThe FROM products_variants GROUP BY productID) v "
                + "ON v.productID = p.ProductsID "
                + "ORDER BY p.ProductsID";
        try (Connection conn = getConnection(); 
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Products p1 = new Products();
                p1.setProductID(rs.getInt("ProductsID"));
                p1.setProductName(rs.getString("productsName"));

                Category cate = new Category();
                cate.setCategoryName(rs.getString("categoryName"));
                p1.setCate(cate);

                p1.setPrice(rs.getBigDecimal("price"));
                p1.setStatus(rs.getString("status").toUpperCase());
                p1.setQuantityVariantCurr(rs.getInt("SoLuongBienThe"));
                listProducts.add(p1);
            }
            return listProducts;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }


//Lấy thông tin sản phẩm theo ID (thông tin cơ bản)

    public Products selectProductsById(int getId) {
        Products listProducts = null;
        String sql = "SELECT p.* FROM products p WHERE p.productsID = ?";
        try (Connection conn = getConnection(); 
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, getId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                listProducts = new Products();
                listProducts.setStatus(rs.getString("status"));
                listProducts.setProductID(rs.getInt("productsID"));
            }
            return listProducts;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

//Lấy thông tin chi tiết sản phẩm theo ID

    public Products selectProductsByID(int pid) {
        String sql = "SELECT * FROM PRODUCTS WHERE productsID = ?";
        Products p = null;
        try (Connection conn = getConnection(); 
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, pid);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                p = new Products();
                p.setProductName(rs.getString("productsName"));
                p.setCategoryID(rs.getInt("categoryID"));
                p.setPrice(rs.getBigDecimal("price"));
                p.setStatus(rs.getString("status").toUpperCase());
                p.setDescription(rs.getString("description"));
                p.setImg(rs.getString("img"));
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return p;
    }

//Khóa sản phẩm

    public boolean lockProductsByProductsID(int getId) {
        String sql = "UPDATE PRODUCTS SET status = 'LOCK' WHERE productsID = ?";
        try (Connection conn = getConnection(); 
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, getId);
            int re = ps.executeUpdate();
            return re > 0;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

//Mở khóa sản phẩm

    public boolean unLockProductsByProductsID(int getId) {
        String sql = "UPDATE PRODUCTS SET status = 'ACTIVE' WHERE productsID = ?";
        try (Connection conn = getConnection(); 
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, getId);
            int re = ps.executeUpdate();
            return re > 0;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

//Thêm sản phẩm mới

    public boolean insertProduct(Products p) {
        String sql = "INSERT INTO Products (productsName, categoryID, price, status, img, description) "
                + "VALUES (?, ?, ?, ?, ?, ?)";
        try (Connection conn = getConnection(); 
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, p.getProductName());
            ps.setInt(2, p.getCategoryID());
            ps.setBigDecimal(3, p.getPrice());
            ps.setString(4, p.getStatus());
            ps.setString(5, p.getImg());
            ps.setString(6, p.getDescription());
            int re = ps.executeUpdate();
            return re > 0;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

//Cập nhật thông tin sản phẩm

    public boolean updateModifyProducts(Products p, int pid) {
        String sql;
        if (p.getImg().isEmpty()) {
            sql = "UPDATE PRODUCTS SET productsName=?, categoryID=?, price=?, status=?, description=? WHERE productsID=?";
        } else {
            sql = "UPDATE PRODUCTS SET productsName=?, categoryID=?, price=?, status=?, img=?, description=? WHERE productsID=?";
        }
        try (Connection conn = getConnection(); 
             PreparedStatement ps = conn.prepareStatement(sql)) {
            if (p.getImg().isEmpty()) {
                ps.setString(1, p.getProductName());
                ps.setInt(2, p.getCategoryID());
                ps.setBigDecimal(3, p.getPrice());
                ps.setString(4, p.getStatus());
                ps.setString(5, p.getDescription());
                ps.setInt(6, pid);
            } else {
                ps.setString(1, p.getProductName());
                ps.setInt(2, p.getCategoryID());
                ps.setBigDecimal(3, p.getPrice());
                ps.setString(4, p.getStatus());
                ps.setString(5, p.getImg());
                ps.setString(6, p.getDescription());
                ps.setInt(7, pid);
            }
            int re = ps.executeUpdate();
            return re > 0;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

//Lấy tất cả danh mục

    public List<Category> selectAllCategory() {
        List<Category> cate = new ArrayList<>();
        String sql = "SELECT * FROM category";
        try (Connection conn = getConnection(); 
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Category c1 = new Category();
                c1.setCategoryID(rs.getInt("CategoryID"));
                c1.setCategoryName(rs.getString("categoryName"));
                cate.add(c1);
            }
            return cate;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
