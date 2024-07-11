package com.chainsys.agrimarketplace.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.chainsys.agrimarketplace.mapper.UserMapper;
import com.chainsys.agrimarketplace.mapper.UserDisplayMapper;
import com.chainsys.agrimarketplace.mapper.CartMapper;
import com.chainsys.agrimarketplace.mapper.CategoryMapper;
import com.chainsys.agrimarketplace.mapper.ProductMapper;
import com.chainsys.agrimarketplace.model.Cart;
import com.chainsys.agrimarketplace.model.Category;
import com.chainsys.agrimarketplace.model.Product;
import com.chainsys.agrimarketplace.model.User;

@Repository
public class UserImpl implements UserDao {
	@Autowired
	JdbcTemplate jdbcTemplate;

	public void insertUser(User user) {
		String save = "insert into users(name,type,phone, email, address, password) values (?,?,?,?,?,?)";
		Object[] params = { user.getName(), user.getType(), user.getPhone(), user.getEmail(), user.getAddress(),user.getPassword() };
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
	
	public List<Product> getAllProducts() {
		String select =  "select product_id, product_name,product_image, farmer_id, description, price, stock_quantity, category_id from Products ";
		List<Product> productList = jdbcTemplate.query(select, new ProductMapper());
		System.out.println(productList);
		return productList;
	}

	public List<Product> searchCategory(int categoryId) {
		String retrive = "SELECT product_id, product_name, product_image, farmer_id, description, price, stock_quantity, category_id FROM Products WHERE category_id=?";			
		return jdbcTemplate.query(retrive, new ProductMapper(),categoryId);
	}
	
	
	
	public List<Product> getAllProductsLowToHigh(Float price,int categoryId) { 
		 String select = "SELECT product_id, product_name, product_image, farmer_id, description, price, stock_quantity, category_id FROM Products WHERE category_id = ? ORDER BY price ASC;" ;
		 List<Product> productList = jdbcTemplate.query(select, new ProductMapper(),categoryId); 
		 System.out.println(productList); 
		 return productList;
		 }
	
	public List<Product> getAllProductsHighToLow(Float price,int categoryId) { 
		 String select = "SELECT product_id, product_name, product_image, farmer_id, description, price, stock_quantity, category_id FROM Products WHERE category_id = ? ORDER BY price DESC;" ;
		 List<Product> productList = jdbcTemplate.query(select, new ProductMapper(),categoryId); 
		 System.out.println(productList); 
		 return productList;
		 }
	
	@SuppressWarnings({ "deprecation" })
	public void insertCart(int customerId, int productId, int quantity, float total, String action) {
	    String selectQuery = "SELECT quantity, total FROM cart WHERE customer_id = ? AND product_id = ?";
	    String updateQuery = "UPDATE cart SET quantity = ?, total = ?, timestamp = CURRENT_TIMESTAMP WHERE customer_id = ? AND product_id = ?";
	    String insertQuery = "INSERT INTO cart (customer_id, product_id, quantity, total, status, timestamp) VALUES (?, ?, ?, ?, 'UNPAID', CURRENT_TIMESTAMP)";
	    Cart cartEntry = null;
	    try {
	        cartEntry = jdbcTemplate.queryForObject(selectQuery, new Object[]{customerId, productId}, (rs, rowNum) -> {
	            Cart cart = new Cart();
	            cart.setQuantity(rs.getInt("quantity"));
	            cart.setTotal(rs.getFloat("total"));
	            return cart;
	        });
	    } catch (EmptyResultDataAccessException e) {
	    	e.printStackTrace();
	    }

	    if (cartEntry != null) {
	        int existingQuantity = cartEntry.getQuantity();
	        int newQuantity = action.equals("add") ? existingQuantity + quantity : existingQuantity - quantity;
	        float newTotal = total * newQuantity;
	        jdbcTemplate.update(updateQuery, newQuantity, newTotal, customerId, productId);
	        System.out.println("Updating existing entry in the cart.");
	    } else {
	       jdbcTemplate.update(insertQuery, customerId, productId, quantity, total);
	        System.out.println("Inserting new entry into the cart.");
	    }
	}

	public List<Cart> getAllCartDetails(int customerId) {
		String select =  "SELECT p.product_id,p.product_name, p.product_image, p.price, c.cart_id, c.quantity, (p.price * c.quantity) AS total "
				+ "FROM products p " + "JOIN cart c ON p.product_id = c.product_id "
				+ "WHERE c.customer_id = ? AND status='UNPAID' ";
		List<Cart> productList =  jdbcTemplate.query(select,new CartMapper(),customerId);
		return productList;
	}
	
	public void deleteCartById(int cartId) {
        String deleteQuery = "DELETE FROM cart WHERE cart_id = ?";
        jdbcTemplate.update(deleteQuery, cartId);
    }
	
    public void updateStatus(Cart add1)  {
        String updateCart = "UPDATE cart SET status = 'PAID' WHERE customer_id = ?";
        jdbcTemplate.update(updateCart, add1.getCustomerId());
        String selectCartItems = "SELECT product_id, quantity FROM cart WHERE customer_id = ? AND status = 'PAID'";
        List<Cart> cartItems = jdbcTemplate.query(selectCartItems, (rs, rowNum) -> {
            Cart item = new Cart();
            item.setProductId(rs.getInt("product_id"));
            item.setQuantity(rs.getInt("quantity"));
            return item;
        }, add1.getCustomerId());
        String updateProduct = "UPDATE products SET stock_quantity = stock_quantity - ? WHERE product_id = ?";
        for (Cart item : cartItems) {
            jdbcTemplate.update(updateProduct, item.getQuantity(), item.getProductId());
        }
    }
}
