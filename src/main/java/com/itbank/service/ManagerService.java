package com.itbank.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.model.ConditionDTO;
import com.itbank.model.MemberDTO;
import com.itbank.model.ReportDTO;
import com.itbank.model.ReportReplyDTO;
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

	public int grading(ConditionDTO dto) {
		return dao.grading(dto);
	}

	public List<ReportDTO> selectReportList() {
		return dao.selectReportList();
	}

	public ReportDTO getView(int idx) {
		return dao.selectReportOne(idx);
	}

	public int modifyProcessed(ReportReplyDTO dto) {
		int num = dao.insertReply(dto);
		int row = dao.modifyProcessed(dto);
		return row; 
	}
	
	
}
