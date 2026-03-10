package model;

import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.List;

public class Order {
	private Integer orderID;
	private Integer userID;
	private Integer addressID;
	private Address address;
	private String paymentMethod;
	private String note;
	private BigDecimal shipping_fee;
	private BigDecimal subtotal;
	private BigDecimal discountAmount;
	private BigDecimal totalAmount;

	private Timestamp createdAt;
	private Timestamp updatedAt;
	private String status;
	
	private List<OrderDetail> OrderDetail;
	private User user;
	

	public Order(Integer userID, Integer addressID, BigDecimal shipping_fee, String note, BigDecimal subtotal,
                 String paymentMethod, BigDecimal discountAmount, BigDecimal totalAmount) {
		super();
		this.userID = userID;
		this.addressID = addressID;
		this.shipping_fee = shipping_fee;
		this.note = note;
		this.subtotal = subtotal;
		this.paymentMethod = paymentMethod;
		this.discountAmount = discountAmount;
		this.totalAmount = totalAmount;
	}

	public Order() {
		super();
	}

	public Integer getOrderID() {
		return orderID;
	}

	public void setOrderID(Integer orderID) {
		this.orderID = orderID;
	}

	public Integer getUserID() {
		return userID;
	}

	public void setUserID(Integer userID) {
		this.userID = userID;
	}

	public Integer getAddressID() {
		return addressID;
	}

	public void setAddressID(Integer addressID) {
		this.addressID = addressID;
	}

	public BigDecimal getTotalAmount() {
		return totalAmount;
	}

	public void setTotalAmount(BigDecimal totalAmount) {
		this.totalAmount = totalAmount;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getPaymentMethod() {
		return paymentMethod;
	}

	public void setPaymentMethod(String paymentMethod) {
		this.paymentMethod = paymentMethod;
	}

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}

	public Timestamp getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(Timestamp createdAt) {
		this.createdAt = createdAt;
	}

	public Timestamp getUpdatedAt() {
		return updatedAt;
	}

	public void setUpdatedAt(Timestamp updatedAt) {
		this.updatedAt = updatedAt;
	}

	public BigDecimal getShipping_fee() {
		return shipping_fee;
	}

	public void setShipping_fee(BigDecimal shipping_fee) {
		this.shipping_fee = shipping_fee;
	}

	public BigDecimal getSubtotal() {
		return subtotal;
	}

	public void setSubtotal(BigDecimal subtotal) {
		this.subtotal = subtotal;
	}

	public BigDecimal getDiscountAmount() {
		return discountAmount;
	}

	public void setDiscountAmount(BigDecimal discountAmount) {
		this.discountAmount = discountAmount;
	}

	public Address getAddress() {
		return address;
	}

	public void setAddress(Address address) {
		this.address = address;
	}
	public List<OrderDetail> getOrderDetail() {
		return OrderDetail;
	}

	public void setOrderDetail(List<OrderDetail> orderDetail) {
		OrderDetail = orderDetail;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	
}
