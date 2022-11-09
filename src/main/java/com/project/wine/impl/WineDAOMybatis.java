package com.project.wine.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.wine.WineVO;

@Repository
public class WineDAOMybatis {

	@Autowired
	private SqlSessionTemplate mybatis;

	// CRUD 기능의 메소드 구현
	//와인 등록
	public void insertWine(WineVO vo) {
		System.out.println("===>mybatis로 insertWine() 기능처리");
		mybatis.insert("WineDAO.insertWine", vo);
	}

	//와인 수정
	public void updateWine(WineVO vo) {
		System.out.println("===>mybatis로 updateWine() 기능처리");
		mybatis.update("WineDAO.updateWine", vo);
	}

	// 와인 삭제
	public void deleteWine(WineVO vo) {
		System.out.println("===>mybatis로 deleteWine() 기능처리");
		mybatis.delete("WineDAO.deleteWine", vo);
	}

	// 와인 조회
	public WineVO getWine(WineVO vo) {
		System.out.println("===>mybatis로 getWine() 기능처리");
		return (WineVO) mybatis.selectOne("WineDAO.getWine", vo);
	}

	// 와인 리스트
	public List<WineVO> getWineList(WineVO vo) {
		System.out.println("===>mybatis로 getWineList() 기능처리 ");
		return mybatis.selectList("WineDAO.getWineList", vo);
	}

	public List<WineVO> getWineSearchList(WineVO vo) {
		System.out.println("===>mybatis로 와인 검색 기능처리 ");
		return mybatis.selectList("WineDAO.getWineSearchList", vo);
	}

	public List<WineVO> detaileSearch(WineVO vo) {
		System.out.println("===>mybatis로 와인 검색 기능처리 ");
		return mybatis.selectList("WineDAO.detaileSearch", vo);
	}

	public List<WineVO> getType(WineVO vo) {
		System.out.println("===>mybatis로 타입 검색 기능처리 ");
		return mybatis.selectList("WineDAO.getType", vo);
	}

	public List<WineVO> getContinental(WineVO vo) {
		System.out.println("===>mybatis로 대륙 검색 기능처리 ");
		return mybatis.selectList("WineDAO.getContinental", vo);
	}

	public List<WineVO> getCountry(WineVO vo) {
		System.out.println("===>mybatis로 나라 검색 기능처리 ");
		return mybatis.selectList("WineDAO.getCountry", vo);
	}
	//관리자 와인관리리스트
		public List<WineVO> WineListAd(WineVO vo) {
			
			System.out.println("유저 마이 바티스 실행");
			List<WineVO> a = mybatis.selectList("WineDAO.WineListAd");
			for(WineVO v : a ) {
				System.out.println("v: "+v);
			}
			return mybatis.selectList("WineDAO.WineListAd");

		}
		
}