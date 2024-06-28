package com.chainsys.agrimarketplace.model;

public class Product {
	 int productId;
	    String productName;
	    byte[] productImage;
	    int farmerId;
	    String description;
	    float  price; 
	    int stockQuantity;
	    int categoryId;
		public int getProductId() {
			return productId;
		}
		public void setProductId(int productId) {
			this.productId = productId;
		}
		public String getProductName() {
			return productName;
		}
		public void setProductName(String productName) {
			this.productName = productName;
		}
		public byte[] getProductImage() {
			return productImage;
		}
		public void setProductImage(byte[] productImage) {
			this.productImage = productImage;
		}
		public int getFarmerId() {
			return farmerId;
		}
		public void setFarmerId(int farmerId) {
			this.farmerId = farmerId;
		}
		public String getDescription() {
			return description;
		}
		public void setDescription(String description) {
			this.description = description;
		}
		public float getPrice() {
			return price;
		}
		public void setPrice(float price) {
			this.price = price;
		}
		public int getStockQuantity() {
			return stockQuantity;
		}
		public void setStockQuantity(int stockQuantity) {
			this.stockQuantity = stockQuantity;
		}
		public int getCategoryId() {
			return categoryId;
		}
		public void setCategoryId(int categoryId) {
			this.categoryId = categoryId;
		}
	    
}
