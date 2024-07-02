package com.chainsys.agrimarketplace.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.chainsys.agrimarketplace.mapper.UserMapper;
import com.chainsys.agrimarketplace.mapper.UserDisplayMapper;
import com.chainsys.agrimarketplace.mapper.CategoryMapper;
import com.chainsys.agrimarketplace.model.Category;
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
		String retrive = String.format("SELECT id, name, type, phone, email, address,password from users WHERE (name LIKE '%%%s%%' OR type LIKE '%%%s%%' OR id LIKE '%%%s%%')", "AND status=0", name, name, name);
		return jdbcTemplate.query(retrive, new UserDisplayMapper());
	}
	
	  public void delete(User user) {
		  String delete = "update users set status=1 where id=?"; 
		  Object[] params = {user.getId()};
	      jdbcTemplate.update(delete, params);
	  
	  }
	  public void insertCategory(Category category) {
			String save = "insert into categories(category_name,category_image) values (?,?)";
			System.out.println("ggg");
			Object[] params = { category.getCategoryName(),category.getCategoryImage()};
			System.out.println("category");
			int update = jdbcTemplate.update(save, params);
			System.out.println(update);

		}
	  public List<Category> getAllCategory() {
			String select = "select category_id, category_name, category_image from category";
			List<Category> categoryList = jdbcTemplate.query(select, new CategoryMapper());
			System.out.println(categoryList);
			return categoryList;
		}

}