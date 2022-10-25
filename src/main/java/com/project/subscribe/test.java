package com.project.subscribe;

import javax.servlet.http.HttpSession;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

public class test {
	
		//구독하기 테스트
		public static void main(String[] args, HttpSession session) {
			AbstractApplicationContext container = new GenericXmlApplicationContext("applicationContext.xml");
			SubscribeService subscribeService = (SubscribeService) container.getBean("subscribeService");

			SubscribeVO vo = new SubscribeVO();
			vo.setId((String) session.getAttribute("userId")); //아이디
			vo.setLevel(0); //회원 등급 (디폴트(0), 초급(1), 중급(2), 고급(3) 총 4단계)
			vo.setOption("구독X"); //구독 선택
			vo.setS_date("sysdate");//구독 시작일자
			vo.setE_date("sysdate"); //구독 종료 일자
			vo.setSub_status(0); //구독 상태
		
			container.close();
		}
	}
