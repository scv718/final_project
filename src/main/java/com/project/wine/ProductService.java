	package com.project.wine;

import java.util.List;

public interface ProductService {

	WineVO getProductdetail(WineVO vo);
	List<WineVO> subscribeproduct(WineVO vo);
	
	List<WineVO> getProductdetailList(List<WineVO> vo);
	
	//구독 조회
	List<WineVO> subscribeW1(WineVO vo);
	List<WineVO> subscribeW2(WineVO vo);
	List<WineVO> subscribeW3(WineVO vo);

	
}
