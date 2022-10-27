package com.project.user;

import java.util.List;

public interface UserService {


	void insertUser(UserVO vo);
	void updateUser(UserVO vo);
	void deleteUser(UserVO vo);
	int checkUser(String id);
	List<UserVO> getUserList(UserVO vo);
	UserVO getUser(UserVO vo);
	UserVO getID(UserVO vo);
	int getPw(UserVO vo);
	int changePw(UserVO vo);
	UserVO getId(UserVO vo);
	void kakaoInsertUser(UserVO vo);
}