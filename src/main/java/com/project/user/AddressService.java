package com.project.user;

import java.util.List;

public interface AddressService {

	void firstaddAddress(AddressVO vo);
	void firstUpdate(AddressVO vo);
	void addAddress(AddressVO vo);
	AddressVO selectDefaultAddress(AddressVO vo);
	List<AddressVO> selectAddress(AddressVO vo);
	
}
