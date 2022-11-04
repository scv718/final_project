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






}
