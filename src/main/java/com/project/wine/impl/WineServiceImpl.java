package com.project.wine.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.wine.WineService;
import com.project.wine.WineVO;

@Service("wineService")
public abstract class WineServiceImpl implements WineService {
	
	@Autowired
	private WineDAOMybatis wineDAO;

	@Override
	public void insertWine(WineVO vo) {
		wineDAO.insertWine(vo);
		
	}

	@Override
	public void updateWine(WineVO vo) {
		wineDAO.updateWine(vo);
		
	}

	@Override
	public void deleteWine(WineVO vo) {
		wineDAO.deleteWine(vo);
		
	}
	
	@Override
	public WineVO getWine(WineVO vo) {
		return wineDAO.getWine(vo);
	}
	
	@Override
	public List<WineVO> getWineList(WineVO vo) {
		return wineDAO.getWineList(vo);		
		
	}

}
