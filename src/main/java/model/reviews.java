package model;

import java.time.LocalDate;

public class reviews {
	private Integer review_id;
	private Integer order_detail_id;
	private Integer user_id;
	private Integer product_id;
	private Integer rating;
	private LocalDate createAt;

	public reviews(Integer order_detail_id, Integer user_id, Integer product_id, Integer rating
			) {
		super();
		this.order_detail_id = order_detail_id;
		this.user_id = user_id;
		this.product_id = product_id;
		this.rating = rating;
	}
	public reviews(Integer rating) {
		super();
		this.rating= rating;
	}
	public reviews() {
		super();
	}

	public Integer getReview_id() {
		return review_id;
	}

	public void setReview_id(Integer review_id) {
		this.review_id = review_id;
	}

	public Integer getOrder_detail_id() {
		return order_detail_id;
	}

	public void setOrder_detail_id(Integer order_detail_id) {
		this.order_detail_id = order_detail_id;
	}

	public Integer getUser_id() {
		return user_id;
	}

	public void setUser_id(Integer user_id) {
		this.user_id = user_id;
	}

	public Integer getProduct_id() {
		return product_id;
	}

	public void setProduct_id(Integer product_id) {
		this.product_id = product_id;
	}

	public Integer getRating() {
		return rating;
	}

	public void setRating(Integer rating) {
		this.rating = rating;
	}

	public LocalDate getCreateAt() {
		return createAt;
	}

	public void setCreateAt(LocalDate createAt) {
		this.createAt = createAt;
	}

}
