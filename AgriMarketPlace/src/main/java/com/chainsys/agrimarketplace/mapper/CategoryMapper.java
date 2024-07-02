package com.chainsys.agrimarketplace.mapper;

	import java.sql.ResultSet;
	import java.sql.SQLException;
	import org.springframework.jdbc.core.RowMapper;
	import com.chainsys.agrimarketplace.model.Category;
	public class CategoryMapper implements RowMapper<Category> {
	    @Override
	    public Category mapRow(ResultSet resultSet, int i) throws SQLException {
	    	Category category = new Category();
	    	category.setCategoryName(resultSet.getString("categoryName"));
	    	category.setCategoryImage(resultSet.getBytes("categoryImage"));
	        return category;
	    }


}
