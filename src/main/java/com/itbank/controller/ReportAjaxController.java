package com.itbank.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.itbank.model.ReportDTO;
import com.itbank.service.ReportService;

@RestController
@RequestMapping("reportAjax")
public class ReportAjaxController {
	
	@Autowired private ReportService rs;

	@PostMapping("report")
	public int addReport(@RequestBody ReportDTO dto) {
		int row = rs.add(dto);
		System.out.println(row != 0 ? "신고 완료" : "신고 실패");
		return row;
	}
	
}
