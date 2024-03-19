package com.itbank.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.model.MemberDTO;
import com.itbank.repository.ManagerDAO;

@Service
public class ManagerService {
	
	@Autowired private ManagerDAO dao;

	public MemberDTO getUserDetail(String userid) {
		return dao.getUserDetail(userid);
	}

	public List<MemberDTO> selectUserList() {
		return dao.selectUserList();
	}
	
	
}
