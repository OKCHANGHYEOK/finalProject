package com.itbank.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.itbank.service.MemberService;

@Controller
public class HomeController {

	@Autowired private MemberService ms;
	
	@RequestMapping("/")
	public ModelAndView home() {
		ModelAndView mav = new ModelAndView("home");
		String gender = "남성";
		List<String> menProfiles = ms.getProfiles(gender);
		gender = "여성";
		List<String> womenProfiles = ms.getProfiles(gender);
		int mem_count = ms.getMemberCount();
		mav.addObject("mProfiles", menProfiles);
		mav.addObject("wProfiles", womenProfiles);
		mav.addObject("mem_count", mem_count);
		return mav;
	}
	
	@GetMapping("/alert")
	public String alert() {
		return "alert";
	}
}
