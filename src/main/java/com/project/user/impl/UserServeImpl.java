package com.project.user.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.user.UserService;
import com.project.user.UserVO;

@Service("userService")
public class UserServeImpl implements UserService{
	@Autowired
	private UserDAOMybatis userDAO;

	@Override
	public UserVO getUser(UserVO vo) {
		return userDAO.getUser(vo);
	}

	@Override
	public int getUser1(UserVO vo) {
		System.out.println("impl getUser1");
		return userDAO.getUser1(vo);
	}
	
	@Override
	public void insertUser(UserVO vo) {
		userDAO.insertUser(vo);
		
	}

	@Override
	public void updateUser(UserVO vo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteUser(UserVO vo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<UserVO> getUserList(UserVO vo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int checkUser(String id) {
		// TODO Auto-generated method stub
		return userDAO.checkUser(id);
	}

	@Override
	public UserVO getID(UserVO vo) {
		// TODO Auto-generated method stub
		return userDAO.getId(vo);
	}

	@Override
	public int getPw(UserVO vo) {
		// TODO Auto-generated method stub
		return userDAO.getPw(vo);
	}

	@Override
	public int changePw(UserVO vo) {
		// TODO Auto-generated method stub
		return userDAO.changePw(vo);
	}

	@Override
	public UserVO getId(UserVO vo) {
		// TODO Auto-generated method stub
		return userDAO.getId(vo);
	}

	@Override
	public void kakaoInsertUser(UserVO vo) {
		// TODO Auto-generated method stub
		userDAO.kakaoInsertUser(vo);
	}


	




}
