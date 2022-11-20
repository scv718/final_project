package com.project.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.project.order.OrderVO;
import com.project.wine.WineService;
import com.project.wine.WineVO;

@Controller
@SessionAttributes("wine")
public class WineSearchController {

	@Autowired
	private WineService wineService;

	@RequestMapping(value = "/wineSearch.wp")
	public String search(WineVO vo, Model model) {
		model.addAttribute("wineList", wineService.getWineList(vo));
		model.addAttribute("wineCount",wineService.getWineList(vo).size());
		return "WEB-INF/view/Search/wineSearchList.jsp";
	}

	@RequestMapping(value = "/getWineSearch.wp", method = RequestMethod.POST)
	public String getWineSearch(WineVO vo, Model model, String searchKeyword) {
		System.out.println("와인 키워드로 검색하기");
		model.addAttribute("wineList", wineService.getWineSearchList(vo));
		model.addAttribute("wineCount",wineService.getWineSearchList(vo).size());
		return "WEB-INF/view/Search/wineSearchList.jsp";

	}

	@RequestMapping(value = "detaileSearch.wp", method = RequestMethod.POST)
	public String detaileSearch(WineVO vo, Model model, String type, String continental, String country, String w_sweet,
			String w_body, String w_acidity, String w_tannins) {

		if (type == null) {
			vo.setType(5);
		} else {
			vo.setType(Integer.parseInt(type));
		}
		
		vo.setContinental(continental);
		vo.setCountry(country);
		
		if (w_sweet == null) {
			vo.setW_sweet(0);
		} else {
			vo.setW_sweet(Integer.parseInt(w_sweet));
		}

		if (w_body == null) {
			vo.setW_body(0);
		} else {
			vo.setW_body(Integer.parseInt(w_body));
		}

		if (w_acidity == null) {
			vo.setW_acidity(0);
		} else {
			vo.setW_acidity(Integer.parseInt(w_acidity));
		}

		if (w_tannins == null) {
			vo.setW_tannins(0);
		} else {
			vo.setW_tannins(Integer.parseInt(w_tannins));
		}
//		List<WineVO> listVo = new ArrayList();
//		if (type == null) {
//			System.out.println("타입 검색 없음");
//			String[] t_ar = type.split(",");
//			System.out.println("999999: "+t_ar.length);
//		} else {
//			System.out.println("타입 선택 있음.");
//			String[] t_ar = type.split(",");
//			System.out.println("999999: "+t_ar.length);
//			for (int i = 0; i < t_ar.length; i++) {
//				System.out.println(Integer.parseInt(t_ar[i]));
//				vo.setType(Integer.parseInt(t_ar[i]));
//				listVo.addAll(wineService.getType(vo));
//				System.out.println(listVo.size());
//			}
//		}
//
//		if (continental == null) {
//			System.out.println("대륙 검색 없음");
//
//		} else {
//			System.out.println("대륙 선택 있음.");
//			String[] conti_ar = continental.split(",");
//			for (int i = 0; i < conti_ar.length; i++) {
//				System.out.println(conti_ar[i]);
//				vo.setContinental(conti_ar[i]);
//				listVo.addAll(wineService.getContinental(vo));
//				System.out.println(listVo.size());
//			}
//		}
//
//		if (country == null) {
//			System.out.println("나라 검색 없음");
//
//		} else {
//			System.out.println("나라 선택 있음.");
//			String[] count_ar = country.split(",");
//			for (int i = 0; i < count_ar.length; i++) {
//				System.out.println(count_ar[i]);
//				vo.setContinental(count_ar[i]);
//				listVo.addAll(wineService.getCountry(vo));
//				System.out.println(listVo.size());
//			}
//		}
//
//		System.out.println(type);
//		System.out.println(continental);
//		System.out.println(country);
//		System.out.println(w_sweet + w_body + w_acidity + w_tannins);

		model.addAttribute("wineList", wineService.detaileSearch(vo));
		model.addAttribute("wineCount",wineService.detaileSearch(vo).size());
		
		return "WEB-INF/view/Search/wineSearchList.jsp";

	}

	//와인 등록 페이지 이동
	@RequestMapping(value = "/addWine.wp")
	public String insertWine(WineVO vo, Model model) {
		return "WEB-INF/view/admin/addWine.jsp";
	}
	
	@RequestMapping("/insertWine.wp")
	public String insertWine(HttpSession session, MultipartHttpServletRequest request, WineVO vo, Model model)
			throws IllegalStateException, IOException {

		MultipartFile uploadFile = vo.getUploadFile();
		String wine_img = uploadFile.getOriginalFilename();
		vo.setW_image1(wine_img);
		String realPath = "C:\\Users\\PC-24\\Desktop\\WineProject\\final_project\\src\\main\\webapp\\resources\\img\\wine";
		String path = session.getServletContext().getRealPath("/")+"resources\\img\\wine\\";
		// 절대 경로 변경할 위치
		System.out.println(wine_img);
		if (!uploadFile.isEmpty()) {
			uploadFile.transferTo(new File(path + wine_img));
		}
		wineService.insertWine(vo);
		return "adminWine.wp";
	}
	
	@RequestMapping(value="deleteWine.wp")
	public String adminDelete(WineVO vo, Model model) {
		wineService.deleteWine(vo); 
		return "adminWine.wp";
	}
	@RequestMapping(value="updateWine.wp")
	public String adminUpdate(HttpServletRequest request, WineVO vo, Model model) {
			
		String w_no1 = (String) request.getParameter("w_no");
		String quantity = (String) request.getParameter("quantity");
		String w_price = (String) request.getParameter("w_price");
		
		vo.setW_no(Integer.parseInt(w_no1));
		vo.setQuantity(Integer.parseInt(quantity));
		vo.setW_price(Integer.parseInt(w_price));
		wineService.updateWine(vo); 
		return "redirect:adminWine.wp";
	
	}
	
	@RequestMapping(value="updateorder.wp")
	public String updateorder(HttpServletRequest request, OrderVO vo, Model model) {
		
		System.out.println("컨트롤러탐");
		vo.setOrd_code(request.getParameter("ord_code"));
		vo.setCs_stat(request.getParameter("cs_stat"));
		vo.setOrd_stat(request.getParameter("ord_stat"));
		wineService.updateorder(vo); 
		return "redirect:adminSalesdelivery.wp";
	
	}
	
	
}
