package org.spring.www.interceptor;

import javax.mail.Session;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.maven.shared.invoker.SystemOutHandler;
import org.springframework.lang.Nullable;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;



public class AuthenticationInterceptor implements HandlerInterceptor{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		System.out.println("인터셉터 preHandle()메소드 수행");
		HttpSession session = request.getSession();
		Object obj = session.getAttribute("login");
		String path = request.getServletPath();
		System.out.println("path: " +path);
		System.out.println("로그인세션없음");
		if(obj == null) {
			System.out.println("실패패");
			session.setAttribute("error", 1);
			response.sendRedirect("signUp.wp");
			return false;
		}else if (path.contains("/updateBoard.do") || path.contains("/deleteBoard.do")) {
			System.out.println("성공공공");
			if(!(request.getParameter("writer").equals(session.getAttribute("userName").toString()))) {
				System.out.println("수정삭제");
				response.sendRedirect("getBoard.do?error=1&seq= "+request.getParameter("seq"));
			}
		}
//		//preHendle의 return은 컨트롤러 요청 uri 로 가도 되냐 안되냐를 허가하는 의미임
//		// 따라서 true로 하면 컨트롤러 uri로 가게됨.
		System.out.println("여긴 들르냐?");
		return true;
	}

	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			@Nullable ModelAndView modelAndView) throws Exception {
		System.out.println("인터셉터 PostHandle 수행");
	}
	
	
}
