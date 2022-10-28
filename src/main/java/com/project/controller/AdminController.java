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
	
	@RequestMapping("adminIntroduce.wp")
	public String introduce() {
		return "WEB-INF/view/admin/adminintroduce.jsp";
	}
	
	@RequestMapping("adminSubscription.wp")
	public String subscription() {
		return "WEB-INF/view/admin/adminsubscription.jsp";
	}
	
	@RequestMapping("adminSalesdelivery.wp")
	public String salesdelivery() {
		return "WEB-INF/view/admin/adminsalesdelivery.jsp";
	}
	
	@RequestMapping("adminNotice.wp")
	public String notice() {
		return "WEB-INF/view/admin/adminnotice.jsp";
	}
	
	@RequestMapping("adminQna.wp")
	public String qa() {
		return "WEB-INF/view/admin/adminqna.jsp";
	}
	
	@RequestMapping("adminReview.wp")
	public String review() {
		return "WEB-INF/view/admin/adminreview.jsp";
	}
}