package dao;

import model.Products;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import static util.JDBCUtil.getConnection;

public class ProductsDao extends BaseDao {
    public List<Products> SelectAll(int offset, int limit) {
        List<Products> products = new ArrayList<>();
        String sql = "Select * from Products WHERE status='ACTIVE' order by ProductsID Limit ? offset ?;";
        try (Connection conn = getConnection();

             PreparedStatement ps = conn.prepareStatement(sql);) {
            int getOff = offset * limit;

            ps.setInt(1, limit);
            ps.setInt(2, getOff);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                products.add(new Products(rs.getInt("ProductsID"), rs.getString("productsName"),
                        rs.getInt("categoryID"), rs.getBigDecimal("price"), rs.getString("status"), rs.getString("img"),
                        rs.getString("DESCRIPTION")));

            }
        } catch (Exception e) {
            // TODO: handle exception
            e.printStackTrace();
        }
        return products;
    }


    // lấy các sản phẩm tương tự
    public List<Products> SelectByCategory(int type) {
        // TODO Auto-generated method stub
        List<Products> list = new ArrayList<Products>();
        String sql = "Select * from Products WHERE CategoryID=? LIMIT 4";

        try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql);) {

            ps.setInt(1, type);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Products(rs.getInt("ProductsID"), rs.getString("productsName"), rs.getInt("categoryID"),
                        rs.getBigDecimal("price"), rs.getString("status"), rs.getString("img"),
                        rs.getString("DESCRIPTION")));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public Products SelectByProductID(int id) {
        String sql = "SELECT * FROM products WHERE ProductsID = ? LIMIT 1";
        Products product = null;

        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                product = new Products(
                        rs.getInt("ProductsID"),
                        rs.getString("productsName"),
                        rs.getInt("categoryID"),
                        rs.getBigDecimal("price"),
                        rs.getString("status"),
                        rs.getString("img"),
                        rs.getString("DESCRIPTION")
                );
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return product;
    }

    // tìm thông tin chung của sp dựa vào 1 sp rất cụ thể
    public Products selectByVariantId(int variantID) {
        Products p = null;

        String sql = "SELECT p.* FROM products p JOIN Products_variants pv ON p.productsID = pv.productID WHERE pv.variantID =?";

        try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, variantID);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                p = new Products();
                p.setProductID(rs.getInt("productsID"));
                p.setProductName(rs.getString("productsName"));
                p.setCategoryID(rs.getInt("categoryID"));
                p.setPrice(rs.getBigDecimal("price"));
                p.setStatus(rs.getString("status"));
                p.setImg(rs.getString("img"));
                p.setDescription(rs.getString("description"));

            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return p;
    }

}
