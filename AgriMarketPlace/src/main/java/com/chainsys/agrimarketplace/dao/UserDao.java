package com.chainsys.agrimarketplace.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.chainsys.agrimarketplace.model.Category;
import com.chainsys.agrimarketplace.model.User;

@Repository
public interface UserDao {
	public void insertUser(User user);
	public User loginUser(String email);
	public List<User> getAllUsers();
	public List<User> searchUser(String name) ;
	public void delete(User user) ;
	public void insertCategory(Category category);
}
