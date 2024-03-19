package com.itbank.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.itbank.model.ReportDTO;
import com.itbank.service.ReportService;

@RestController
@RequestMapping("reportAjax")
public class ReportAjaxController {
	
	@Autowired private ReportService rs;

	@PostMapping("report")
	public int addReport(ReportDTO dto) {
		int row = rs.add(dto);
		System.out.println(row != 0 ? "신고 완료" : "신고 실패");
		return row;
	}
	
	@GetMapping("list")
	public List<ReportDTO> reportList(@RequestParam String userid) {
		System.out.println(userid + " ajaxController");
		List<ReportDTO> list = rs.getReportList(userid);
		System.out.println(list);
		return list;
	}
	
	@GetMapping("deleteReport")
	public int deleteReport(@RequestParam int idx) {
		int row = rs.deleteReport(idx);;
		return row;
	}
	
	@GetMapping("view")
	public ReportDTO viewModify(@RequestParam int idx) {
		ReportDTO dto = rs.getView(idx);
		System.out.println("viewdto = " + dto);
		return dto;
	}
	
	@PostMapping("reportModify")
	public int reportModify(ReportDTO dto) {
		int row = rs.updateModify(dto);
		System.out.println("row = " + row);
		return row;
	}
	
	
}
