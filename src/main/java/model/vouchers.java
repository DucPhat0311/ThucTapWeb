package model;

public class vouchers {
	private Integer voucherID;
	private String code;
	private Integer discount;
	private Integer quantity;
	private Integer used;
	private Boolean status;
	public vouchers(Integer voucherID, String code, Integer discount, Integer quantity, Integer used, Boolean status) {
		super();
		this.voucherID = voucherID;
		this.code = code;
		this.discount = discount;
		this.quantity = quantity;
		this.used = used;
		this.status = status;
	}
	public vouchers() {
		super();
	}
	public Integer getVoucherID() {
		return voucherID;
	}
	public void setVoucherID(Integer voucherID) {
		this.voucherID = voucherID;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public Integer getDiscount() {
		return discount;
	}
	public void setDiscount(Integer discount) {
		this.discount = discount;
	}
	public Integer getQuantity() {
		return quantity;
	}
	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}
	public Integer getUsed() {
		return used;
	}
	public void setUsed(Integer used) {
		this.used = used;
	}
	public Boolean getStatus() {
		return status;
	}
	public void setStatus(Boolean status) {
		this.status = status;
	}
	
	
}
