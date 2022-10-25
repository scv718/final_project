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
//	private UserDAODBCP userDAO;
//	private UserDAO userDAO;

//	public void setUserDAO(UserDAODBCP userDAO) {
//		this.userDAO = userDAO;
//	}

	@Override
	public UserVO getUser(UserVO vo) {
		return userDAO.getUser(vo);
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
	public int checkUser(UserVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

//	@Override
//	public void insertUser(UserVO vo) {
//		userDAO.insertUser(vo);
//		
//	}
//
//	@Override
//	public void updateUser(UserVO vo) {
//		userDAO.updateUser(vo);
//		
//	}
//
//	@Override
//	public void deleteUser(UserVO vo) {
//		
//		userDAO.deleteUser(vo);
//	}
//
//	@Override
//	public List<UserVO> getUserList(UserVO vo) {
//		
//		return userDAO.getUserList(vo);
//	}


}
