package dao;

import model.User;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;

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
    public User selectUserByUserID(int userID) {
        String sql = "SELECT * FROM USERS WHERE userID=?";

        try (Connection conn = getConnection(); PreparedStatement pst = conn.prepareStatement(sql);) {

            pst.setInt(1, userID);
            ResultSet result = pst.executeQuery();
            User user = new User();

            while (result.next()) {
                user.setIdUser(result.getInt("userID"));
                user.setFirstName(result.getString("firstName"));
                user.setLastName(result.getString("lastName"));
                user.setEmail(result.getString("email"));

                user.setVerify((result.getInt("verify") == 1) ? true : false);
                user.setUsername(result.getString("username"));
                user.setPassword(result.getString("password"));
                Date getBirthdate = result.getDate("birthday");
                LocalDate birthDate = (getBirthdate == null ? null : getBirthdate.toLocalDate());

                user.setBirthday(birthDate);
                user.setGender(result.getInt("gender"));
            }
            return user;
        } catch (Exception e) {
            // TODO: handle exception
            e.printStackTrace();

        }
        return null;
    }
    public boolean updateBirthdayOrGender(int userID, LocalDate birthday, int gender, String firstname,
                                          String lastname) {
        String sql = "UPDATE users SET birthday=?, gender=?,firstName=?,lastName=? WHERE userID=?";
        try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql);) {

            ps.setDate(1, Date.valueOf(birthday));
            ps.setInt(2, gender);
            ps.setString(3, firstname);
            ps.setString(4, lastname);
            ps.setInt(5, userID);

            int result = ps.executeUpdate();
            return result > 0;
        } catch (Exception e) {
            throw new RuntimeException(e);

        }
    }
}