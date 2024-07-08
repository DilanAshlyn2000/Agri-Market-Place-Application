package com.chainsys.agrimarketplace.model;

public class Cart {
    	int cartId;
	    int customerId;
	    int productId;
	    int quantity;
	    float unitPrice;
	    float total;
	    Product product;
	    Float bill;
		public int getCartId() {
			return cartId;
		}
		public void setCartId(int cartId) {
			this.cartId = cartId;
		}
		public int getCustomerId() {
			return customerId;
		}
		public void setCustomerId(int customerId) {
			this.customerId = customerId;
		}
		public int getProductId() {
			return productId;
		}
		public void setProductId(int productId) {
			this.productId = productId;
		}
		public int getQuantity() {
			return quantity;
		}
		public void setQuantity(int quantity) {
			this.quantity = quantity;
		}
		public float getUnitPrice() {
			return unitPrice;
		}
		public void setUnitPrice(float unitPrice) {
			this.unitPrice = unitPrice;
		}
		public float getTotal() {
			return total;
		}
		public void setTotal(float total) {
			this.total = total;
		}
		public Float getBill() {
			return bill;
		}
		public void setBill(Float bill) {
			this.bill = bill;
		}
		public Product getProduct() {
			return product;
		}
		public void setProduct(Product product) {
			this.product = product;
		}   
}
