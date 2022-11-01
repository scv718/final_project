package com.project.controller;

import java.util.HashMap;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.mainmenu.MenuVO;

@Controller
public class MainMenuController {
	
	@RequestMapping("typeMenu.wp")
	@ResponseBody
	public void typeMenu(@RequestParam("typeMenu") String typeMenu,MenuVO vo, Model model) {
		
	
	}

}
