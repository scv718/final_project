package com.project.mainmenuimpl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.mainmenu.MenuVO;

@Repository
public class MenuDAOMybatis {

	@Autowired
	private SqlSessionTemplate mybatis;

	public List<MenuVO> typeMenu(MenuVO vo){
		return mybatis.selectList("MenuDAO.typeMenu", vo);
		
	}
	public List<MenuVO> bestMenu(MenuVO vo){
		return mybatis.selectList("MenuDAO.bestMenu", vo);
		
	}
	
}