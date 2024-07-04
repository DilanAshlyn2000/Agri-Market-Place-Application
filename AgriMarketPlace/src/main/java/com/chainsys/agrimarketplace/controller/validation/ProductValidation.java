package com.chainsys.agrimarketplace.controller.validation;

import org.springframework.stereotype.Component;

@Component
public class ProductValidation {

	public static boolean isValidFarmerId(String farmerId) {
		return farmerId != null && farmerId.matches("[0-9]+");
	}

	public static boolean isValidProductName(String productName) {
		return productName != null && !productName.isEmpty() && productName.matches("[a-zA-Z0-9\\s]+");
	}

	public static boolean isValidCategoryId(String categoryId) {
		return categoryId != null && categoryId.matches("[0-9]+");
	}

	public static boolean isValidDescription(String description) {
		return description != null && !description.isEmpty();
	}

	public static boolean isValidPrice(String price) {
		return price != null && price.matches("[0-9]+");
	}

	public static boolean isValidStockQuantity(String stockQuantity) {
		return stockQuantity != null && stockQuantity.matches("[0-9]+");
	}
}


