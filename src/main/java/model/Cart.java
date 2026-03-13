package model;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import dao.ProductsDao;

public class Cart {
	private List<CartItems> items = new ArrayList<>();

	// Cộng dồn số lượng nếu sản phẩm đã có, không tvahì thêm mới
	public void addItem(int variantID, int quantity) {
		for (CartItems item : items) {
			if (item.getVariantID() == (variantID)) {
				item.setQuanity(quantity + item.getQuanity());
				return;
			}
		}
		// Nếu chưa có sản phẩm này, thêm mới vào giỏ
		items.add(new CartItems(variantID, quantity));
	}

	public List<CartItems> getItems() {
		return items;
	}
	public void removeItems(int variantID) {
		for(int i =0;i<items.size();i++) {
			if(items.get(i).getVariantID() == variantID) {
				items.remove(i);
			}
		}
	}
	public void changeQuanity(int variantID,int quanity) {
		for (CartItems cartItems : items) {
			if(variantID == cartItems.getVariantID()) {
				cartItems.setQuanity(quanity);
			}
		}
	}

	public int getSize() {
		return items.size();
	}

	public BigDecimal getPrice() {
		BigDecimal sum = new BigDecimal(0);
		for (CartItems cartItems : items) {
			sum =sum.add(cartItems.getSubtotal());
		}
		return sum;
	}
}
