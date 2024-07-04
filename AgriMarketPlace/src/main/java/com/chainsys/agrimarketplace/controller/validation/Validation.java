package com.chainsys.agrimarketplace.controller.validation;

public class Validation {
	public static boolean isValidName(String name) {
		return name != null && !name.isEmpty() && name.matches("[a-zA-Z\\s]+");
	}

	public static boolean isValidPhone(String phone) {
		return phone != null && !phone.isEmpty() && phone.matches("^\\+?[0-9\\s-]{3,}$");
	}

	public static boolean isValidEmail(String email) {
		return email != null && !email.isEmpty() && email.matches("^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+$");
	}
}
