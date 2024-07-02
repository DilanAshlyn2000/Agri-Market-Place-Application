package com.chainsys.agrimarketplace.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.chainsys.agrimarketplace.dao.UserDao;
import com.chainsys.agrimarketplace.model.Category;
import com.chainsys.agrimarketplace.model.User;

@Controller
public class UserController {
	@Autowired
	UserDao userDao;

	@RequestMapping("/")
	public String home() {
		System.out.println("Home Page");
		return "homePageUser.jsp";
	}

	@GetMapping("/register")
	public String saveUser(@RequestParam("name") String name, @RequestParam("type") String type,
			@RequestParam("phone") String phone, @RequestParam("email") String email,
			@RequestParam("address") String address, @RequestParam("password") String password, Model model) {
		User user = new User();
		user.setName(name);
		user.setType(type);
		user.setPhone(phone);
		user.setEmail(email);
		user.setAddress(address);
		user.setPassword(password);
		userDao.insertUser(user);
		return "homePageUser.jsp";
	}

	@PostMapping("/login")
	public String login(@RequestParam("email") String email, @RequestParam("password") String password) {
		User user = userDao.loginUser(email);
		if (password.equals("Admin#01")) {
			return "homePageAdmin.jsp";
		}
		if (user.getType().equals("farmer")) {
			return "homePageFarmer.jsp";
		}
		if (user.getType().equals("user")) {
			return "homePageUser.jsp";
		}

		else {
			return "registrationPage.jsp";
		}

	}

	@GetMapping("/displayUser")
	public String getAllUser(Model model) {
		System.out.println("getting datas");
		List<User> users = userDao.getAllUsers();
		System.out.println(users);
		model.addAttribute("users", users);
		return "userDisplay.jsp";
	}

	@GetMapping("/search")
	public String search(@RequestParam("name") String name, Model model) {
		List<User> users = userDao.searchUser(name);
		model.addAttribute("users", users);
		return "userDisplay.jsp";
	}
	
	 @GetMapping("/delete")
	 public String delete(@RequestParam("id") int id, Model model) { 
		 User user = new User();
		 user.setId(id); 
		 userDao.delete(user);
	  List<User> users = userDao.getAllUsers();
	  model.addAttribute("users", users);
	  return "userDisplay.jsp";
	  }
	
	 @GetMapping("/category")
		public String saveCategory(@RequestParam("category") String categoryName, @RequestParam("fileToUpload") byte[] categoryImage, Model model) {
			Category category = new Category();
			category.setCategoryName(categoryName);
			category.setCategoryImage(categoryImage);
			userDao.insertCategory(category);
			return "homePageAdmin.jsp";
		
	 }
	
	 @GetMapping("/displayCategory")
		public String getAllCategory(Model model) {
			System.out.println("getting datas");
			List<Category> category = userDao.getAllCategory();
			System.out.println(users);
			model.addAttribute("users", users);
			return "userCategory.jsp";
		}	
}

