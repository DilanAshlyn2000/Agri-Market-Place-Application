package com.chainsys.agrimarketplace.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;
import org.springframework.jdbc.core.RowMapper;
import com.chainsys.agrimarketplace.model.Product;

public class ProductMapper implements RowMapper<Product> {
	@Override
	public Product mapRow(ResultSet resultSet, int i) throws SQLException {
		Product product = new Product();
		product.setProductId(resultSet.getInt("product_id"));
		product.setProductName(resultSet.getString("product_name"));
		product.setProductImage(resultSet.getBytes("product_image"));
		product.setFarmerId(resultSet.getInt("farmer_id"));
		product.setDescription(resultSet.getString("description"));
		product.setPrice(resultSet.getFloat("price"));
		product.setStockQuantity(resultSet.getInt("stock_quantity"));
		product.setCategoryId(resultSet.getInt("category_id"));
		return product;
   }
}
