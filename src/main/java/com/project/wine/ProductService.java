package com.project.wine;

import java.util.List;

public interface ProductService {

	WineVO getProductdetail(WineVO vo);
	
	List<WineVO> getProductdetailList(List<WineVO> vo);
	
}
