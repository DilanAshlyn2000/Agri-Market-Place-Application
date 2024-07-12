package com.chainsys.agrimarketplace.controller;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.chainsys.agrimarketplace.controller.validation.ProductValidation;
import com.chainsys.agrimarketplace.controller.validation.Validation;
import com.chainsys.agrimarketplace.dao.UserDao;
import com.chainsys.agrimarketplace.model.Cart;
import com.chainsys.agrimarketplace.model.Category;
import com.chainsys.agrimarketplace.model.Product;
import com.chainsys.agrimarketplace.model.User;

import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpSession;

@Controller
@MultipartConfig
public class UserController {
	@Autowired
	UserDao userDao;

	@RequestMapping("/")
	public String home() {
		return "homePageUser.jsp";
	}

	@GetMapping("/register")
	public String saveUser(@RequestParam("name") String name, @RequestParam("type") String type,
			@RequestParam("phone") String phone, @RequestParam("email") String email,
			@RequestParam("address") String address, @RequestParam("password") String password, Model model) {
		if (!Validation.isValidName(name)) {
			model.addAttribute("error", "Invalid name format");
			return "registrationPage.jsp";
		}
		if (!Validation.isValidPhone(phone)) {
			model.addAttribute("error", "Invalid phone number format");
			return "registrationPage.jsp";
		}
		if (!Validation.isValidEmail(email)) {
			model.addAttribute("error", "Invalid email format");
			return "registrationPage.jsp";
		}
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
	public String login(@RequestParam("email") String email, @RequestParam("password") String password,
			HttpSession session) {
		User user = userDao.loginUser(email);
		if (user != null) {
			session.setAttribute("user", user.getId());
			if (password.equals("Admin#01")) {
				return "homePageAdmin.jsp";
			}
			if (user.getType().equals("farmer")) {
				return "farmerDashBoard.jsp";
			}
			if (user.getType().equals("user")) {
				return "homePageUser.jsp";
			} else {
				return "homePageUser.jsp?error=Invalid email or password.";
			}
		} else {
			return "homePageUser.jsp?error=Invalid email or password.";
		}
	}

	@GetMapping("/displayUser")
	public String getAllUser(Model model) {
		List<User> users = userDao.getAllUsers();
		model.addAttribute("users", users);
		return "userDisplay.jsp";
	}

	@GetMapping("/search")
	public String search(@RequestParam("name") String name, Model model) {
		List<User> users = userDao.searchUser(name);
		model.addAttribute("users", users);
		return "userDisplay.jsp";
	}

	@GetMapping("/deleteUser")
	public String delete(@RequestParam("id") int id, Model model) {
		User user = new User();
		user.setId(id);
		userDao.deleteUser(user);
		List<User> users = userDao.getAllUsers();
		model.addAttribute("users", users);
		return "userDisplay.jsp";
	}

	@PostMapping("/category")
	public String saveCategory(@RequestParam("category") String categoryName,
			@RequestParam("fileToUpload") MultipartFile file, Model model) {
		byte[] imageBytes = null;
		if (!file.isEmpty()) {
			try {
				imageBytes = file.getBytes();
			} catch (IOException e) {
				e.printStackTrace();
				return "error";
			}
		}
		Category category = new Category();
		category.setCategoryName(categoryName);
		category.setCategoryImage(imageBytes);
		userDao.insertCategory(category);
		return "homePageAdmin.jsp";

	}

	@GetMapping("/displayCategory")
	public String getAllCategory(Model model) {
		List<Category> category = userDao.getAllCategory();
		model.addAttribute("lists", category);
		return "displayCategory.jsp";
	}

	@GetMapping("/deleteCategory")
	public String deleteCategory(@RequestParam("categoryId") int categoryId, Model model) {
		Category category = new Category();
		category.setCategoryId(categoryId);
		userDao.deleteCategory(category);
		List<Category> categories = userDao.getAllCategory();
		model.addAttribute("lists", categories);
		return "displayCategory.jsp";
	}

	@PostMapping("/product")
	public String saveProduct(@RequestParam("farmerId") String farmerId,
			@RequestParam("productName") String productName, @RequestParam("categoryId") String categoryId,
			@RequestParam("fileToUpload") MultipartFile file, @RequestParam("description") String description,
			@RequestParam("price") String price, @RequestParam("stockQuantity") String stockQuantity, Model model) {
		if (!ProductValidation.isValidFarmerId(farmerId)) {
			model.addAttribute("error", "Invalid farmer ID format");
			return "addProduct.jsp";
		}
		if (!ProductValidation.isValidProductName(productName)) {
			model.addAttribute("error", "Invalid product name format");
			return "addProduct.jsp";
		}
		if (!ProductValidation.isValidCategoryId(categoryId)) {
			model.addAttribute("error", "Invalid category ID format");
			return "addProduct.jsp";
		}
		if (!ProductValidation.isValidDescription(description)) {
			model.addAttribute("error", "Invalid description format");
			return "addProduct.jsp";
		}
		if (!ProductValidation.isValidPrice(price)) {
			model.addAttribute("error", "Invalid price format");
			return "addProduct.jsp";
		}
		if (!ProductValidation.isValidStockQuantity(stockQuantity)) {
			model.addAttribute("error", "Invalid stock quantity format");
			return "addProduct.jsp";
		}
		byte[] imageBytes;
		try {
			imageBytes = file.getBytes();
		} catch (IOException e) {
			e.printStackTrace();
			model.addAttribute("error", "Failed to read the uploaded file");
			return "addProduct.jsp";
		}
		Product product = new Product();
		product.setFarmerId(Integer.parseInt(farmerId));
		product.setProductName(productName);
		product.setCategoryId(Integer.parseInt(categoryId));
		product.setProductImage(imageBytes);
		product.setDescription(description);
		product.setPrice(Float.parseFloat(price));
		product.setStockQuantity(Integer.parseInt(stockQuantity));
		try {
			userDao.insertProduct(product);
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("error", "Failed to save the product");
			return "addProduct.jsp";
		}
		return "redirect:/farmerDashBoard.jsp";
	}

	@GetMapping("/displayProduct")
	public String getAllProduct(Model model) {
		List<Product> product = userDao.getAllProduct();
		model.addAttribute("lists", product);
		return "productsView.jsp";
	}

	@GetMapping("/deleteProduct")
	public String deleteProduct(@RequestParam("id") int productId, Model model) {
		Product product = new Product();
		product.setProductId(productId);
		userDao.deleteProduct(product);
		List<Product> products = userDao.getAllProduct();
		model.addAttribute("lists", products);
		return "productsView.jsp";
	}

	@GetMapping("/displayProducts")
	public String getAllProducts(Model model) {
		List<Product> products = userDao.getAllProducts();
		model.addAttribute("productList", products);
		return "displayProductUser.jsp";
	}

	@GetMapping("/searchCategory")
	public String searchCategory(@RequestParam("type") Integer categoryId, HttpSession session, Model model) {
		session.setAttribute("type", categoryId);
		List<Product> productList = userDao.searchCategory(categoryId);
		model.addAttribute("productList", productList);
		return "displayProductUser.jsp";
	}

	@GetMapping("/displayProductsLowToHigh")
	public String getAllProductsLowToHigh(@RequestParam("price1") Float price, HttpSession session, Model model) {
		int type = (int) session.getAttribute("type");
		List<Product> products = userDao.getAllProductsLowToHigh(price, type);
		model.addAttribute("productList", products);
		return "displayProductUser.jsp";
	}

	@GetMapping("/displayProductsHighToLow")
	public String getAllProductsHighToLow(@RequestParam("price1") Float price, HttpSession session, Model model) {
		int type = (int) session.getAttribute("type");
		List<Product> products = userDao.getAllProductsHighToLow(price, type);
		model.addAttribute("productList", products);
		return "displayProductUser.jsp";
	}

	@GetMapping("/insertCart")
	public String insertCart(@RequestParam("category_id") int customerId, @RequestParam("productId") int productId,
			@RequestParam("quantity") int quantity, @RequestParam("price") float total,
			@RequestParam("action") String action, HttpSession session, Model model) {
		int id = (int) session.getAttribute("user");
		int type = (int) session.getAttribute("type");
		System.out.println(action);
		System.out.println(id);
		Cart cart = new Cart();
		cart.setCustomerId(customerId);
		cart.setProductId(productId);
		cart.setQuantity(quantity);
		cart.setTotal(total);
		userDao.insertCart(id, productId, quantity, total, action);
		List<Product> products = userDao.searchCategory(type);
		model.addAttribute("productList", products);
		return "displayProductUser.jsp";
	}

	@GetMapping("/displayCart")
	public String getAllCartDetails(@RequestParam("customer_id") int customerId, Model model) {
		List<Cart> products = userDao.getAllCartDetails(customerId);
		model.addAttribute("productList", products);
		return "cartPage.jsp";
	}

	@GetMapping("/deleteCart")
	public String deleteCart(@RequestParam("cartId") int cartId,HttpSession session,Model model) {
		int customerId = (int) session.getAttribute("user");
		List<Cart> products = userDao.getAllCartDetails(customerId);
		model.addAttribute("productList", products);
		userDao.deleteCartById(cartId);
		return "cartPage.jsp";
	}

	@GetMapping("/confirmPage")
	public String confirmPage(@RequestParam("customer_id") int customerId, Model model) {
		List<Cart> products = userDao.getAllCartDetails(customerId);
		model.addAttribute("productList", products);
		return "buyNowPage.jsp";
	}

	@GetMapping("/updateStatus")
	public String updateCartStatus(@RequestParam("customer_id") int customerId, Model model) {
		Cart add1 = new Cart();
		add1.setCustomerId(customerId);
		userDao.updateStatus(add1);
		// model.addAttribute("message", "Cart status updated successfully.");
		return "homePageUser.jsp";
	}
	@GetMapping("/orderHistory")
	public String userOrderHistory(HttpSession session,Model model) {
		int customerId = (int) session.getAttribute("user");
		List<Cart> products = userDao.userOrderHistory(customerId);
		model.addAttribute("productList", products);
		return "userOrderHistory.jsp";
	}
	@GetMapping("/orderHistoryFarmer")
	public String userOrderFarmer(HttpSession session,Model model) {
		int FarmerId = (int) session.getAttribute("user");
		List<Cart> products = userDao.userOrderHistoryFarmer(FarmerId);
		model.addAttribute("productList", products);
		return "transactionHistory.jsp";
	}
}

