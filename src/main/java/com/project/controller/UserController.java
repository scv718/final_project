package com.project.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.subscribe.SubscribeService;
import com.project.subscribe.SubscribeVO;
import com.project.user.UserService;
import com.project.user.UserVO;
@Controller
public class UserController {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private SubscribeService subscribeservice;
	
	@RequestMapping(value = "login.wp", method = RequestMethod.POST)
	public String loginView(UserVO vo, HttpSession session) {
	
		System.out.println("로그인 인증 처리.....");
		if(vo.getId() == null || vo.getId().equals("")) {
			throw new IllegalArgumentException("아이디는 반드시 입력해야합니다");
		}
		if(userService.getUser(vo) != null) {
			System.out.println("로그인아이디: "+userService.getUser(vo).getId());
			session.setAttribute("login", userService.getUser(vo).getId());
			System.out.println("1234");
			session.setAttribute("userID", userService.getUser(vo).getId());
			session.setAttribute("userName", userService.getUser(vo).getM_name());
			return "redirect:/";
		}else {
			return "redirect:/";
		}
	}
	
	@RequestMapping("/logout.wp")
	public String logout(HttpSession session) {
		session.invalidate();
		
		return "index.jsp";
	}
	
	
	@RequestMapping("/updateUserInfo.wp")
	public String updateUserInfo() {
		
		return "WEB-INF/view/user/updateUserInfo.jsp";
	}

	
	@RequestMapping("idCheck.wp")
	@ResponseBody
	public Map<Object, Object> check(@RequestBody String id) {
		System.out.println("아이디체크 컨트롤러");
		int count = 0;
        Map<Object, Object> map = new HashMap<Object, Object>();
 
        count = userService.checkUser(id);
        map.put("cnt", count);
 
        return map;
	}
	
	@RequestMapping(value="insertUser.wp" , method = RequestMethod.POST)
	public String insertUser(UserVO vo, SubscribeVO svo, HttpSession session) {
		System.out.println("회원가입 실행");
//		
		vo.setM_birth((String)session.getAttribute("birthday"));
		vo.setM_name((String)session.getAttribute("name"));
		vo.setM_phone((String)session.getAttribute("phone"));
		
//		
//		vo.setM_birth("1995-07-18");
//		vo.setM_name("박상현");
//		vo.setM_phone("010-9618-3516");
		System.out.println(vo.getId());
		System.out.println(vo.getM_pw());
		System.out.println(vo.getM_email());
		System.out.println(vo.getM_birth());
		
		userService.insertUser(vo);
		
	
		
		svo.setId(vo.getId());
		
		System.out.println("유저 아이디 값: "+ svo.getId());
		
		subscribeservice.insertSubscribe0(svo);
		
        return "redirect:/preference.wp";
	}
	
	@RequestMapping("changePw.wp")
	public String changePw(UserVO vo,HttpServletRequest request, HttpServletResponse response , HttpSession session) {
		
		String m_phone = (String) session.getAttribute("phone");
		vo.setM_phone(m_phone);
		
		userService.changePw(vo);
 
        return "redirect:singUp.wp";
	}
	
	@RequestMapping(value = "/preference.wp")
	public String mypage() {
		System.out.println("취향 페이지 이동");
		return "WEB-INF/view/user/preference.jsp";
	}
	@RequestMapping(value = "/preference_setting.wp")
	public String setting(SubscribeVO vo, HttpSession session) {
		System.out.println("취향 설정");
		
		
		vo.setId((String)session.getAttribute("userID"));
		System.out.println(vo.getS_body());
		System.out.println(vo.getS_acidity());
		System.out.println(vo.getS_sweet());
		System.out.println(vo.getS_tannins());
		System.out.println(vo.getId());
	
		subscribeservice.preference_Setting(vo);
		
		return "redirect:/";
	}
	
}
