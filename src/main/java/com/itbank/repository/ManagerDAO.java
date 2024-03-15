package com.itbank.repository;

import com.itbank.model.MemberDTO;

public interface ManagerDAO {

	MemberDTO getUserDetail(String userid);
	
	
}
