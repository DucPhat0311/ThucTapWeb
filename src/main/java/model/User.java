package model;

import java.sql.Timestamp;
import java.time.LocalDate;

public class User {
	private Integer idUser;
	private String firstName;
	private String lastName;
	private String email;
	private Boolean verify;
	private String username;
	private String password;
	private Integer role;
	private Timestamp createdAt;
	private String phone;
	private LocalDate birthday;
	private Integer gender;
	private Integer status;
	
	private Integer puchasedOrders;
	
	public User(Integer idUser, String firstName, String lastName, String email , Boolean verify,
                String username, String password) {
		super();
		this.idUser = idUser;
		this.firstName = firstName;
		this.lastName = lastName;
		this.email = email;
		this.verify = verify;
		this.username = username;
		this.password = password;
	}
	
	public User(Integer idUser, String firstName, String lastName, String email, Boolean verify,
                String username, String password, Integer role, Timestamp createdAt, String phone) {
		super();
		this.idUser = idUser;
		this.firstName = firstName;
		this.lastName = lastName;
		this.email = email;
		this.verify = verify;
		this.username = username;
		this.password = password;
		this.role = role;
		this.createdAt = createdAt;
		this.phone = phone;
	}

	public User(String firstName, String lastName, String email, Boolean verify,
                String username, String password, Integer role) {
		super();
		this.firstName = firstName;
		this.lastName = lastName;
		this.email = email;
		this.verify = verify;
		this.username = username;
		this.password = password;
		this.role=role;
	}
	public User() {
		super();
	}
	public Integer getIdUser() {
		return idUser;
	}
	public void setIdUser(Integer idUser) {
		this.idUser = idUser;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public Boolean getVerify() {
		return verify;
	}
	public void setVerify(Boolean verify) {
		this.verify = verify;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}

	public Integer getRole() {
		return role;
	}

	public void setRole(Integer role) {
		this.role = role;
	}

	public Timestamp getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(Timestamp createdAt) {
		this.createdAt = createdAt;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public LocalDate getBirthday() {
		return birthday;
	}

	public void setBirthday(LocalDate birthday) {
		this.birthday = birthday;
	}

	public Integer getGender() {
		return gender;
	}

	public void setGender(Integer gender) {
		this.gender = gender;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public Integer getPuchasedOrders() {
		return puchasedOrders;
	}

	public void setPuchasedOrders(Integer puchasedOrders) {
		this.puchasedOrders = puchasedOrders;
	}

	
	
}
