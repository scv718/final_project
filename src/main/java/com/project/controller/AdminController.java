package com.project.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.community.NoticeService;
import com.project.community.NoticeVO;
import com.project.community.QnaService;
import com.project.community.QnaVO;
import com.project.order.OrderService;
import com.project.order.OrderVO;
import com.project.review.ReviewService;
import com.project.review.ReviewVO;
import com.project.user.UserService;
import com.project.user.UserVO;
import com.project.wine.WineService;
import com.project.wine.WineVO;



@Controller
public class AdminController {
	
	@Autowired
	private UserService userService;
	@Autowired
	private WineService wineService;
	@Autowired
	private OrderService orderService;
	@Autowired
	private NoticeService noticeService;
	@Autowired
	private QnaService qnaService;
	@Autowired
	private ReviewService reviewService;
	
	@RequestMapping("adminMain.wp")
	public String main() {
		return "WEB-INF/view/admin/adminmain.jsp";
	}
	
	@RequestMapping("adminSalesdelivery.wp")
	public String order(OrderVO vo, Model model) {
		model.addAttribute("OrderListAd", orderService.OrderListAd(vo));
		return "WEB-INF/view/admin/adminsalesdelivery.jsp";
	}
	
	@RequestMapping("adminIntroduce.wp")
	public String introduce() {
		return "WEB-INF/view/admin/adminintroduce.jsp";
	}
	
	@RequestMapping("adminStory.wp")
	public String adminStory() {
		return "WEB-INF/view/admin/adminStory.jsp";
	}
	
	
	
//	@RequestMapping("adminSubscription.wp")
//	public String subscription() {
//		return "WEB-INF/view/admin/adminsubscription.jsp";
//	}

	

	
	@RequestMapping("adminNotice.wp")
	public String NoticeListAd(NoticeVO vo, Model model) {
		model.addAttribute("NoticeListAd", noticeService.NoticeListAd(vo));
		return "WEB-INF/view/admin/adminnotice.jsp";
	}
	
	@RequestMapping("adminQna.wp")
	public String QnaListAd(QnaVO vo, Model model) {
		model.addAttribute("QnaListAd", qnaService.QnaListAd(vo));
		return "WEB-INF/view/admin/adminqna.jsp";
	}
	
	@RequestMapping("adminReview.wp")
	public String ReviewListAd(ReviewVO vo, Model model) {
		model.addAttribute("ReviewListAd", reviewService.ReviewListAd(vo));
		return "WEB-INF/view/admin/adminreview.jsp";
	}
	
	//관리자 리스트 컨트롤
	@RequestMapping(value="adminUser.wp")
	public String getUserList(UserVO vo, Model model){
		for(int i = 0; i<userService.getUserList(vo).size();i++) {
			System.out.println(userService.getUserList(vo).get(i).getM_status());
		}
	model.addAttribute("UserList", userService.getUserList(vo));
		return "WEB-INF/view/admin/adminuser.jsp";
	}
	
	
	//와인관리 리스트
	@RequestMapping(value="adminWine.wp")
	public String Wine(WineVO vo, Model model){
	//addAttribute화면 뿌려주는놈
	model.addAttribute("WineListAd", wineService.WineListAd(vo));
		return "WEB-INF/view/admin/adminwine.jsp";
	}
	
	@RequestMapping(value="updateAd.wp")
	public String adminUpdate(UserVO vo, Model model) {
		System.out.println("유저 수정 받아오기");
		System.out.println(vo.getM_name());
		System.out.println(vo.getId());
//		System.out.println(vo.toString());
		userService.updateMember(vo); 
		model.addAttribute("UserList", userService.getUserList(vo));
		return "WEB-INF/view/admin/adminuser.jsp";
		
	}
	@RequestMapping(value="deleteAd.wp")
	public String adminDelete(UserVO vo, Model model) {
		userService.secessionUser(vo);
		model.addAttribute("UserList", userService.getUserList(vo));
		return "WEB-INF/view/admin/adminuser.jsp";
	}
	@RequestMapping(value="delReview.wp")
	public String DeleteReview(ReviewVO vo, Model model) {
		reviewService.deleteReviewAd(vo); 
		model.addAttribute("deleteReviewAd");
		return "WEB-INF/view/admin/adminreview.jsp";
	}
}