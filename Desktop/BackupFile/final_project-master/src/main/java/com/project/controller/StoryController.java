package com.project.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class StoryController {
	
	
	@RequestMapping(value = "/wineStory.wp")
	public String wineStory() {
		System.out.println("와인이야기");
		return "WEB-INF/view/wineStory/wineStory.jsp";
	}
	
	@RequestMapping(value = "/wineStory1.wp")
	public String wineStory1() {
		System.out.println("와인이야기1");
		return "WEB-INF/view/wineStory/wineStory1.jsp";
	}
	
	@RequestMapping(value = "/wineStory2.wp")
	public String wineStory2() {
		System.out.println("와인이야기2");
		return "WEB-INF/view/wineStory/wineStory2.jsp";
	}
	
	@RequestMapping(value = "/wineStory3.wp")
	public String wineStory3() {
		System.out.println("와인이야기3");
		return "WEB-INF/view/wineStory/wineStory3.jsp";
	}
	
	
	

}
