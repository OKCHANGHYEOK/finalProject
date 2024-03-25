package com.itbank.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.model.MatchDTO;
import com.itbank.model.MemberDTO;
import com.itbank.model.MessageDTO;
import com.itbank.repository.MatchDAO;

@Service
public class MatchService {

	@Autowired
	private MatchDAO dao;

	public MemberDTO getMyInfo(String userid) {
		return dao.getMyDetail(userid);
	}

	public List<MemberDTO> getMatchList(MemberDTO dto) {
		return dao.selectMatchList(dto);
	}

	public MemberDTO getUserInfo(String userid) {
		return dao.selectGetUserInfo(userid);
	}

	public List<MatchDTO> selectMatches(String userid) {
		return dao.selectMatches(userid);
	}

	public int disconnect(MatchDTO dto) {
		return dao.disconnect(dto);
	}

	public int getMatched(MatchDTO dto) {
		return dao.getMatched(dto);
	}

	public int insertMatch(MatchDTO dto) {
		return dao.insertMatch(dto);
	}
}
