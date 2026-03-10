package model;

import java.math.BigDecimal;
import java.util.List;

public class Products {
	private Integer productID;
	private String productName;
	private Integer categoryID;
	private BigDecimal price;

	private String status;
	private String img;
	private String description;
	
	private List<reviews> rate;
	private Integer review_count;
	
	private Category cate;
	private Integer quantityVariantCurr;

	public Products(Integer productID, String productName, Integer categoryID, BigDecimal price, String status,
                    String img, String description) {
		super();
		this.productID = productID;
		this.productName = productName;
		this.categoryID = categoryID;
		this.price = price;
		this.status = status;
		this.img = img;
		this.description = description;
	}

	public Products() {
		super();
	}

	public Integer getProductID() {
		return productID;
	}

	public void setProductID(Integer productID) {
		this.productID = productID;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public Integer getCategoryID() {
		return categoryID;
	}

	public void setCategoryID(Integer categoryID) {
		this.categoryID = categoryID;
	}

	public BigDecimal getPrice() {
		return price;
	}

	public void setPrice(BigDecimal price) {
		this.price = price;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	@Override
	public String toString() {
		return "Products [productID=" + productID + ", productName=" + productName + ", categoryID=" + categoryID
				+ ", price=" + price + ", status=" + status + ", img=" + img + ", description=" + description + "]";
	}


	public Integer getReview_count() {
		return review_count;
	}

	public void setReview_count(Integer review_count) {
		this.review_count = review_count;
	}

	public List<reviews> getRate() {
		return rate;
	}

	public void setRate(List<reviews> rate) {
		this.rate = rate;
	}

	public Category getCate() {
		return cate;
	}

	public void setCate(Category cate) {
		this.cate = cate;
	}

	public Integer getQuantityVariantCurr() {
		return quantityVariantCurr;
	}

	public void setQuantityVariantCurr(Integer quantityVariantCurr) {
		this.quantityVariantCurr = quantityVariantCurr;
	}

}
