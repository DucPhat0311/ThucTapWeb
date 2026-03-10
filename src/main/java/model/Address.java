package model;

public class Address {
    private Integer addressID;
    private Integer userID;
    private String fullAddress;
    private String city_code;
    private String ward;
    private String phone;
    private Boolean isDefault;
    private String country;

    private String cityName;
    public Address(Integer addressID, Integer userID, String fullAddress, String city, String ward,
                   String phone, Boolean isDefault) {
        super();
        this.addressID = addressID;
        this.userID = userID;
        this.fullAddress = fullAddress;
        this.city_code = city;
        this.ward = ward;
        this.phone = phone;
        this.isDefault = isDefault;
    }
    public Address( String fullAddress, String city, String ward,
                    String phone,Integer userID,String country, boolean isDefault) {
        super();
        this.fullAddress = fullAddress;
        this.city_code = city;
        this.ward = ward;
        this.phone = phone;
        this.userID = userID;
        this.country =country;
        this.isDefault = isDefault;
    }
    public Address() {
        super();
    }

    public Integer getAddressID() {
        return addressID;
    }

    public void setAddressID(Integer addressID) {
        this.addressID = addressID;
    }

    public Integer getUserID() {
        return userID;
    }

    public void setUserID(Integer userID) {
        this.userID = userID;
    }

    public String getFullAddress() {
        return fullAddress;
    }

    public void setFullAddress(String fullAddress) {
        this.fullAddress = fullAddress;
    }

    public String getCity() {
        return city_code;
    }

    public void setCity(String city) {
        this.city_code = city;
    }


    public String getWard() {
        return ward;
    }

    public void setWard(String ward) {
        this.ward = ward;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public Boolean getIsDefault() {
        return isDefault;
    }

    public void setIsDefault(Boolean isDefault) {
        this.isDefault = isDefault;
    }
    public String getCountry() {
        return country;
    }
    public void setCountry(String country) {
        this.country = country;
    }
    public String getCityName() {
        return cityName;
    }
    public void setCityName(String cityName) {
        this.cityName = cityName;
    }
    public String getCity_code() {
        return city_code;
    }
    public void setCity_code(String city_code) {
        this.city_code = city_code;
    }

}
