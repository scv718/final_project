package com.project.subscribe.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.subscribe.SubscribeService;
import com.project.subscribe.SubscribeVO;
import com.project.user.UserVO;

@Service("subscribeService")
public class SubscribeServiceImpl implements SubscribeService {

	@Autowired
	private SubscribeDAOMybatis subscribeDAO;

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
}
