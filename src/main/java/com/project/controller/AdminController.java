package com.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminController {
	
	
	@RequestMapping("adminMain.wp")
	public String main() {
		return "WEB-INF/view/admin/adminmain.jsp";
	}
	
	@RequestMapping("adminUser.wp")
	public String user() {
		return "WEB-INF/view/admin/adminuser.jsp";
	}
	
	@RequestMapping("adminWine.wp")
	public String wine() {
		return "WEB-INF/view/admin/adminwine.jsp";
	}
	
	@RequestMapping("Introduce.wp")
	public String introduce() {
		return "WEB-INF/view/admin/introduce.jsp";
	}
	
	@RequestMapping("Subscription.wp")
	public String subscription() {
		return "WEB-INF/view/admin/subscription.jsp";
	}
	
	@RequestMapping("Salesdelivery.wp")
	public String salesdelivery() {
		return "WEB-INF/view/admin/salesdelivery.jsp";
	}
	
	@RequestMapping("Notice.wp")
	public String notice() {
		return "WEB-INF/view/admin/notice.jsp";
	}
	
	@RequestMapping("Qa.wp")
	public String qa() {
		return "WEB-INF/view/admin/qa.jsp";
	}
	
	@RequestMapping("Review.wp")
	public String review() {
		return "WEB-INF/view/admin/review.jsp";
	}
}