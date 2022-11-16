package com.project.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.apache.maven.shared.invoker.SystemOutHandler;
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

	// 관리자 수정 페이지로 이동됨.(1페이지)
	@RequestMapping("/admin_Story1.wp")
	public String admin_Story1(StoryVO vo, Model model) {
		System.out.println("스토리 컨트롤러까진 도착");
		model.addAttribute("story1_t", storyService.getStory1(vo));
		model.addAttribute("story1_c", storyService.getStoryList1(vo));
		return "WEB-INF/view/admin/admin_getStory1.jsp";
	}

	// 관리자 수정 페이지로 이동됨.(2페이지)
	@RequestMapping("/admin_Story2.wp")
	public String admin_Story2(StoryVO vo, Model model) {
		System.out.println("스토리 컨트롤러까진 도착");
		model.addAttribute("story2_t", storyService.getStory2(vo));
		model.addAttribute("story2_c", storyService.getStoryList2(vo));
		return "WEB-INF/view/admin/admin_getStory2.jsp";
	}

	// 관리자 수정 페이지로 이동됨.(3페이지)
	@RequestMapping("/admin_Story3.wp")
	public String admin_Story3(StoryVO vo, Model model) {
		System.out.println("스토리 컨트롤러까진 도착");
		model.addAttribute("story3_t", storyService.getStory3(vo));
		model.addAttribute("story3_c", storyService.getStoryList3(vo));
		return "WEB-INF/view/admin/admin_getStory3.jsp";
	}

	// 스토리 타이틀 수정1-t - 관리자
	@RequestMapping("/admin_updateStory1.wp")
	public String admin_updateStory1(MultipartHttpServletRequest request, StoryVO vo, Model model)
			throws IllegalStateException, IOException {

		MultipartFile uploadFile = vo.getUploadFile();
		String story_b_img = uploadFile.getOriginalFilename();
		vo.setStory_back_img(story_b_img);
		String realPath = "C:\\Users\\PC-24\\Desktop\\WineProject\\final_project\\src\\main\\webapp\\resources\\img\\story";
		// 절대 경로 변경할 위치
		System.out.println(story_b_img);
		if (!uploadFile.isEmpty()) {
			uploadFile.transferTo(new File(realPath + story_b_img));
		}
		storyService.admin_updateStory1(vo);
		
		if (vo.getStory_p_no() == 1) {

			return "admin_Story1.wp";

		} else if (vo.getStory_p_no() == 2) {

			return "admin_Story2.wp";

		} else {

			return "admin_Story3.wp";
		}
	}

	// 스토리 콘텐츠 수정 보드로 이동
	@RequestMapping("/admin_updateStory1_c_m.wp")
	public String admin_StoryBoard(HttpServletRequest request, StoryVO vo, Model model) {
		String val1 = (String) request.getParameter("val1");
		String val2 = (String) request.getParameter("val2");
		System.out.println(val1);
		vo.setStory_p_no(Integer.parseInt(val1));
		System.out.println(val2);
		vo.setStory_a_no(Integer.parseInt(val2));
		System.out.println("스토리 보드까진 도착");
		model.addAttribute("story1_c_b", storyService.getStory1_1(vo));
		System.out.println(vo);

		return "WEB-INF/view/wineStory/updateStoryboard.jsp";
	}

// 	스토리 콘텐츠 수정 진행 - 관리자
	@RequestMapping("/admin_updateStory1_c.wp")
	public String admin_updateStory1_c(MultipartHttpServletRequest request, StoryVO vo, Model model)
			throws IllegalStateException, IOException {

		System.out.println(vo.toString());
		MultipartFile uploadFile2 = vo.getUploadFile2();
		String story_a_img = uploadFile2.getOriginalFilename();
		vo.setStory_add_img(story_a_img);
		String realPath = "C:\\Users\\PC-24\\Desktop\\WineProject\\final_project\\src\\main\\webapp\\resources\\img\\story";
		// 절대 경로 변경할 위치
		System.out.println(story_a_img);
		if (!uploadFile2.isEmpty()) {
			uploadFile2.transferTo(new File(realPath + story_a_img));
		}

		storyService.admin_updateStory1_c(vo);

		System.out.println(vo.getStory_p_no());

		if (vo.getStory_p_no() == 1) {

			return "admin_Story1.wp";

		} else if (vo.getStory_p_no() == 2) {

			return "admin_Story2.wp";

		} else {

			return "admin_Story3.wp";
		}
	}
	
	// 스토리 콘텐츠 수정 보드로 이동 - 3페이지 컨텐츠.
		@RequestMapping("/admin_updateStory3_c_m.wp")
		public String admin_StoryBoard3(HttpServletRequest request, StoryVO vo, Model model) {
			String val1 = (String) request.getParameter("val1");
			String val2 = (String) request.getParameter("val2");
			System.out.println(val1);
			vo.setStory_p_no(Integer.parseInt(val1));
			System.out.println(val2);
			vo.setStory_a_no(Integer.parseInt(val2));
			System.out.println("스토리 보드까진 도착");
			model.addAttribute("story1_c_b", storyService.getStory1_1(vo));
			System.out.println(vo);

			return "WEB-INF/view/wineStory/updateStoryboard3.jsp";
		}

	

}
