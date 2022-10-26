package com.project.user;

import java.util.List;

public interface UserService {


	void insertUser(UserVO vo);
	void updateUser(UserVO vo);
	void deleteUser(UserVO vo);
	List<UserVO> getUserList(UserVO vo);
	UserVO getUser(UserVO vo);
<<<<<<< Updated upstream
=======
	UserVO getID(UserVO vo);
	int getPw(UserVO vo);
>>>>>>> Stashed changes

}