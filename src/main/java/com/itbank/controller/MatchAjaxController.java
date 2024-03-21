package com.itbank.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.itbank.model.MemberDTO;
import com.itbank.service.MatchService;

@RestController
@RequestMapping("/matchAjax")
public class MatchAjaxController {
	
	@Autowired private MatchService ms;
	
	@GetMapping("/userInfo/{userid}")
	public MemberDTO userInfo(@PathVariable("userid") String userid) {
		MemberDTO dto = ms.getUserInfo(userid);
		return dto;
	}
	
}
