package com.itbank.controller;

import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.itbank.model.ChatDTO;
import com.itbank.model.MatchDTO;
import com.itbank.model.MemberDTO;
import com.itbank.model.MessageDTO;
import com.itbank.service.ChatService;
import com.itbank.service.MatchService;

@Controller
@RequestMapping("/match")
public class MatchController {

	@Autowired
	private MatchService ms;
	@Autowired
	private ChatService cs;

	@GetMapping("/match_main")
	public ModelAndView matchMain(@RequestParam String userid) {
		ModelAndView mav = new ModelAndView("/match/match_main");
		MemberDTO dto = ms.getMyInfo(userid);
		mav.addObject("dto", dto);
		return mav;
	}

	@PostMapping("/match_main")
	public ModelAndView matchMain(MemberDTO dto) {
		ModelAndView mav = new ModelAndView("/match/match_list");
		List<MemberDTO> list = ms.getMatchList(dto);
		mav.addObject("list", list);
		return mav;
	}

	@GetMapping("/mymatch")
	public ModelAndView mymatch(HttpSession session) {
		ModelAndView mav = new ModelAndView();

		MemberDTO login = (MemberDTO) session.getAttribute("login");

		List<MatchDTO> list = ms.selectMatches(login.getUserid());
		mav.addObject("list", list);

		return mav;
	}

//	@PostMapping("/chat")
//	public ModelAndView chat(String oponent, String loginUser) {
//		ModelAndView mav = new ModelAndView();
//
//		
//		// 방이름 생성
//		String[] names = new String[2];
//		names[0] = loginUser;
//		names[1] = oponent;	
//		Arrays.sort(names);
//		String roomName = names[0] + names[1];
//		
//
//		// 채팅 목록 가져오기
// 		MatchDTO dto = new MatchDTO();
//		dto.setReqUser(loginUser);
//		dto.setRespUser(oponent);
//		List<ChatDTO> list = cs.selectChats(dto);
//		
//		// 진행중인 매칭인지 확인
//		int matched = ms.getMatched(dto);
//		if(matched == 3) {
//			mav.setViewName("redirect:/match/mymatch");
//			return mav;
//		}
//		
//		mav.addObject("list", list);
//		mav.addObject("oponent", oponent);
//		mav.addObject("roomName", roomName);
//
//		return mav;
//	}
}
