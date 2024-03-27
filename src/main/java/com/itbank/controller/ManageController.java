package com.itbank.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.itbank.model.MemberDTO;
import com.itbank.model.ReportDTO;
import com.itbank.model.ReportReplyDTO;
import com.itbank.service.ManagerService;

@Controller
@RequestMapping("/manage")
public class ManageController {
	
	@Autowired private ManagerService ms;
	
	@GetMapping("/members")
	public ModelAndView members() {
		ModelAndView mav = new ModelAndView();
		List<MemberDTO> list = ms.selectUserList();
		mav.addObject("list", list);
		return mav;
	}
	@GetMapping("/report")
	public ModelAndView reportList() {
		ModelAndView mav = new ModelAndView();
		List<ReportDTO> reportList = ms.selectReportList();
		mav.addObject("reportList", reportList);
		return mav;
	}
	@GetMapping("/reportView/{idx}")
	public ModelAndView reportProcessed(@PathVariable("idx") int idx) {
		ModelAndView mav = new ModelAndView("/manage/reportView");
		ReportDTO dto = ms.getView(idx);
		mav.addObject("dto", dto);
		return mav;
	}
	@PostMapping("/reportView/{idx}")
	public String reportProcessed(ReportReplyDTO dto) {
		int row = ms.modifyProcessed(dto);
		System.out.println(row != 0 ? "수정 완료" : "수정 실패" );
		return "redirect:/manage/report";
	}
}
