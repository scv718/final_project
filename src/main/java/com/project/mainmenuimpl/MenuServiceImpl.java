package com.project.mainmenuimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.mainmenu.MenuService;
import com.project.mainmenu.MenuVO;

@Service("menuService")
public class MenuServiceImpl implements MenuService{
	
	@Autowired
	private MenuDAOMybatis menuDAO;

	@Override
	public List<MenuVO> typeWine(MenuVO vo) {
		// TODO Auto-generated method stub
		return null;
	}

	

}
