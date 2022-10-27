package com.project.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class WineSearchController {

	@RequestMapping(value = "/wineSearch.wp")
	public String search() {
		System.out.println("찾아보기");
		return "WEB-INF/view/Search/Search.jsp";
	}
	
	

}
