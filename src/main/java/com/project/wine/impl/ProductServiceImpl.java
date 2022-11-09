package com.project.wine.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.wine.ProductService;
import com.project.wine.WineVO;

@Service
public class ProductServiceImpl implements ProductService{

	@Autowired
	ProductDAOmybatis productDAO;
	
	@Override
	public WineVO getProductdetail(WineVO vo) {
		
		return productDAO.productDetail(vo);
	}

	@Override
	public List<WineVO> getProductdetailList(List<WineVO> vo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<WineVO> subscribeW1(WineVO vo) {
		return productDAO.subscribeW1(vo);
	}

	@Override
	public List<WineVO> subscribeW2(WineVO vo) {
		return productDAO.subscribeW2(vo);
	}

	@Override
	public List<WineVO> subscribeW3(WineVO vo) {
		return productDAO.subscribeW3(vo);
	}

	@Override
	public List<WineVO> subscribeproduct(WineVO vo) {
		return productDAO.subscribeproduct(vo);
	}
	

}
