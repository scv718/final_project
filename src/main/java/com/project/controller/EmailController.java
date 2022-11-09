package com.project.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Random;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.user.UserService;
import com.project.user.UserVO;
import com.project.user.impl.UserDAOMybatis;

@Controller
public class EmailController {

	@Autowired
	MailSender sender;
	@Autowired
	HttpSession session;
	@Autowired
	private UserService userService;
	
	
	// 인증번호 이메일 전송 Ajax
	@ResponseBody
	@RequestMapping(value = "/email_Send.wp", method = RequestMethod.POST)
	public int mail_Send(@RequestBody HashMap<String, Object> param ) {
		System.out.println("email_Send이동");
		Random random = new Random();
		String key = "";

		String m_email = (String) param.get("m_email");
		SimpleMailMessage message = new SimpleMailMessage();
		message.setTo(m_email);
		
		//보낼 인증번호 난수 생성 로직
		for (int i = 0; i < 3; i++) {
			// A~Z(대문자)까지 랜덤 알파벳 생성
			int index = random.nextInt(25) + 65; 
			key += (char) index;
			// 랜덤 정수를 생성
			int numIndex = random.nextInt(10); 
			key += numIndex;
		}
		//이메일의 제목이 되는 부분
		message.setSubject("Winery - 인증번호 입력을 위한 메일 전송");
		//이메일의 내용이 되는 부분
		message.setText("인증 번호 : " + key);
		//이메일의 보내는 사람이 되는 부분(반드시 smtp설정한 이메일주소 입력, 다를 경우 인증 안됨) 예시: admin@gmail.com 등..
		message.setFrom("tototo215@gmail.com");
		System.out.println("인증번호 값: "+key);
		
		sender.send(message);
		session.setAttribute("emailKey", key);
		return 1;
	}

	// 이메일 인증번호 체크 Ajax
	@ResponseBody
	@RequestMapping(value = "/email_Check.wp", method = RequestMethod.POST)
	public boolean mail_Check(String emailCheck) {
		boolean result = false;
		String emailKey = (String) session.getAttribute("emailKey");
		System.out.println("보낸 인증번호 값 : " + emailKey + ", 사용자가 입력한 값 : " + emailCheck);
		if (emailCheck.equals(emailKey)) {
			result = true;
		}
		session.removeAttribute("emailKey");
		return result;
	}
	

	@RequestMapping(value = "/forgotid.wp", method = RequestMethod.POST)
	public void id_Send(UserVO vo, HttpServletResponse response,@RequestParam String m_email) {
		SimpleMailMessage message = new SimpleMailMessage();
		System.out.println("아이디찾기");
		vo = userService.getId(vo);
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		if (vo==null) {
			try {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('가입되지 않은 메일입니다.');");
				script.println("location.href = 'signUp.wp'");
				script.println("</script>");
				script.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else {
			message.setTo(m_email);
			//이메일의 제목이 되는 부분
			message.setSubject("Winery 아이디");
			//이메일의 내용이 되는 부분
			message.setText("아이디: "+ vo.getId());
			//이메일의 보내는 사람이 되는 부분(반드시 smtp설정한 이메일주소 입력, 다를 경우 인증 안됨) 예시: admin@gmail.com 등..
			message.setFrom("tototo215@gmail.com");
			sender.send(message);
			

			try {
				PrintWriter script = response.getWriter();
		
				script.println("<script>");
				script.println("alert('메일로 아이디를 전송했습니다.');");
				script.println("location.href = 'signUp.wp'");
				script.println("</script>");
				script.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
	}
	

}