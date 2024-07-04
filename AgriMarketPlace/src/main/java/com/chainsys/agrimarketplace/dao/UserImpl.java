package com.chainsys.agrimarketplace.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.chainsys.agrimarketplace.mapper.UserMapper;
import com.chainsys.agrimarketplace.mapper.UserDisplayMapper;
import com.chainsys.agrimarketplace.mapper.CategoryMapper;
import com.chainsys.agrimarketplace.mapper.ProductMapper;
import com.chainsys.agrimarketplace.model.Category;
import com.chainsys.agrimarketplace.model.Product;
import com.chainsys.agrimarketplace.model.User;

@Repository
public class UserImpl implements UserDao {
	@Autowired
	JdbcTemplate jdbcTemplate;

	public void insertUser(User user) {
		String save = "insert into users(name,type,phone, email, address, password) values (?,?,?,?,?,?)";
		Object[] params = { user.getName(), user.getType(), user.getPhone(), user.getEmail(), user.getAddress(),
				user.getPassword() };
		jdbcTemplate.update(save, params);

	}

	@SuppressWarnings("deprecation")
	public User loginUser(String email) {
		String loginQuery = "SELECT id, password, type FROM users WHERE email = ?";
		return jdbcTemplate.queryForObject(loginQuery, new Object[] { email }, new UserMapper());
	}

	public List<User> getAllUsers() {
		String select = "select id, name, type, phone, email, address, password from users where status=0";
		List<User> userList = jdbcTemplate.query(select, new UserDisplayMapper());
		System.out.println(userList);
		return userList;
	}

	public List<User> searchUser(String name) {
		String retrive = String.format(
				"SELECT id, name, type, phone, email, address,password from users WHERE (name LIKE '%%%s%%' OR type LIKE '%%%s%%' OR id LIKE '%%%s%%')",
				"AND status=0", name, name, name);
		return jdbcTemplate.query(retrive, new UserDisplayMapper());
	}

	public void deleteUser(User user) {
		String delete = "update users set status=1 where id=?";
		Object[] params = { user.getId() };
		jdbcTemplate.update(delete, params);

	}

	public void insertCategory(Category category) {
		String save = "insert into categories(category_name,category_image) values (?,?)";
		Object[] params = { category.getCategoryName(), category.getCategoryImage() };
		int update = jdbcTemplate.update(save, params);

	}

	public List<Category> getAllCategory() {
		String select = "select category_id, category_name, category_image from categories";
		List<Category> categoryList = jdbcTemplate.query(select, new CategoryMapper());
		return categoryList;
	}

	public void deleteCategory(Category category) {
		String delete = "delete from categories where category_id=?";
		Object[] params = { category.getCategoryId() };
		jdbcTemplate.update(delete, params);

	}

	public void insertProduct(Product product) {
		String save = "insert into products(product_name, product_image, farmer_id, description, price, stock_quantity, category_id) values (?,?,?,?,?,?,?)";
		Object[] params = { product.getProductName(), product.getProductImage(), product.getFarmerId(),
				product.getDescription(), product.getPrice(), product.getStockQuantity(), product.getCategoryId() };
		jdbcTemplate.update(save, params);
	}

	public List<Product> getAllProduct() {
		String select = "select product_id,product_name, product_image, farmer_id, description, price, stock_quantity, category_id from products";
		List<Product> productList = jdbcTemplate.query(select, new ProductMapper());
		return productList;
	}

	public void deleteProduct(Product product) {
		String delete = "delete from products where product_id=?";
		Object[] params = { product.getProductId() };
		jdbcTemplate.update(delete, params);

	}
}