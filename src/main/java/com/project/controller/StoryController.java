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
		model.addAttribute("story1_t",storyService.getStory1(vo));
		model.addAttribute("story1_c",storyService.getStoryList1(vo));
		return "WEB-INF/view/wineStory/wineStory1.jsp";
	}
	
	@RequestMapping(value = "/wineStory2.wp")
	public String wineStory2(StoryVO vo, Model model) {
		System.out.println("와인이야기2");
		model.addAttribute("story2_t",storyService.getStory2(vo));
		model.addAttribute("story2_c",storyService.getStoryList2(vo));
		return "WEB-INF/view/wineStory/wineStory2.jsp";
	}
	
	@RequestMapping(value = "/wineStory3.wp")
	public String wineStory3(StoryVO vo, Model model) {
		System.out.println("와인이야기3");
		model.addAttribute("story3_t",storyService.getStory3(vo));
		model.addAttribute("story3_c",storyService.getStoryList3(vo));
		return "WEB-INF/view/wineStory/wineStory3.jsp";
	}
	
	
	

}
