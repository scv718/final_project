package com.project.user;

import java.util.List;

public interface UserService {
	void insertUser(UserVO vo);
	void updateUser(UserVO vo);
	void deleteUser(UserVO vo);
	void secessionUser(UserVO vo);
	int checkUser(String id);
	List<UserVO> getUserList(UserVO vo);
	UserVO getUser(UserVO vo);
	UserVO getID(UserVO vo);
	int getPw(UserVO vo);
	int changePw(UserVO vo);
	UserVO getId(UserVO vo);
	void kakaoInsertUser(UserVO vo);
	
	//구독
	int getUser1(UserVO vo);
	int updateuserle0(UserVO vo);
	int updateuserle1(UserVO vo);
	int updateuserle2(UserVO vo);
	int updateuserle3(UserVO vo);
	
	
}