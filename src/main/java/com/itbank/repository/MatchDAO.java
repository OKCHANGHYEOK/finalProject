package com.itbank.repository;

import java.util.List;

import com.itbank.model.MatchDTO;
import com.itbank.model.MemberDTO;

public interface MatchDAO {

	List<MatchDTO> selectMatches(String userid);

	MemberDTO getMyDetail(String userid);

	List<MemberDTO> selectMatchList(MemberDTO dto);

	MemberDTO selectGetUserInfo(String userid);
}
