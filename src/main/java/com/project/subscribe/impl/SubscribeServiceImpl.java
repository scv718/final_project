package com.project.subscribe.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.subscribe.SubscribeService;
import com.project.subscribe.SubscribeVO;
import com.project.user.UserService;
import com.project.user.UserVO;
import com.project.wine.ProductService;
import com.project.wine.WineVO;


@Service("subscribeService")
public class SubscribeServiceImpl implements SubscribeService {

	@Autowired
	private SubscribeDAOMybatis subscribeDAO;
	
	@Autowired
	private UserService userService;
	@Autowired
	private ProductService productService;
	@Override
	public void insertSubscribe0(SubscribeVO vo) {
		subscribeDAO.insertSubscribe0(vo);
	}
	@Override
	public void insertSubscribe1(SubscribeVO vo) {
		subscribeDAO.insertSubscribe1(vo);
	}
	@Override
	public void insertSubscribe2(SubscribeVO vo) {
		subscribeDAO.insertSubscribe2(vo);
	}
	@Override
	public void insertSubscribe3(SubscribeVO vo) {
		subscribeDAO.insertSubscribe3(vo);
	}

	@Override
	public void updateSubscribe(SubscribeVO vo) {
		subscribeDAO.updateSubscribe(vo);
	}

	@Override
	public int getSubscribe(SubscribeVO vo) {
		return subscribeDAO.getSubscribe(vo);
	}

	@Override
	public List<SubscribeVO> getSubscribeList(SubscribeVO vo) {
		return subscribeDAO.getSubscribeList(vo);
	}
	@Override
	public void preference_Setting(SubscribeVO vo) {
		subscribeDAO.preference_Setting(vo);
	}
	@Override
	public  List<SubscribeVO> level_shipping(String vo) {
		return subscribeDAO.level_shipping(vo);
	}
	@Override
	public void liset_deli_price(SubscribeVO vo) {
		subscribeDAO.liset_deli_price(vo);
		
	}
	@Override
	public void liset_deli_price_up(SubscribeVO vo) {
		subscribeDAO.liset_deli_price_up(vo);
		
	}
	@Override
	public SubscribeVO getLevel(SubscribeVO vo) {
		return subscribeDAO.getLevel(vo);
	}
	@Override
	public List<SubscribeVO> allsubscriptList(SubscribeVO vo) {
		return subscribeDAO.allsubscriptList(vo);
	}
	@Override
	public List<SubscribeVO> product(SubscribeVO vo, UserVO uvo, WineVO wvo) {
		List<SubscribeVO> lvo = new ArrayList<SubscribeVO>();
//		uvo.setId((String)session.getAttribute("userID"));
	for(int i =0 ; i< userService.getUserListDefault(uvo).size();i++) {
		vo.setId(userService.getUserListDefault(uvo).get(i).getId());
		if(subscribeDAO.getLevel(vo)!=null) {
			lvo.add(subscribeDAO.getLevel(vo));
		}
	}
	for(int i = 0; i<lvo.size(); i++) {
		vo.setId(lvo.get(i).getId());
	}
	return lvo;
}
	@Override
	public void insertProduct(SubscribeVO vo) {
		subscribeDAO.insertProduct(vo);
		
	}
}
