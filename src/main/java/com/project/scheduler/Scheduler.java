//package com.project.scheduler;
//
//import java.util.Enumeration;
//
//import javax.servlet.ServletContext;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpSession;
//import javax.servlet.http.HttpSessionContext;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.scheduling.annotation.Scheduled;
//import org.springframework.stereotype.Component;
//import org.springframework.web.context.request.RequestContextHolder;
//import org.springframework.web.context.request.ServletRequestAttributes;
//
//import com.project.subscribe.SubscribeService;
//import com.project.subscribe.SubscribeVO;
//
//@Component
//public class Scheduler {
//	
////	
////	/**
////	 * 1. 매월 1일 새벽 2시에 자동으로 결재완료하는 스케쥴러
////	 */
////	 * 을 입력할경우 모두(항상)으로 설정함.
////	                 초  분  시  일  월  요일
////	@Scheduled(cron = "0 14 14 * * *")
//	@Scheduled(cron = "10 * * * * *")
//		public void autoUpdate(){
//		
//		System.out.println("오후 02:14:00에 호출이 됩니다 ");
//	}
//	
//}