package com.project.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.project.wine.WineService;
import com.project.wine.WineVO;



@Controller
@SessionAttributes("wine")
public class WineSearchController {

	@Autowired
	private WineService wineService;
	
	@RequestMapping(value = "/wineSearch.wp")
	public String search(WineVO vo, Model model) {
		System.out.println("와인 검색하기");
		System.out.println(wineService.getWineList(vo));
		model.addAttribute("wineList", wineService.getWineList(vo));
		return "WEB-INF/view/Search/wineSearchList.jsp";
	}
	
	@RequestMapping(value = "/getWineSearch.wp")
	public String getWineSearch(WineVO vo, Model model, HttpSession session) {
		System.out.println("와인 키워드로 검색하기");
		String keyWord = ((String) session.getAttribute("searchKeyword"));
		System.out.println(keyWord);
		model.addAttribute("wineList", wineService.getWineSearchList(vo));
		return "/wineSearch.wp";
	}
	
}
