package com.project.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.project.common.PagingVO;
import com.project.community.AnswerVO;
import com.project.community.CommunityVO;
import com.project.community.Impl.QnaDAOMybatis;
import com.project.review.ReviewVO;

@Controller
@SessionAttributes("community")
public class QnaController {

	@Autowired
	private QnaDAOMybatis qnaService;
	// ========= 사용자 ===========

	// 1:1 문의 등록 - 사용자
	@GetMapping(value = "/insertQna_get.wp")
	public String insertQna_get(CommunityVO vo, HttpSession session) throws IllegalStateException, IOException {
		return "WEB-INF/view/community/insertQna.jsp";
	}

	// 1:1 문의 등록 - 사용자
	@ResponseBody
	@RequestMapping(value = "/insertQna.wp", method = RequestMethod.POST)
	public int insertQna(@RequestParam("article_file") List<MultipartFile> multipartFile, HttpServletRequest request,
			CommunityVO vo, HttpSession session) {

		String realPath = "c:/swork/final_Project/src/main/webapp/resources/img/qna/";
		int commu_no = vo.getCommu_no();
		System.out.println("vo: " + vo);
		try {
			// 파일이 있을때 탄다.
			if (multipartFile.size() > 0 && !multipartFile.get(0).getOriginalFilename().equals("")) {
				int index = 1;
				for (MultipartFile file : multipartFile) {

					String originalFileName = file.getOriginalFilename(); // 오리지날 파일명
					String extension = originalFileName.substring(originalFileName.lastIndexOf(".")); // 파일 확장자
					String savedFileName = UUID.randomUUID() + extension; // 저장될 파일명
					System.out.println("파일명" + savedFileName);

					if (index == 1) {
						vo.setCommu_photo1(savedFileName);
					} else if (index == 2) {
						vo.setCommu_photo2(savedFileName);
					} else {
						vo.setCommu_photo3(savedFileName);
					}
					index++;
					File targetFile = new File(realPath + savedFileName);

					try {
						InputStream fileStream = file.getInputStream();
						FileUtils.copyInputStreamToFile(fileStream, targetFile); // 파일 저장
					} catch (Exception e) {
						// 파일삭제
						FileUtils.deleteQuietly(targetFile); // 저장된 현재 파일 삭제
						e.printStackTrace();
						break;
					}
				}
				qnaService.insertQna(vo);
			}
			// 파일 아무것도 첨부 안했을때 탄다.
			else {
				qnaService.insertQna(vo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return commu_no;

	}

	// 1:1 문의 수정 - 사용자
	@GetMapping(value = "/updateQna_get.wp")
	public String updateQna_get(CommunityVO vo, Model model) throws IllegalStateException, IOException {
		return "WEB-INF/view/community/updateQna.jsp";
	}

	// 1:1 문의 수정 - 사용자
	@ResponseBody
	@RequestMapping(value = "/updateQna.wp", method = RequestMethod.POST)
	public int updateQna(@RequestParam("article_file") List<MultipartFile> multipartFile, HttpServletRequest request,
			@ModelAttribute("community") CommunityVO vo, HttpSession session) {

		String realPath = "c:/swork/final_Project/src/main/webapp/resources/img/qna/";
		int commu_no = vo.getCommu_no();
		System.out.println("vo: " + vo);
		try {
			// 파일이 있을때 탄다.
			if (multipartFile.size() > 0 && !multipartFile.get(0).getOriginalFilename().equals("")) {
				int index = 1;
				for (MultipartFile file : multipartFile) {

					String originalFileName = file.getOriginalFilename(); // 오리지날 파일명
					String extension = originalFileName.substring(originalFileName.lastIndexOf(".")); // 파일 확장자
					String savedFileName = UUID.randomUUID() + extension; // 저장될 파일명

					if (index == 1) {
						vo.setCommu_photo1(savedFileName);
					} else if (index == 2) {
						vo.setCommu_photo2(savedFileName);
					} else {
						vo.setCommu_photo3(savedFileName);
					}
					index++;
					File targetFile = new File(realPath + savedFileName);

					try {
						InputStream fileStream = file.getInputStream();
						FileUtils.copyInputStreamToFile(fileStream, targetFile); // 파일 저장
					} catch (Exception e) {
						// 파일삭제
						FileUtils.deleteQuietly(targetFile); // 저장된 현재 파일 삭제
						e.printStackTrace();
						break;
					}
				}
				qnaService.updateQna(vo);
			}
			// 파일 아무것도 첨부 안했을때 탄다.
			else {
				qnaService.updateQna(vo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return commu_no;

	}

	// 1:1 문의 삭제 - 사용자
	@RequestMapping("/deleteQna.wp")
	public String deleteReview(CommunityVO vo, HttpSession session) {
		String realPath = "c:/swork/final_Project/src/main/webapp/resources/img/qna/";
		File targetFile = null;
		vo = qnaService.getQna(vo);
		if (vo.getId().equals(session.getAttribute("userID").toString())) {
			if (vo.getCommu_photo1() != null) {
				targetFile = new File(realPath + vo.getCommu_photo1());
				targetFile.delete();
				System.out.println("파일1삭제: " + realPath + vo.getCommu_photo1());
			} else if (vo.getCommu_photo2() != null) {
				targetFile = new File(realPath + vo.getCommu_photo2());
				targetFile.delete();
				System.out.println("파일2삭제: " + realPath + vo.getCommu_photo2());
			} else if (vo.getCommu_photo3() != null) {
				targetFile = new File(realPath + vo.getCommu_photo3());
				targetFile.delete();
				System.out.println("파일3삭제: " + realPath + vo.getCommu_photo3());
			}
			qnaService.deleteQna(vo);
			return "getQnaList.wp";
		} else {
			return "detailReview.wp?error=1";
		}
	}

	// 1:1 문의 상세 조회 - 사용자
	@RequestMapping("/getQna.wp")
	public String getQna(CommunityVO vo, Model model) {
		System.out.println(qnaService.getQna(vo));
		model.addAttribute("community", qnaService.getQna(vo));
		return "WEB-INF/view/community/updateQna.jsp";
	}

	// 1:1 문의 목록 조회 - 사용자
	@RequestMapping("/getQnaList.wp")
	public String getQnaList(CommunityVO vo, String nowPageBtn, Model model, HttpSession session) {

		vo.setId((String) session.getAttribute("userID"));

		// 총 목록 수
		int totalPageCnt = qnaService.totalQnaListCnt(vo);

		// 현재 페이지 설정
		int nowPage = Integer.parseInt(nowPageBtn == null || nowPageBtn.equals("") ? "1" : nowPageBtn);
		System.out.println("totalPageCnt: " + totalPageCnt + ", nowPage: " + nowPage);

		// 한페이지당 보여줄 목록 수
		int onePageCnt = 10;

		// 한 번에 보여질 버튼 수
		int oneBtnCnt = 5;

		PagingVO pvo = new PagingVO(totalPageCnt, onePageCnt, nowPage, oneBtnCnt);
		vo.setOffset(pvo.getOffset());

		model.addAttribute("paging", pvo);
		model.addAttribute("getQnaList", qnaService.getQnaList(vo));
		return "WEB-INF/view/community/getQnaList.jsp";
	}

	// ========= 관리자 ===========

	// 검색창
	@ModelAttribute("conditionMap")
	public Map<String, String> searchConditionMap() {
		Map<String, String> conditionMap = new HashMap<String, String>();
		conditionMap.put("작성자", "ID");
		return conditionMap;
	}

	// 관리자 1:1 답변 등록
	@PostMapping(value = "/admin_insertQna.wp")
	public String insertQna(AnswerVO vo, Model model) throws IllegalStateException, IOException {

		// 답변상태
		qnaService.answerCount(vo.getCommu_no());

		qnaService.admin_insertQna(vo);
		return "redirect:admin_getQnaList.wp";
	}

	// 1:1 문의 수정 - 관리자
	@PostMapping("/admin_updateQna.wp")
	public String admin_updateQna(@ModelAttribute("community") CommunityVO vo, Model model)
			throws IllegalStateException, IOException {
//		if( vo.getId().equals(session.getAttribute("userID").toString()) ){
//			boardService.updateBoard(vo);
//			return "getBoardList.do";
//		}else {
//			return "getBoard.do?error=1";
//		}
		qnaService.admin_updateQna(vo);
		return "admin_getQnaList.wp";

	}

	// 1:1 문의 수정 - 관리자
	@GetMapping(value = "/admin_updateQna.wp")
	public String admin_updateQna_get(CommunityVO vo, Model model) throws IllegalStateException, IOException {
		return "WEB-INF/view/community/admin_updateQna.jsp";
	}

	// 1:1 문의 상세 조회 - 관리자
	@RequestMapping("/admin_getQna.wp")
	public String admin_getQna(CommunityVO vo, Model model) {
		model.addAttribute("community", qnaService.admin_getQna(vo));
		System.out.println("컨트롤러qna" + qnaService.admin_getQna(vo).getAnswer_no());
		return "WEB-INF/view/community/admin_insertQna.jsp";
	}

	// 1:1 문의 목록 조회 - 관리자
	@RequestMapping("/admin_getQnaList.wp")
	public String admin_getQnaList(CommunityVO vo, String nowPageBtn, Model model, HttpSession session) {
		System.out.println("글 목록 검색 처리");

		// 총 목록 수
		int totalPageCnt = qnaService.admin_totalQnaListCnt(vo);

		// 현재 페이지 설정
		int nowPage = Integer.parseInt(nowPageBtn == null || nowPageBtn.equals("") ? "1" : nowPageBtn);
		System.out.println("totalPageCnt: " + totalPageCnt + ", nowPage: " + nowPage);

		// 한페이지당 보여줄 목록 수
		int onePageCnt = 10;

		// 한 번에 보여질 버튼 수
		int oneBtnCnt = 5;

		PagingVO pvo = new PagingVO(totalPageCnt, onePageCnt, nowPage, oneBtnCnt);
		vo.setOffset(pvo.getOffset());

		vo.setId((String) session.getAttribute("userID"));
		model.addAttribute("paging", pvo);
		model.addAttribute("admin_getQnaList", qnaService.admin_getQnaList(vo));
		return "WEB-INF/view/community/admin_getQnaList.jsp";
	}
}
