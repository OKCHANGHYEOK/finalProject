package com.itbank.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.itbank.model.MemberDTO;
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
}
