package com.itbank.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.model.MemberDTO;
import com.itbank.repository.MemberDAO;

@Service
public class MemberService {

	@Autowired private MemberDAO dao;
	
	public int join(MemberDTO dto) {
		return dao.join(dto);
	}

	public int check(String userid) {
		return dao.check(userid);
	}

	public MemberDTO selectOne(MemberDTO dto) {
		return dao.selectOne(dto);
	}

	public MemberDTO selectCheck(MemberDTO dto) {
		return dao.selectCheck(dto);
	}

}
