package com.chainsys.agrimarketplace.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.chainsys.agrimarketplace.model.Cart;
import com.chainsys.agrimarketplace.model.Product;

public class CartMapper implements RowMapper<Cart> {
    public Cart mapRow(ResultSet resultSet, int i) throws SQLException {
        Cart cart = new Cart();
        Product product = new Product();
        product.setProductId(resultSet.getInt("p.product_id"));
        product.setProductName(resultSet.getString("p.product_name"));
        product.setProductImage(resultSet.getBytes("p.product_image"));
        product.setPrice(resultSet.getFloat("p.price"));
        cart.setProduct(product); 
        cart.setCartId(resultSet.getInt("c.cart_id"));
        cart.setQuantity(resultSet.getInt("c.quantity"));	
        cart.setTotal(resultSet.getFloat("total"));
        return cart;
    }
}

