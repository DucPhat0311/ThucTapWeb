package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDateTime;

public class RememberTokenDao extends BaseDao{
	 // Lưu hoặc cập nhật token cho User
    public void saveToken(int userID, String token, LocalDateTime expiredAt) {
        String sql = "REPLACE INTO remembertokens (userID, token, expiredAt) VALUES (?, ?, ?)";
        try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql);) {
            ps.setInt(1, userID);
            ps.setString(2, token);
            ps.setObject(3, expiredAt);
            ps.executeUpdate();
        } catch (Exception e) { e.printStackTrace(); }
    }

    // Kiểm tra token có hợp lệ không
    public Integer checkToken(int userID, String token) {
        String sql = "SELECT userID FROM remembertokens WHERE userID = ? AND token = ? AND expiredAt > NOW()";
        try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql);) {
            ps.setInt(1, userID);
            ps.setString(2, token);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) return rs.getInt("userID");
        } catch (Exception e) { e.printStackTrace(); }
        return null;
    }

    // Xóa token khi logout
    public void deleteToken(int userID) {
        String sql = "DELETE FROM remembertokens WHERE userID = ?";
        try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql);) {
            ps.setInt(1, userID);
            ps.executeUpdate();
        } catch (Exception e) { e.printStackTrace(); }
    }
}
