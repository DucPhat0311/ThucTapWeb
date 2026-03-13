package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import model.ProductVariants;
import model.Products;


public class AdminVariantDao extends BaseDao {

//Lấy danh sách biến thể của sản phẩm theo productID

    public List<ProductVariants> selectProductVariantsByProductsID(int productID) {
        List<ProductVariants> listProducts = new ArrayList<>();
        String sql = "SELECT pv.variantID, pv.productID, pv.size, pv.status, pv.stock, pv.priceAdjustment, "
                + "p.img, p.productsName, COALESCE(SUM(od.quantity), 0) AS sold, "
                + "(p.price + pv.priceAdjustment) AS finalPrice "
                + "FROM products_variants pv "
                + "LEFT JOIN order_details od ON od.variantID = pv.variantID "
                + "JOIN products p ON p.ProductsID = pv.productID "
                + "WHERE pv.productID = ? "
                + "GROUP BY pv.variantID, pv.productID, pv.size, pv.status, pv.stock, "
                + "pv.priceAdjustment, p.img, p.productsName, p.price";
        try (Connection conn = getConnection(); 
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, productID);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ProductVariants pv = new ProductVariants();
                Products p = new Products();
                p.setImg(rs.getString("img"));
                p.setProductName(rs.getString("productsName"));

                pv.setProducts(p);
                pv.setSold(rs.getInt("sold"));
                pv.setVariantID(rs.getInt("variantID"));
                pv.setProductID(rs.getInt("productID"));
                pv.setFinalPrice(rs.getBigDecimal("finalPrice"));
                pv.setPriceAdjustment(rs.getBigDecimal("priceAdjustment"));
                pv.setStatus(rs.getString("status").toUpperCase());
                pv.setStock(rs.getInt("stock"));
                pv.setSize(rs.getNString("size"));

                listProducts.add(pv);
            }
            return listProducts;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

//Lấy thông tin sản phẩm cơ bản theo ID để hiển thị tên sản phẩm trong trang quản lý biến thể

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

//Khóa biến thể sản phẩm

    public boolean lockVariant(int variantId) {
        String sql = "UPDATE products_variants SET status = 'LOCK' WHERE variantID = ?";
        try (Connection conn = getConnection(); 
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, variantId);
            int re = ps.executeUpdate();
            return re > 0;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

//Mở khóa biến thể sản phẩm

    public boolean unLockVariant(int variantId) {
        String sql = "UPDATE products_variants SET status = 'ACTIVE' WHERE variantID = ?";
        try (Connection conn = getConnection(); 
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, variantId);
            int re = ps.executeUpdate();
            return re > 0;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

//Thêm biến thể sản phẩm mới

    public boolean insertVariant(ProductVariants pv) {
        String sql = "INSERT INTO products_variants (productID, size, priceAdjustment, stock, status) "
                + "VALUES (?, ?, ?, ?, ?)";
        try (Connection conn = getConnection(); 
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, pv.getProductID());
            ps.setString(2, pv.getSize());
            ps.setBigDecimal(3, pv.getPriceAdjustment());
            ps.setInt(4, pv.getStock());
            ps.setString(5, pv.getStatus());
            int re = ps.executeUpdate();
            return re > 0;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

//Cập nhật thông tin biến thể sản phẩm

    public boolean updateVariant(ProductVariants pv, int productsID, int variantID) {
        String sql = "UPDATE products_variants SET size=?, priceAdjustment=?, stock=?, status=? "
                + "WHERE variantID=? AND productID=?";
        try (Connection conn = getConnection(); 
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, pv.getSize());
            ps.setBigDecimal(2, pv.getPriceAdjustment());
            ps.setInt(3, pv.getStock());
            ps.setString(4, pv.getStatus());
            ps.setInt(5, variantID);
            ps.setInt(6, productsID);
            int re = ps.executeUpdate();
            return re > 0;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

//Lấy thông tin biến thể để sửa

    public ProductVariants selectToModify(int variantID, int productID) {
        ProductVariants pv = null;
        String sql = "SELECT * FROM products_variants WHERE variantID = ? AND productID = ?";
        try (Connection conn = getConnection(); 
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, variantID);
            ps.setInt(2, productID);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                pv = new ProductVariants();
                pv.setVariantID(rs.getInt("variantID"));
                pv.setProductID(rs.getInt("productID"));
                pv.setSize(rs.getString("size"));
                pv.setStock(rs.getInt("stock"));
                pv.setPriceAdjustment(rs.getBigDecimal("priceAdjustment"));
                pv.setStatus(rs.getString("status"));
            }
            return pv;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
