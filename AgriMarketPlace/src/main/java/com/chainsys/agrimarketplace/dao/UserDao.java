package com.chainsys.agrimarketplace.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.chainsys.agrimarketplace.model.Cart;
import com.chainsys.agrimarketplace.model.Category;
import com.chainsys.agrimarketplace.model.Product;
import com.chainsys.agrimarketplace.model.User;

@Repository
public interface UserDao {
	public void insertUser(User user);

	public User loginUser(String email);

	public List<User> getAllUsers();

	public List<User> searchUser(String name);

	public void deleteUser(User user);

	public void insertCategory(Category category);

	public List<Category> getAllCategory();

	public void deleteCategory(Category category);

	public void insertProduct(Product product);

	public List<Product> getAllProduct();

	public void deleteProduct(Product product);
	
	public List<Product> getAllProducts();
	
	public List<Product> searchCategory(int categoryId);
	
	public List<Product> getAllProductsLowToHigh(Float price,int categoryId);
	
	public List<Product> getAllProductsHighToLow(Float price,int categoryId);
	
	public void insertCart(int customerId, int productId, int quantity, float total, String action);
	
	public List<Cart> getAllCartDetails(int customerId);
	
	public void deleteCartById(int cartId);
	
	  public void updateStatus(Cart add1) ;
}
