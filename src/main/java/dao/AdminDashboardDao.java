package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import model.Order;
import model.User;


public class AdminDashboardDao extends BaseDao {


//Đếm tổng số người dùng

    public int selectTotalUser() {
        String sql = "SELECT COUNT(*) FROM users";
        try (Connection conn = getConnection(); 
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ResultSet result = ps.executeQuery();
            result.next();
            return result.getInt(1);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return -1;
    }


//Tính tổng doanh thu từ đơn hàng thành công

    public int selectSumRevenue() {
        String sql = "SELECT SUM(o.totalAmount) AS doanhthu FROM orders o WHERE o.status='SUCCESS'";
        try (Connection conn = getConnection(); 
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ResultSet result = ps.executeQuery();
            result.next();
            return result.getInt(1);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return -1;
    }


//Đếm tổng số đơn hàng

    public int selectCountOrders() {
        String sql = "SELECT COUNT(*) AS TongDonHang FROM orders";
        try (Connection conn = getConnection(); 
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ResultSet result = ps.executeQuery();
            result.next();
            return result.getInt(1);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return -1;
    }


//Đếm tổng số sản phẩm

    public int selectTotalProducts() {
        String sql = "SELECT COUNT(*) AS TongSanPham FROM products";
        try (Connection conn = getConnection(); 
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ResultSet result = ps.executeQuery();
            result.next();
            return result.getInt(1);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return -1;
    }


//Lấy danh sách đơn hàng gần đây

    public List<Order> selectOrdersRecent() {
        List<Order> list = new ArrayList<>();
        String sql = "SELECT o.*, u.* FROM orders o "
                + "JOIN users u ON u.userID = o.userID ORDER BY o.createdAt DESC LIMIT 5";
        try (Connection conn = getConnection(); 
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Order or = new Order();
                or.setOrderID(rs.getInt("orderID"));
                or.setStatus(rs.getString("STATUS").toUpperCase());
                or.setCreatedAt(rs.getTimestamp("createdAt"));
                or.setTotalAmount(rs.getBigDecimal("totalAmount"));
                or.setPaymentMethod(rs.getString("paymentMethod"));

                User us = new User();
                us.setFirstName(rs.getString("firstName"));
                us.setLastName(rs.getString("lastName"));
                or.setUser(us);

                list.add(or);
            }
            return list;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
