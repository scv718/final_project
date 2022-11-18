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
		System.out.println("겟 와인 서비스 임플까진 실행");
		return wineDAO.getWineList(vo);	
		
	}

	@Override
	public List<WineVO> getWineSearchList(WineVO vo) {
		System.out.println("겟 와인 서치 서비스 임플까진 실행");
		return wineDAO.getWineSearchList(vo);	
	}

	@Override
	public List<WineVO> detaileSearch(WineVO vo) {
		System.out.println("디테일 서치 서비스 임플까진 실행");
		return wineDAO.detaileSearch(vo);	
	}

	@Override
	public List<WineVO> getType(WineVO vo) {
		System.out.println("겟 타입 서비스 임플까진 실행");
		return wineDAO.getType(vo);
	}

	@Override
	public List<WineVO> getContinental(WineVO vo) {
		System.out.println("겟 컨티넨탈 서비스 임플까진 실행");
		return wineDAO.getContinental(vo);
	}

	@Override
	public List<WineVO> WineListAd(WineVO wvo) {
		System.out.println("와인 관리서비스 임플까진 실행");
		return wineDAO.WineListAd(wvo);
	}
	
	@Override
	public List<WineVO> getCountry(WineVO vo) {
		System.out.println("겟 컨츄리 서비스 임플까진 실행");
		return wineDAO.getCountry(vo);
	}

	@Override
	public void updateorder(OrderVO vo) {
		wineDAO.updateorder(vo);
	}

	
	
}
