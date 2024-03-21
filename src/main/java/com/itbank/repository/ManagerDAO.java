package com.itbank.repository;

import java.util.List;


import com.itbank.model.ConditionDTO;
import com.itbank.model.MemberDTO;

public interface ManagerDAO {

	MemberDTO getUserDetail(String userid);

	List<MemberDTO> selectUserList();

	int grading(ConditionDTO dto);
	
	
}
