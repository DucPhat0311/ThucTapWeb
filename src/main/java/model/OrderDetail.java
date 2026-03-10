package model;

import java.math.BigDecimal;

public class OrderDetail {
	private Integer orderDetailID;
	private Integer orderID;
	private Integer productID;
	private Integer variantID;
	private Integer quantity;
	private BigDecimal price; 
	
	
	 private Products product;
	    private ProductVariants variant;
	private boolean isReview;

	public OrderDetail(Integer orderID, Integer productID, Integer variantID, Integer quantity,
                       BigDecimal price) {
		super();
		this.orderID = orderID;
		this.productID = productID;
		this.variantID = variantID;
		this.quantity = quantity;
		this.price = price;
	}

	public OrderDetail() {
		super();
	}

	public Integer getOrderDetailID() {
		return orderDetailID;
	}

	public void setOrderDetailID(Integer orderDetailID) {
		this.orderDetailID = orderDetailID;
	}

	public Integer getOrderID() {
		return orderID;
	}

	public void setOrderID(Integer orderID) {
		this.orderID = orderID;
	}

	public Integer getProductID() {
		return productID;
	}

	public void setProductID(Integer productID) {
		this.productID = productID;
	}

	public Integer getVariantID() {
		return variantID;
	}

	public void setVariantID(Integer variantID) {
		this.variantID = variantID;
	}

	public Integer getQuantity() {
		return quantity;
	}

	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}

	public BigDecimal getPrice() {
		return price;
	}

	public void setPrice(BigDecimal price) {
		this.price = price;
	}

	public Products getProduct() {
		return product;
	}

	public void setProduct(Products product) {
		this.product = product;
	}

	public ProductVariants getVariant() {
		return variant;
	}

	public void setVariant(ProductVariants variant) {
		this.variant = variant;
	}

	public boolean getIsReview() {
		return isReview;
	}

	public void setReview(boolean isReview) {
		this.isReview = isReview;
	}

}
