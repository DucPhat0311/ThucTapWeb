package model;

import java.time.LocalDate;

public class RememberToken {
	private Integer userid;
	private String token;
	private LocalDate expiredAt;
	public RememberToken(Integer userid, String token, LocalDate expiredAt) {
		super();
		this.userid = userid;
		this.token = token;
		this.expiredAt = expiredAt;
	}
	public RememberToken() {
		super();
	}
	public Integer getUserid() {
		return userid;
	}
	public void setUserid(Integer userid) {
		this.userid = userid;
	}
	public String getToken() {
		return token;
	}
	public void setToken(String token) {
		this.token = token;
	}
	public LocalDate getExpiredAt() {
		return expiredAt;
	}
	public void setExpiredAt(LocalDate expiredAt) {
		this.expiredAt = expiredAt;
	}
	
	
}
