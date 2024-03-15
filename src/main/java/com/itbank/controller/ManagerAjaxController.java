package com.itbank.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.itbank.model.MemberDTO;
import com.itbank.service.ManagerService;

@RestController
public class ManagerAjaxController {

	@Autowired private ManagerService ms;
	
	@GetMapping("/manage/userDetail/{userid}")
	public MemberDTO getUserDetail(@PathVariable("userid") String userid) {
		MemberDTO dto = ms.getUserDetail(userid);
		
		return dto;
	}
}
