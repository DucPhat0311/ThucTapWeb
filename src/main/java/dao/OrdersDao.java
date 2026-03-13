package dao;

import model.Order;
import model.OrderDetail;
import model.ProductVariants;
import model.Products;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

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
    public List<OrderDetail> getProductFromOrderDetails(int orderID) {
        List<OrderDetail> od = new ArrayList<OrderDetail>();
        OrderDetail od1 = null;
        String sql = "SELECT od.*, p.productsName, p.img, pv.size FROM order_details od "
                + "JOIN products p ON p.productsID = od.productID "
                + "JOIN products_variants pv ON pv.variantID = od.variantID WHERE od.orderID = ?";
        try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql);) {

            ps.setInt(1, orderID);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                od1 = new OrderDetail();
                od1.setOrderID(rs.getInt("orderID"));
                od1.setOrderDetailID(rs.getInt("orderDetailID"));
                od1.setProductID(rs.getInt("productID"));
                od1.setQuantity(rs.getInt("quantity"));
                od1.setVariantID(rs.getInt("variantID"));
                od1.setPrice(rs.getBigDecimal("price"));

                Products p = new Products();
                p.setImg(rs.getString("img"));
                p.setProductName(rs.getString("productsName"));

                ProductVariants pv = new ProductVariants();
                pv.setSize(rs.getString("size"));

                od1.setProduct(p);
                od1.setVariant(pv);

                od.add(od1);
            }

            return od;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

    }
}
