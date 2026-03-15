package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import model.User;

public class AdminUserDao extends BaseDao {

//Lấy danh sách tất cả người dùng

    public List<User> selectListUser() {
        List<User> list = new ArrayList<>();
        String sql = "SELECT u.*, COALESCE(oa.SoDonDaMua, 0) AS SoDonDaMua " +
                     "FROM users u " +
                     "LEFT JOIN (" +
                     "    SELECT userID, COUNT(*) AS SoDonDaMua " +
                     "    FROM orders " +
                     "    GROUP BY userID" +
                     ") oa ON u.userID = oa.userID;";
        try (Connection conn = getConnection(); 
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                User s1 = new User();
                s1.setIdUser(rs.getInt("userID"));
                s1.setFirstName(rs.getString("firstName"));
                s1.setLastName(rs.getString("lastName"));
                s1.setEmail(rs.getString("email"));
                s1.setPhone(rs.getString("Phone"));
                s1.setPuchasedOrders(rs.getInt("SoDonDaMua"));
                s1.setStatus(rs.getInt("status"));
                s1.setCreatedAt(rs.getTimestamp("createAt"));
                list.add(s1);
            }
            return list;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

 
//Khóa tài khoản người dùng (status = 0)

    public boolean bannedAccount(int userID) {
        String sql = "UPDATE USERS SET status = 0 WHERE userID = ?";
        try (Connection conn = getConnection(); 
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, userID);
            int re = ps.executeUpdate();
            return re > 0;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }


//Mở khóa tài khoản người dùng (status = 1)

    public boolean unBannedAccount(int userID) {
        String sql = "UPDATE USERS SET status = 1 WHERE userID = ?";
        try (Connection conn = getConnection(); 
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, userID);
            int re = ps.executeUpdate();
            return re > 0;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }


//Xóa tài khoản người dùng (soft delete, status = -1)

    public boolean deleteAccount(int userID) {
        String sql = "UPDATE users SET status = -1 WHERE userID = ?";
        try (Connection conn = getConnection(); 
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, userID);
            int re = ps.executeUpdate();
            return re > 0;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}


