package model;

import java.math.BigDecimal;

public class Shipping {
	private int spid;
	private String city;
	private BigDecimal price;
	public Shipping(int spid, String city, BigDecimal price) {
		super();
		this.spid = spid;
		this.city = city;
		this.price = price;
	}
	public Shipping() {
		super();
	}
	public int getSpid() {
		return spid;
	}
	public void setSpid(int spid) {
		this.spid = spid;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public BigDecimal getPrice() {
		return price;
	}
	public void setPrice(BigDecimal price) {
		this.price = price;
	}
	
	
	
}
