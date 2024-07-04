package com.chainsys.agrimarketplace.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

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
}
