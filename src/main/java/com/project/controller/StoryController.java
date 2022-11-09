package com.project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.project.story.StoryService;
import com.project.story.StoryVO;

@Controller
@SessionAttributes("story")
public class StoryController {
	
	
	@Autowired
	private StoryService storyService;
	
	@RequestMapping(value = "/wineStory.wp")
	public String wineStory() {
		System.out.println("와인이야기");
		return "WEB-INF/view/wineStory/wineStory.jsp";
	}
	
	@RequestMapping(value = "/wineStory1.wp")
	public String wineStory1(StoryVO vo, Model model) {
		System.out.println("와인이야기1");
		
		model.addAttribute("Story1_t",storyService.getStory1(vo));
		System.out.println(storyService.getStory1(vo).toString());
		model.addAttribute("story1_c",storyService.getStoryList1(vo));
		return "WEB-INF/view/wineStory/wineStory1.jsp";
	}
	
	@RequestMapping(value = "/wineStory2.wp")
	public String wineStory2() {
		System.out.println("와인이야기2");
		return "WEB-INF/view/wineStory/wineStory2.jsp";
	}
	
	@RequestMapping(value = "/wineStory3.wp")
	public String wineStory3() {
		System.out.println("와인이야기3");
		return "WEB-INF/view/wineStory/wineStory3.jsp";
	}
	
	
	

}
