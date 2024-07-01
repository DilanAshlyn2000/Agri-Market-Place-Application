package com.chainsys.agrimarketplace.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.chainsys.agrimarketplace.mapper.UserMapper;
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
		String select = "select id, name, type, phone, email, address, password from users";
		List<User> userList = jdbcTemplate.query(select, new UserMapper());
		System.out.println(userList);
		return userList;
	}

	public List<User> searchUser(String name) {
		String retrive = String.format("SELECT  FROM users id, name, type, phone, email, address from users"
				+ "WHERE (name LIKE '%%%s%%' OR type LIKE '%%%s%%' OR id LIKE '%%%s%%')", name, name, name
		);
		return jdbcTemplate.query(retrive, new UserMapper());
	}
}