package com.project.controller;

import java.io.File;
import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.project.intro.IntroVO;
import com.project.story.StoryService;
import com.project.story.StoryVO;

@Controller
//@SessionAttributes("story")
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
		model.addAttribute("story1_t", storyService.getStory1(vo));
		model.addAttribute("story1_c", storyService.getStoryList1(vo));
		return "WEB-INF/view/wineStory/wineStory1.jsp";
	}

	@RequestMapping(value = "/wineStory2.wp")
	public String wineStory2(StoryVO vo, Model model) {
		System.out.println("와인이야기2");
		model.addAttribute("story2_t", storyService.getStory2(vo));
		model.addAttribute("story2_c", storyService.getStoryList2(vo));
		return "WEB-INF/view/wineStory/wineStory2.jsp";
	}

	@RequestMapping(value = "/wineStory3.wp")
	public String wineStory3(StoryVO vo, Model model) {
		System.out.println("와인이야기3");
		model.addAttribute("story3_t", storyService.getStory3(vo));
		model.addAttribute("story3_c", storyService.getStoryList3(vo));
		return "WEB-INF/view/wineStory/wineStory3.jsp";
	}

	@RequestMapping("/admin_Story1.wp")
	public String admin_Story1(StoryVO vo, Model model) {
		System.out.println("스토리 컨트롤러까진 도착");
		System.out.println(storyService.getStory1(vo));
		model.addAttribute("story1_t", storyService.getStory1(vo));
		model.addAttribute("story1_c", storyService.getStoryList1(vo));
		return "WEB-INF/view/admin/admin_getStory1.jsp";
	}

	// 스토리수정 - 관리자
	@RequestMapping("/admin_updateStory1.wp")
	public String admin_updateStory1(MultipartHttpServletRequest request,StoryVO vo,
			Model model) throws IllegalStateException, IOException {

		MultipartFile uploadFile = vo.getUploadFile();
		MultipartFile uploadFile2 = vo.getUploadFile2();

		String realPath = "c:/swork/final_project/src/main/webapp/resources/img/story/";
		String story_b_img = uploadFile.getOriginalFilename();

		if (!uploadFile.isEmpty()) {
			vo.setStory_back_img(story_b_img);
			uploadFile.transferTo(new File(realPath + story_b_img));
		}

		String realPath2 = "c:/swork/final_project/src/main/webapp/resources/img/story/";
		String story_i_img = uploadFile2.getOriginalFilename();
		if (!uploadFile2.isEmpty()) {
			vo.setStory_add_img(story_i_img);
			uploadFile2.transferTo(new File(realPath2 + story_i_img));
		}

		storyService.admin_updateStory1(vo);
		return "wineStory1.wp";
	}

}
