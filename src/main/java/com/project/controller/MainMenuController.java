package com.project.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.mainmenu.MenuService;
import com.project.mainmenu.MenuVO;

@Controller
public class MainMenuController {
	
	@Autowired
	MenuService menuService;
	
	@RequestMapping("typeMenu.wp")
	@ResponseBody
	public List<MenuVO> typeMenu(@RequestParam("typeMenu") String typeMenu,MenuVO vo, Model model, HttpSession session) {
		
		int type = Integer.parseInt(typeMenu);
		if(type == 1) {
			session.setAttribute("type", "White");
		}else if (type == 2) {
			session.setAttribute("type", "Sparkling");
		}else if (type == 3) {
			session.setAttribute("type", "Rose");
		}else {
			session.setAttribute("type", "Red");
		}
		
		vo.setType((int)type);
		Map<String, String> map = new HashMap<String, String>();
//		model.addAttribute("typeMenuList", menuService.typeMenu(vo));
		session.setAttribute("typeMenuList", menuService.typeMenu(vo));
	
		System.out.println(menuService.typeMenu(vo));
		
		System.out.println(type);
		List<MenuVO> typeList = menuService.typeMenu(vo);
		return typeList;
	}
}
