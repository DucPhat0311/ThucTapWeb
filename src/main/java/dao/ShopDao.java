package dao;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

import model.Category;
import model.Products;

public class ShopDao extends BaseDao {
    public List<Category> selectAllCategory() {
        List<Category> cate = new ArrayList<Category>();
        String sql = "SELECT * FROM category";
        try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql);) {

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

    public List<Products> filterProducts(String keyword, String[] categories, String minPrice, String maxPrice) {
        List<Products> list = new ArrayList<>();

        StringBuilder sql = new StringBuilder(
                "SELECT * FROM products WHERE 1=1"
        );

        List<Object> params = new ArrayList<>();

        // lọc category
        if (categories != null && categories.length > 0) {
            sql.append(" AND categoryID IN (");

            for (int i = 0; i < categories.length; i++) {
                sql.append("?");
                if (i < categories.length - 1) sql.append(",");
                params.add(Integer.parseInt(categories[i]));
            }

            sql.append(")");
        }

        // lọc giá
        if (minPrice != null && !minPrice.isEmpty()) {
            sql.append(" AND price >= ?");
            params.add(new BigDecimal(minPrice));
        }

        if (maxPrice != null && !maxPrice.isEmpty()) {
            sql.append(" AND price <= ?");
            params.add(new BigDecimal(maxPrice));
        }

        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql.toString())) {

            // set param
            for (int i = 0; i < params.size(); i++) {
                ps.setObject(i + 1, params.get(i));
            }

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Products p = new Products();
                p.setProductID(rs.getInt("ProductsID"));
                p.setProductName(rs.getString("productsName"));
                p.setCategoryID(rs.getInt("categoryID"));
                p.setPrice(rs.getBigDecimal("price"));
                p.setImg(rs.getString("img"));
                list.add(p);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }
}
