package com.project.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	
	@RequestMapping("errorsession.wp")
	public void errorsession(HttpServletResponse response, HttpSession session) {
		System.out.println("에러세션");
		session.setAttribute("error", 0);
	}
	@RequestMapping("passsession.wp")
	public void passsession(HttpServletResponse response, HttpSession session) {
		System.out.println("패스세션");
		session.setAttribute("signup", 0);
	}
	@RequestMapping(value = "login.wp", method = RequestMethod.POST)
	public String loginView(UserVO vo, HttpSession session, HttpServletResponse response) {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		System.out.println("로그인 인증 처리.....");
	

		if(vo.getId() == null || vo.getId().equals("")) {
			throw new IllegalArgumentException("아이디는 반드시 입력해야합니다");
		}
		if(userService.getUser(vo) != null) {
			if(passwordEncoder.matches(vo.getM_pw(), userService.getUser(vo).getM_pw())){
				if(userService.getUser(vo).getM_role().equals("admin")) {
					System.out.println("로그인아이디: "+userService.getUser(vo).getId());
					session.setAttribute("login", userService.getUser(vo).getId());
					session.setAttribute("userID", userService.getUser(vo).getId());
					session.setAttribute("userName", userService.getUser(vo).getM_name());
					session.setAttribute("userRole", userService.getUser(vo).getM_role());
					return "redirect:/adminMain.wp";
				}
				System.out.println("로그인아이디: "+userService.getUser(vo).getId());
				session.setAttribute("login", userService.getUser(vo).getId());
				session.setAttribute("userID", userService.getUser(vo).getId());
				session.setAttribute("userName", userService.getUser(vo).getM_name());
				return "redirect:/";
			}
			
		}else {
			
			
			PrintWriter script;
			try {
				script = response.getWriter();
				script.println("<script>");
				script.println("alert('존재하지 않는 아이디 입니다.');");
				script.println("location.href = 'signUp.wp'");
				script.println("</script>");
				script.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		
		}
		
		return "/";
	}
	
	@RequestMapping("/logout.wp")
	public String logout(HttpSession session) {
		session.invalidate();
		
		return "index.wp";
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
		
		String password = vo.getM_pw();
		String encryptPassword = passwordEncoder.encode(password);	
//		
//		vo.setM_birth("1995-07-18");
//		vo.setM_name("박상현");
//		vo.setM_phone("010-9618-3516");
		System.out.println(vo.getId());
		System.out.println(encryptPassword);
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
		String password = vo.getM_pw();
		String encryptPassword = passwordEncoder.encode(password);
		vo.setM_pw(encryptPassword);
		userService.changePw(vo);
 
        return "redirect:signUp.wp";
	}
	
	@RequestMapping(value = "/preference.wp")
	public String mypage() {
		System.out.println("취향 페이지 이동");
		return "WEB-INF/view/user/preference.jsp";
	}
	
	@RequestMapping(value = "/confirmPassword.wp")
	public String confirmPasswordpage(UserVO vo) {
		System.out.println("비밀번호 확인 페이지");
		return "WEB-INF/view/user/confirmPassword.jsp";
	}
	@RequestMapping(value = "/confirm.wp")
	public String confirmPassword(UserVO vo, HttpSession session, HttpServletResponse response, Model model) {
		System.out.println("비밀번호 확인하기");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		vo.setId((String) session.getAttribute("userID"));
		
	
		if(passwordEncoder.matches(vo.getM_pw(), userService.getUser(vo).getM_pw())) {		
			vo = userService.getUser(vo);
			model.addAttribute("vo", vo);
			return "WEB-INF/view/user/updateUserInfo.jsp";
		}else {
			PrintWriter script;
			try {
				script = response.getWriter();
				script.println("<script>");
				script.println("alert('비밀번호가 일치하지 않습니다.');");
				script.println("location.href = '/'");
				script.println("</script>");
				script.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return "redirect:/";
	}
	
	@RequestMapping(value = "/userEdit.wp")
	public String userEdit(UserVO vo, HttpSession session) {
	
		vo.setId((String) session.getAttribute("userID"));

	
		String password = vo.getM_pw();
		String encryptPassword = passwordEncoder.encode(password);
		vo.setM_pw(encryptPassword);
		
		userService.updateUser(vo);
		return "redirect:/";
	}
	@RequestMapping(value = "/preference_setting.wp")
	public String setting(SubscribeVO vo, HttpSession session) {
		vo.setId((String)session.getAttribute("userID"));
	
		subscribeservice.preference_Setting(vo);
		
		return "redirect:/";
	}
	
	@RequestMapping("deleteUser.wp")
	public String deleteUser(UserVO vo, HttpSession session) {
		
		vo.setId((String)session.getAttribute("name"));
		userService.deleteUser(vo);
		return "redirect:/";
		
	}


	
}
