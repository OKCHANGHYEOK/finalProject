package com.itbank.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.itbank.model.MatchDTO;
import com.itbank.model.MemberDTO;
import com.itbank.service.MatchService;

@RestController
@RequestMapping("/matchAjax")
public class MatchAjaxController {

	@Autowired
	private MatchService ms;

	@GetMapping("/userInfo/{userid}")
	public MemberDTO userInfo(@PathVariable("userid") String userid) {
		MemberDTO dto = ms.getUserInfo(userid);
		return dto;
	}

	@PostMapping("/disconnect")
	public int disconnect(@RequestBody MatchDTO dto) {
		int row = ms.disconnect(dto);
		return row;
	}

	@GetMapping("/matchList/{userid}")
	public List<MatchDTO> matchList(@PathVariable("userid") String userid) {
		List<MatchDTO> list = ms.selectMatches(userid);
		if (list == null) {
			return new ArrayList<MatchDTO>();
		}
		list.removeIf(dto -> dto.getMatched() != 1);
		return list;
	}

	@PostMapping("/tryMatch")
	public HashMap<String, Object> tryMatch(@RequestBody MatchDTO dto) {
		HashMap<String, Object> map = new HashMap<String, Object>();
//		System.out.println("requestId 는 " + dto.getReqUser() + "responseId 는 " + dto.getRespUser());
		int row = ms.insertMatch(dto);
		map.put("message", row == 0 ? "매칭 실패 오류." : "상대방에게 알림을 보냈어요 ! 마이 매칭을 확인하세요 :)");
		return map;
	}
	
	@GetMapping("/refuse")
	public int refuse(@RequestParam String reqUser, @RequestParam String respUser) {
		int row = ms.refuseUpdate(reqUser, respUser);
		return row;
	}
}
