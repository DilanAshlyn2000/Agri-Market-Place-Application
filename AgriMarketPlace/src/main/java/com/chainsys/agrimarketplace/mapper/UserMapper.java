package com.chainsys.agrimarketplace.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;
import org.springframework.jdbc.core.RowMapper;
import com.chainsys.agrimarketplace.model.User;

public class UserMapper implements RowMapper<User> {
	
	@Override
	public User mapRow(ResultSet resultSet, int i) throws SQLException {
		User user = new User();
		user.setId(resultSet.getInt("id"));
		user.setType(resultSet.getString("type"));
		user.setPassword(resultSet.getString("password"));
		return user;
	}
}
