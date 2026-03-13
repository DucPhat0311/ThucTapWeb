package dao;

import model.Address;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class AddressDao extends BaseDao {
    public List<Address> selectAddressByUserID(int id) {
        List<Address> list = new ArrayList<Address>();
        String sql = "select a.addressID,a.fulladdress,s.city_name as city, a.ward,a.phone,a.userID,a.isDefault, a.country from address a "
                + "JOIN shipping s ON s.city_code = a.city_code where userID =?  ORDER BY isDefault DESC";
        try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql);) {

            ps.setInt(1, id);
            ResultSet result = ps.executeQuery();
            while (result.next()) {
                Address add = new Address();
                add.setAddressID(result.getInt("addressID"));
                add.setFullAddress(result.getString("fulladdress"));
                add.setCity(result.getString("city"));
                add.setWard(result.getString("ward"));
                add.setPhone(result.getString("phone"));
                add.setUserID(result.getInt("userID"));
                add.setIsDefault(result.getBoolean("isDefault"));
                add.setCountry(result.getString("country"));
                list.add(add);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public int addAddressByUserID(Address address) {
        String sql = "insert into address(fulladdress,city_code,ward,phone,userID,isDefault,country) values(?,?,?,?,?,?,?)";
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {

            ps.setString(1, address.getFullAddress());
            ps.setString(2, address.getCity());

            ps.setString(3, address.getWard());
            ps.setString(4, address.getPhone());
            ps.setInt(5, address.getUserID());

            ps.setBoolean(6, address.getIsDefault());
            ps.setString(7, address.getCountry());
            ps.executeUpdate();

            // Lấy ID vừa tạo
            ResultSet result = ps.getGeneratedKeys();
            if (result.next()) {
                return result.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return -1;
    }

    public int isFirstAddress(int userID) {
        String sql = "SELECT COUNT(*) FROM address WHERE userID = ?";
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);) {

            ps.setInt(1, userID);
            ResultSet rs = ps.executeQuery();

            rs.next();
            return rs.getInt(1);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
    public boolean deleteAddressByID( int id ) {
        String sql = "delete FROM address where addressID=?";
        try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql);) {

            ps.setInt(1, id);

            int result = ps.executeUpdate();
            return result >0;
        } catch (Exception e) {
            throw new RuntimeException(e);

        }
    }
    public boolean updateAllIsDefaultAddress(int userID) {
        String sql = "UPDATE  address SET isDefault = 0 where userID=?";
        try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql);) {

            ps.setInt(1, userID);

            int result = ps.executeUpdate();
            return result >0;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
    public boolean updateCurrentAddressByID(int id, int userID) {
        // reset lại các point
        updateAllIsDefaultAddress(userID);
        String sql = "UPDATE  address SET isDefault = 1 where addressID=?  AND userID=? ";
        try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql);) {

            ps.setInt(1, id);
            ps.setInt(2, userID);

            int result = ps.executeUpdate();
            return result >0;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
    public Address selectAddressByAddressID(int addressId)  {
        Address add = new Address();
        String sql = "select a.addressID,a.fulladdress,s.city_name as city, a.ward,a.phone,a.userID,a.isDefault, a.country from address a "
                + "JOIN shipping s ON s.city_code = a.city_code where addressID =? ";
        try( Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);){

            ps.setInt(1, addressId);
            ResultSet rs = ps.executeQuery();

            while(rs.next()) {

                add.setAddressID(rs.getInt("addressID"));
                add.setFullAddress(rs.getString("fulladdress"));
                add.setWard(rs.getString("ward"));
                add.setCity(rs.getString("city"));
                add.setCountry(rs.getString("country"));
                add.setPhone(rs.getString("phone"));
                add.setIsDefault(rs.getBoolean("isDefault"));
            }
            return add;
        }catch(Exception e) {
            throw new RuntimeException(e);
        }
    }
}


