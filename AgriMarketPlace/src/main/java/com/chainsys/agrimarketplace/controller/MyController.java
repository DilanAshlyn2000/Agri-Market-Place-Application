package com.chainsys.agrimarketplace.controller;

import org.springframework.web.bind.annotation.RequestMapping;

public class MyController {
	@RequestMapping("/")
	public String home() {
		System.out.println("Home Page");
		return "register.jsp";
	}
}
