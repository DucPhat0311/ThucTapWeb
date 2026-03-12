package dao;

import model.Order;
import model.OrderDetail;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

public class OrdersDao extends BaseDao {
    public int insertOrders(Order order) {
        String sql = "INSERT INTO orders(userID,addressID,shipping_fee,note,subtotal,paymentMethod,discountAmount,totalAmount) VALUES(?,?,?,?,?,?,?,?)";
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);) {

            ps.setInt(1, order.getUserID());
            ps.setInt(2, order.getAddressID());
            ps.setBigDecimal(3, order.getShipping_fee());
            ps.setString(4, order.getNote());
            ps.setBigDecimal(5, order.getSubtotal());
            ps.setString(6, order.getPaymentMethod());
            ps.setBigDecimal(7, order.getDiscountAmount());
            ps.setBigDecimal(8, order.getTotalAmount());
            int affected = ps.executeUpdate();

            if (affected > 0) {
                try (ResultSet rs = ps.getGeneratedKeys()) {
                    if (rs.next()) {
                        return rs.getInt(1);
                    }
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return -1;
    }
    public void insertOrdersDetails(OrderDetail order) {
        String sql = "INSERT INTO order_details(orderID,productID,quantity,variantID,price) VALUES(?,?,?,?,?)";
        try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql);) {

            ps.setInt(1, order.getOrderID());
            ps.setInt(2, order.getProductID());
            ps.setInt(3, order.getQuantity());
            ps.setInt(4, order.getVariantID());
            ps.setBigDecimal(5, order.getPrice());

            ps.executeUpdate();

        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
