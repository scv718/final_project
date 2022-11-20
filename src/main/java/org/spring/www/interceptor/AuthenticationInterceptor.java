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
		
		HttpSession session = request.getSession();
		Object obj = session.getAttribute("login");
		String path = request.getServletPath();
		if(obj == null) {
			session.setAttribute("error", 1);
			response.sendRedirect("signUp.wp");
			return false;
		}
//		//preHendle의 return은 컨트롤러 요청 uri 로 가도 되냐 안되냐를 허가하는 의미임
//		// 따라서 true로 하면 컨트롤러 uri로 가게됨.
		return true;
	}

	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			@Nullable ModelAndView modelAndView) throws Exception {
	}
	
	
}
