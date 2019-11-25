package com.eventuror.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/")
public class HelloController {

	public String sayHello() {
		return "<h1>hello<h1>";
	}
	
}
