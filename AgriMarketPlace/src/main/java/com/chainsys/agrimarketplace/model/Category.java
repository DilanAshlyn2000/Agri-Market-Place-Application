package com.chainsys.agrimarketplace.model;

import java.util.Arrays;

public class Category {
int categoryId;
String categoryName;
byte[] categoryImage;
public int getCategoryId() {
	return categoryId;
}
public void setCategoryId(int categoryId) {
	this.categoryId = categoryId;
}
public String getCategoryName() {
	return categoryName;
}
public void setCategoryName(String categoryName) {
	this.categoryName = categoryName;
}
public byte[] getCategoryImage() {
	return categoryImage;
}
public void setCategoryImage(byte[] categoryImage) {
	this.categoryImage = categoryImage;
}
@Override
public String toString() {
	return "Category [categoryId=" + categoryId + ", categoryName=" + categoryName + ", categoryImage="
			+ Arrays.toString(categoryImage) + "]";
}

}
