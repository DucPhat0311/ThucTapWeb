package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import model.Address;
import model.Order;
import model.OrderDetail;
import model.ProductVariants;
import model.Products;
import model.User;

public class AdminOrderDao extends BaseDao {

//Lấy danh sách tất cả đơn hàng

    public List<Order> getOrders() {
        List<Order> or = new ArrayList<>();
        String sql = "SELECT o.*, u.* FROM orders o JOIN users u ON u.userID = o.userID ORDER BY o.createdAt DESC";
        try (Connection conn = getConnection(); 
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                User u1 = new User();
                u1.setFirstName(rs.getString("firstName"));
                u1.setLastName(rs.getString("lastName"));
                u1.setPhone(rs.getString("phone"));

                Order o1 = new Order();
                o1.setUser(u1);
                o1.setOrderID(rs.getInt("orderID"));
                o1.setCreatedAt(rs.getTimestamp("createdAt"));
                o1.setTotalAmount(rs.getBigDecimal("totalAmount"));
                o1.setPaymentMethod(rs.getString("paymentMethod").toUpperCase());
                o1.setStatus(rs.getString("status").toUpperCase());
                or.add(o1);
            }
            return or;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }


//Lấy chi tiết đơn hàng theo orderID

    public List<OrderDetail> getOrdersDetailsByOrderID(int orderID) {
        List<OrderDetail> or = new ArrayList<>();
        String sql = "SELECT od.*, pv.size, p.productsName, p.img, p.price + pv.priceAdjustment AS subVariant "
                + "FROM order_details od "
                + "JOIN products p ON p.ProductsID = od.productID "
                + "JOIN products_variants pv ON pv.variantID = od.variantID "
                + "WHERE orderID = ?";
        try (Connection conn = getConnection(); 
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, orderID);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                OrderDetail od = new OrderDetail();
                Products p = new Products();
                p.setImg(rs.getString("img"));
                p.setProductName(rs.getString("productsName"));
                od.setProduct(p);

                ProductVariants pv = new ProductVariants();
                pv.setSize(rs.getString("size"));
                od.setVariant(pv);

                od.setQuantity(rs.getInt("quantity"));
                od.setPrice(rs.getBigDecimal("price"));
                or.add(od);
            }
            return or;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

//Lấy thông tin đơn hàng đầy đủ (bao gồm user, address) theo orderID

    public Order getOrdersFromOrderIDToOrderDetails(int orderID) {
        Order or = null;
        String sql = "SELECT o.orderID, u.firstName, u.lastName, u.email, u.Phone, "
                + "o.shipping_fee, o.discountAmount, o.totalAmount, ass.*, o.`STATUS`, "
                + "o.paymentMethod, s.city_name, o.subtotal "
                + "FROM orders o "
                + "JOIN users u ON u.userID = o.userID "
                + "JOIN address ass ON ass.addressID = o.addressID "
                + "JOIN shipping s ON s.city_code = ass.city_code "
                + "WHERE o.orderID = ?";
        try (Connection conn = getConnection(); 
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, orderID);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                or = new Order();
                or.setPaymentMethod(rs.getString("paymentMethod").toUpperCase());
                or.setShipping_fee(rs.getBigDecimal("shipping_fee"));
                or.setDiscountAmount(rs.getBigDecimal("discountAmount"));
                or.setTotalAmount(rs.getBigDecimal("totalAmount"));
                or.setStatus(rs.getString("status"));
                or.setSubtotal(rs.getBigDecimal("subtotal"));
                or.setOrderID(rs.getInt("orderID"));

                User u1 = new User();
                u1.setFirstName(rs.getString("firstName"));
                u1.setLastName(rs.getString("lastName"));
                u1.setEmail(rs.getString("email"));
                u1.setPhone(rs.getString("phone"));

                Address add = new Address();
                add.setFullAddress(rs.getString("fulladdress"));
                add.setWard(rs.getString("ward"));
                add.setCityName(rs.getString("city_name"));
                add.setCountry(rs.getString("country"));

                or.setUser(u1);
                or.setAddress(add);
            }
            return or;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

//Cập nhật trạng thái đơn hàng

    public boolean updateNewStatusOrder(int orderID, String status) {
        String sql = "UPDATE orders SET status = ? WHERE orderID = ?";
        try (Connection conn = getConnection(); 
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, status);
            ps.setInt(2, orderID);
            int re = ps.executeUpdate();
            return re > 0;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
