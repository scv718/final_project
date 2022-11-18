package com.project.wine.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.order.OrderVO;
import com.project.order.OrderVO;
import com.project.wine.WineVO;

@Repository
public class WineDAOMybatis {

	@Autowired
	private SqlSessionTemplate mybatis;

	// CRUD 기능의 메소드 구현
	//와인 등록
	public void insertWine(WineVO vo) {
		mybatis.insert("WineDAO.insertWine", vo);
	}
	//와인 수정
	public void updateWine(WineVO vo) {
		mybatis.update("WineDAO.updateWine", vo);
	}
	public void updateorder(OrderVO vo) {
		mybatis.update("WineDAO.updateorder", vo);
	}

	// 와인 삭제
	public void deleteWine(WineVO vo) {
		mybatis.delete("WineDAO.deleteWine", vo);
	}

	// 와인 조회
	public WineVO getWine(WineVO vo) {
		return (WineVO) mybatis.selectOne("WineDAO.getWine", vo);
	}

	// 와인 리스트
	public List<WineVO> getWineList(WineVO vo) {
		return mybatis.selectList("WineDAO.getWineList", vo);
	}

	public List<WineVO> getWineSearchList(WineVO vo) {
		return mybatis.selectList("WineDAO.getWineSearchList", vo);
	}

	public List<WineVO> detaileSearch(WineVO vo) {
		return mybatis.selectList("WineDAO.detaileSearch", vo);
	}

	public List<WineVO> getType(WineVO vo) {
		return mybatis.selectList("WineDAO.getType", vo);
	}

	public List<WineVO> getContinental(WineVO vo) {
		return mybatis.selectList("WineDAO.getContinental", vo);
	}

	public List<WineVO> getCountry(WineVO vo) {
		return mybatis.selectList("WineDAO.getCountry", vo);
	}
	//관리자 와인관리리스트
		public List<WineVO> WineListAd(WineVO vo) {
			
			List<WineVO> a = mybatis.selectList("WineDAO.WineListAd");
	
			return mybatis.selectList("WineDAO.WineListAd");

		}
		
}