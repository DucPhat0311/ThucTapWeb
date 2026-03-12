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
}
