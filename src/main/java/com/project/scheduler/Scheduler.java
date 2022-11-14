package com.project.scheduler;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

@Component
public class Scheduler {
	
	/**
	 * 1. 매월 1일 새벽 2시에 자동으로 결재완료하는 스케쥴러
	 */
	// * 을 입력할경우 모두(항상)으로 설정함.
	//                 초  분  시  일  월  요일
//	@Scheduled(cron = "50 * * * * *")
//	public void autoUpdate(){
//		System.out.println("오후 02:14:00에 호출이 됩니다 ");
//	}
//	
}