package com.project.subscribe.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.subscribe.SubscribeService;
import com.project.subscribe.SubscribeVO;

@Service("subscribeService")
public class SubscribeServiceImpl implements SubscribeService {
	
	@Autowired
	private SubscribeDAOMybatis subscribeDAO;

	@Override
	public void insertSubscribe(SubscribeVO vo) {
		subscribeDAO.insertSubscribe(vo);	
	}

	@Override
	public void updateSubscribe(SubscribeVO vo) {
		subscribeDAO.updateSubscribe(vo);
	}

	@Override
	public void deleteSubscribe(SubscribeVO vo) {
		subscribeDAO.deleteSubscribe(vo);
	}
	
	@Override
	public SubscribeVO getSubscribe(SubscribeVO vo) {
		return subscribeDAO.getSubscribe(vo);
	}
	
	@Override
	public List<SubscribeVO> getSubscribeList(SubscribeVO vo) {
		return subscribeDAO.getSubscribeList(vo);		
	}

}
