package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import model.ProductVariants;
import model.Products;

public class ProductVariantsDao extends BaseDao {

    // lấy tất cả variant dựa vào id sp nào đó
    public List<ProductVariants> SelectByProductIDInProductVariants(int id) {
        // TODO Auto-generated method stub
        ProductVariants productVariants = null;
        List<ProductVariants> list = new ArrayList<>();
        String sql = "Select * from products_variants WHERE productID = ?";

        try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql);) {

            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                productVariants = new ProductVariants();
                productVariants.setVariantID(rs.getInt("variantID"));
                productVariants.setProductID(rs.getInt("productID"));
                productVariants.setSize(rs.getString("size"));
                productVariants.setSku(rs.getString("sku"));
                productVariants.setPriceAdjustment(rs.getBigDecimal("priceAdjustment"));
                productVariants.setStock(rs.getInt("stock"));
                productVariants.setStatus(rs.getString("status"));
                list.add(productVariants);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    // lấy thông tin chi tiết biến thể đó và phải ACTive (client)
    public ProductVariants selectById(int variantID) {
        ProductVariants variant = null;

        String sql = "SELECT * FROM products_variants WHERE variantID = ? AND Status='active'";

        try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, variantID);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                variant = new ProductVariants();
                variant.setVariantID(rs.getInt("variantID"));
                variant.setProductID(rs.getInt("productID"));
                variant.setSize(rs.getString("size"));
                variant.setPriceAdjustment(rs.getBigDecimal("priceAdjustment"));
                variant.setStock(rs.getInt("stock"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return variant;
    }
}
