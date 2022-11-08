package com.project.mainmenu;

import java.util.List;

public interface MenuService {
	
	List<MenuVO> typeMenu(MenuVO vo);
	List<MenuVO> bestMenu(MenuVO vo);
	
}