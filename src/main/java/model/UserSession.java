package model;

import java.time.LocalDate;

public class UserSession {
	private Integer idUser;
	private String firstname;
	private String lastname;
	private String TokenID;
	private LocalDate expired;

	private Integer role;
	public UserSession(Integer idUser, String firstname, String lastname, Integer role) {
		super();
		this.idUser = idUser;
		this.firstname = firstname;
		this.lastname = lastname;
		this.role = role;

	}
	public UserSession(User userFromDB) {
	    this.idUser = userFromDB.getIdUser();     // Lấy ID từ đối tượng DB gán qua Session
	    this.firstname = userFromDB.getFirstName(); 
	    this.lastname = userFromDB.getLastName();
	    this.role = userFromDB.getRole();
	    // Các trường khác như TokenID hay expired có thể để null hoặc gán tùy ý
	}
	public Integer getIdUser() {
		return idUser;
	}
	public void setIdUser(Integer idUser) {
		this.idUser = idUser;
	}

	
	public String getFirstname() {
		return firstname;
	}

	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}

	public String getLastname() {
		return lastname;
	}

	public void setLastname(String lastname) {
		this.lastname = lastname;
	}

	public Integer getRole() {
		return role;
	}
	public void setRole(Integer role) {
		this.role = role;
	}


		
	
}
