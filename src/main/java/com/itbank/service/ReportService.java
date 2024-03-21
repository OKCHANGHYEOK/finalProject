package com.itbank.service;

import java.io.File;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.model.ReportDTO;
import com.itbank.model.ReportReplyDTO;
import com.itbank.repository.ReportDAO;

@Service
public class ReportService {

	@Autowired private ReportDAO dao;
	private String saveDirectory = "C:\\upload";

	public int add(ReportDTO dto) {
		String img = dto.getUpload().getOriginalFilename();
		File f = new File(saveDirectory, img);
		try {
			dto.getUpload().transferTo(f);
		} catch (Exception e) {
			e.printStackTrace();
		}
		dto.setImg(img);
		return dao.insert(dto);
	}

	public List<ReportDTO> getReportList(String userid) {
		List<ReportDTO> list = dao.selectList(userid);
		return list;
	}

	public int deleteReport(int idx) {
		int row = dao.delete(idx);
		return row;
	}

	public ReportDTO getView(int idx) {
		ReportDTO dto = dao.selectOne(idx);
		return dto;
	}

	public int updateModify(ReportDTO dto) {
		String img = dto.getUpload().getOriginalFilename();
		File f = new File(saveDirectory, img);
		try {
			dto.getUpload().transferTo(f);
		} catch (Exception e) {
			e.printStackTrace();
		}
		dto.setImg(img);
		return dao.update(dto);
	}

	public ReportReplyDTO getReportReply(int idx) {
		return dao.selectReply(idx);
	}
	
}
