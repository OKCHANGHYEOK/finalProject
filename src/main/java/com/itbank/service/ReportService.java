package com.itbank.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.model.ReportDTO;
import com.itbank.repository.ReportDAO;

@Service
public class ReportService {

	@Autowired private ReportDAO dao;

	public int add(ReportDTO dto) {
		int row = dao.insert(dto);
		return row;
	}
	
}
