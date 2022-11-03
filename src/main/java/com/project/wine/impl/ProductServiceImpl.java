package com.project.wine.impl;

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

}