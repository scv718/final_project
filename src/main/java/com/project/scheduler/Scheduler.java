package com.project.scheduler;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.project.subscribe.SubscribeService;
import com.project.subscribe.SubscribeVO;
import com.project.user.UserVO;
import com.project.wine.ProductService;
import com.project.wine.WineVO;


@Component
public class Scheduler {
	
	@Autowired
	private SubscribeService subService;
	@Autowired 
	private ProductService productService;
	
//	
//	/**
//	 * 1. 매월 1일 새벽 2시에 자동으로 결재완료하는 스케쥴러
//	 */
//	 * 을 입력할경우 모두(항상)으로 설정함.
//	                 초  분  시  일  월  요일
//	@Scheduled(cron = "0 14 14 * * *")
	@Scheduled(cron = "0 14 14 * * *")
		public void autoUpdate(){
		SubscribeVO vo = new SubscribeVO();
		UserVO uvo = new UserVO();
		WineVO wvo = new WineVO();
		int size = 0;
		subService.product(vo, uvo, wvo);
		System.out.println(subService.product(vo, uvo, wvo));
		List<WineVO> lwvo = new ArrayList();
		for(int i =0; i<subService.product(vo, uvo, wvo).size(); i++) {
			vo.setId(subService.product(vo, uvo, wvo).get(i).getId());
			productService.subscribeproduct(vo);
			lwvo.addAll(productService.subscribeproduct(vo));
		}
		double random=Math.random();
		int num = 0;
		List<Integer> intlist = new ArrayList<Integer>();
		List<Integer> sizelist = new ArrayList<Integer>();
		List<Integer> totallist = new ArrayList<Integer>();
		List<String> userList = new ArrayList<String>();
		for(int i = 0; i<subService.product(vo, uvo, wvo).size();i++) {
			
			userList.add(subService.product(vo, uvo, wvo).get(i).getId());
			vo.setId(subService.product(vo, uvo, wvo).get(i).getId());
			size =  productService.subscribeproduct(vo).size();
			System.out.println(vo.getId());
			sizelist.add(size);
			for(int j= 0; j<productService.subscribeproduct(vo).size();j++) {
				System.out.print(productService.subscribeproduct(vo).get(j).getW_no());				 
			     num = (int)Math.round(random * (size-1));		    
			     intlist.add(productService.subscribeproduct(vo).get(j).getW_no());
			}
			System.out.println("다음캐릭");
		}
		System.out.println("배열");
	
		System.out.println(sizelist);
		System.out.println(intlist);
		System.out.println(userList);
		
		for(int i = 0; i<sizelist.size();i++) {
			
			totallist.addAll(intlist.subList(0, sizelist.get(i)-1));
			
			System.out.println(totallist);
			System.out.println("섞기전");
			Collections.shuffle(totallist);
			
			vo.setS_product(totallist.get(0).toString());
			vo.setS_product2(totallist.get(1).toString());
			vo.setS_product3(totallist.get(2).toString());
			vo.setId(userList.get(i));
			
			subService.insertProduct(vo);
			
			System.out.println(totallist);
			System.out.println("섞기후");
			for(int j=0; j<totallist.size();j++) {
				totallist.remove(j--);
			}
			System.out.println(totallist);
			System.out.println("초기화");
		}
		System.out.println(size);
		System.out.println(num);
		System.out.println("오후 02:14:00에 호출이 됩니다 ");
	}
	
}