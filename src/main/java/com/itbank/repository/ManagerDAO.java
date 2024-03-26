package com.itbank.repository;

import java.util.List;


import com.itbank.model.ConditionDTO;
import com.itbank.model.MemberDTO;
import com.itbank.model.ReportDTO;

public interface ManagerDAO {

	MemberDTO getUserDetail(String userid);

	List<MemberDTO> selectUserList();

	int grading(ConditionDTO dto);

	List<ReportDTO> selectReportList();

	ReportDTO selectReportOne(int idx);

	int modifyProcessed(ReportDTO dto);
	
}
