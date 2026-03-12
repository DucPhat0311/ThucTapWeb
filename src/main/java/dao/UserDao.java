package dao;

import model.User;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class UserDao extends BaseDao {

    public boolean addUser(User user) {
        String sql = "INSERT INTO USERS(firstname,lastname,email,verify,username,password) VALUES (?,?,?,?,?,?)";

        int result = 0;
        try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, user.getFirstName());
            ps.setString(2, user.getLastName());
            ps.setString(3, user.getEmail());
            ps.setInt(4, user.getVerify() ? 1 : 0); // Thử đổi từ setBoolean sang setInt
            ps.setString(5, user.getUsername());
            ps.setString(6, user.getPassword());

            result = ps.executeUpdate();

            System.out.println("số dòng ảnh hưởng:" + sql);
            System.out.println("số dòng ảnh hưởng:" + result);

        } catch (Exception e) {
            e.printStackTrace();
        }
        return result > 0;
    }
}
