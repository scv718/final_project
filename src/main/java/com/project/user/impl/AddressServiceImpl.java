package com.project.user.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.user.AddressService;
import com.project.user.AddressVO;


@Service("addressService")
public class AddressServiceImpl implements AddressService{
	@Autowired
	private AddressDAOMybatis addressDAO;

	@Override
	public AddressVO selectDefaultAddress(AddressVO vo) {
		return addressDAO.selectDefaultAddress(vo);
	}

	@Override
	public void firstaddAddress(AddressVO vo) {
		addressDAO.firstaddAddress(vo);
		
	}

	@Override
	public void addAddress(AddressVO vo) {
		addressDAO.addAddress(vo);
	}

	@Override
	public void firstUpdate(AddressVO vo) {
		addressDAO.firstUpdate(vo);
	}

	@Override
	public AddressVO selectAddress(AddressVO vo) {
		// TODO Auto-generated method stub
		return addressDAO.selectAddress(vo);
	}

	@Override
	public void selectUpdate(AddressVO vo) {
		// TODO Auto-generated method stub
		 addressDAO.selectAddress(vo);
	}






}
