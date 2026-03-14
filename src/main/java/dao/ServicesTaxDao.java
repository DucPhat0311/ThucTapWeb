package dao;

import model.reviews;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class ServicesTaxDao extends BaseDao {

	public BigDecimal getPriceByCity(String city) {
		String sql = "SELECT price FROM shipping WHERE city_name =?";
		try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql);) {

			ps.setString(1, city);
			ResultSet result = ps.executeQuery();
			if (result.next()) {
				return result.getBigDecimal(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return BigDecimal.ZERO;
	}

	public BigDecimal isCodeValid(String voucherCode) {
		String sql = "SELECT discount FROM vouchers WHERE code =? AND status=1";
		try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql);) {

			ps.setString(1, voucherCode);
			ResultSet result = ps.executeQuery();
			if (result.next()) {
				return result.getBigDecimal(1);
			}
		} catch (Exception e) {
			e.printStackTrace();

		}
		return BigDecimal.ZERO;

	}

	public boolean insertReviewProducts(reviews re) {
		String sql = "INSERT INTO reviews(order_detail_id,user_id,product_id,rating) VALUES(?,?,?,?)";
		try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql);) {

			ps.setInt(1, re.getOrder_detail_id());
			ps.setInt(2, re.getUser_id());
			ps.setInt(3, re.getProduct_id());
			ps.setInt(4, re.getRating());
			int result = ps.executeUpdate();
			return result>0;
		} catch (Exception e) {
			throw new RuntimeException(e);

		}
	}
}
