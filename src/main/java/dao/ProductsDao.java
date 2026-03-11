package dao;

import model.Products;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import static util.JDBCUtil.getConnection;

public class ProductsDao {
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

}
