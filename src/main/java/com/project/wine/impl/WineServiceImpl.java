package com.project.wine.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.order.OrderVO;
import com.project.wine.WineService;
import com.project.wine.WineVO;


@Service
public class WineServiceImpl implements WineService {
	
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

	@Override
	public List<WineVO> getWineSearchList(WineVO vo) {
		return wineDAO.getWineSearchList(vo);	
	}

	@Override
	public List<WineVO> detaileSearch(WineVO vo) {
		return wineDAO.detaileSearch(vo);	
	}

	@Override
	public List<WineVO> getType(WineVO vo) {
		return wineDAO.getType(vo);
	}

	@Override
	public List<WineVO> getContinental(WineVO vo) {
		return wineDAO.getContinental(vo);
	}

	@Override
	public List<WineVO> WineListAd(WineVO wvo) {
		return wineDAO.WineListAd(wvo);
	}
	
	@Override
	public List<WineVO> getCountry(WineVO vo) {
		return wineDAO.getCountry(vo);
	}

	@Override
	public void updateorder(OrderVO vo) {
		wineDAO.updateorder(vo);
	}

	
	
}
