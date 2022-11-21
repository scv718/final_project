package com.project.user.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.user.AddressVO;
import com.project.user.UserVO;

@Repository
public class UserDAOMybatis {

	@Autowired
	SqlSessionTemplate mybatis;

	public UserVO getUser(UserVO vo) {

		return mybatis.selectOne("UserDAO.getUser", vo);

	}
	public List<UserVO> getUserListDefault(UserVO vo){
		return mybatis.selectList("UserDAO.getUserPw", vo);
	}

	public List<UserVO> getUserList(UserVO vo) {
		
		List<UserVO> a = mybatis.selectList("UserDAO.getUserList");
		return mybatis.selectList("UserDAO.getUserList");
	}


	public void insertUser(UserVO vo) {
		mybatis.insert("UserDAO.insertUser", vo);

	}

	public UserVO getId(UserVO vo) {

		return mybatis.selectOne("UserDAO.getId", vo);
	}

	public int getPw(UserVO vo) {

		return mybatis.selectOne("UserDAO.getPw", vo);
	}

	public int changePw(UserVO vo) {
		return mybatis.update("UserDAO.changePw", vo);
	}

	public void kakaoInsertUser(UserVO vo) {
		mybatis.insert("UserDAO.insertKakaoUser", vo);
	}
	public void updateUser(UserVO vo) {
		mybatis.update("UserDAO.updateUser", vo);
	}
	
	//아이디 체크
	public int checkUser(String id) {
		return mybatis.selectOne("UserDAO.checkUser", id);
	}
	
	
	//구독 level 
	public int getUser1(UserVO vo) {
		return mybatis.selectOne("UserDAO.getUser1", vo);
	}
	//구독 취소 
	public int updateuserle0(UserVO vo) {
		return mybatis.insert("UserDAO.updateuserle0", vo);
	}
	//구독하기 클릭시 level 수정
	public int updateuserle1(UserVO vo) {
		return mybatis.insert("UserDAO.updateuserle1", vo);
	}
	public int updateuserle2(UserVO vo) {
		return mybatis.insert("UserDAO.updateuserle2", vo);
	}
	public int updateuserle3(UserVO vo) {
		return mybatis.insert("UserDAO.updateuserle3", vo);
	}

	public void deleteUser(UserVO vo) {
		mybatis.delete("UserDAO.deleteUser", vo);
	}
	public void secessionUser(UserVO vo) {
		mybatis.update("UserDAO.secessionUser", vo);
	}
	
	//관리자
	public void updateMember(UserVO vo) {
		mybatis.update("UserDAO.updateMember", vo);
	}
	public void deleteMember(UserVO vo) {
		mybatis.delete("UserDAO.deleteMember", vo);
	}
	public void deleteaddr(UserVO vo) {
		mybatis.delete("UserDAO.deleteaddr", vo);
	}
}
