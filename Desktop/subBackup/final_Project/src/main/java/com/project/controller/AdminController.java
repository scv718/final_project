package com.project.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.user.UserService;
import com.project.user.UserVO;



@Controller
public class AdminController {
	@Autowired
	private UserService userService;;
	
	@RequestMapping("adminMain.wp")
	public String main() {
		return "WEB-INF/view/admin/adminmain.jsp";
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
	public String qna() {
		return "WEB-INF/view/admin/adminqna.jsp";
	}
	
	@RequestMapping("adminReview.wp")
	public String review() {
		return "WEB-INF/view/admin/adminreview.jsp";
	}
	@RequestMapping(value="adminUser.wp")
	public String getUserList(UserVO vo, Model model){
	System.out.println("유저 불러오기");
	//addAttribute화면 뿌려주는놈
	model.addAttribute("UserList", userService.getUserList(vo));
	System.out.println("테스트");
		return "WEB-INF/view/admin/adminuser.jsp";
	}

	@RequestMapping(value="updateAd.wp")
	public String adminUpdate(UserVO vo, Model model) {
		System.out.println("유저 수정 받아오기");
		System.out.println(vo.getM_name());
		System.out.println(vo.getId());
//		System.out.println(vo.toString());
		userService.updateMember(vo); 
		model.addAttribute("UserList", userService.getUserList(vo));
		//얘는 뿌려줄게없으니 addAttribute넣는게 아니다
		return "WEB-INF/view/admin/adminuser.jsp";
		
	}
	@RequestMapping(value="deleteAd.wp")
	public String adminDelete(UserVO vo, Model model) {
		System.out.println("유저 삭제 받아오기");
		System.out.println(vo.toString());
		userService.deleteMember(vo); 
		model.addAttribute("UserList", userService.getUserList(vo));
		//얘는 뿌려줄게없으니 addAttribute넣는게 아니다
		return "WEB-INF/view/admin/adminuser.jsp";
		
	}

	
}