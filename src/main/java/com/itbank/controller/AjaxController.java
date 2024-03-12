package com.itbank.controller;

import java.util.HashMap;
import java.util.Random;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.itbank.component.MailComponent;
import com.itbank.model.ConditionDTO;
import com.itbank.model.MemberDTO;
import com.itbank.service.MemberService;

@RestController
public class AjaxController {

	public Random ran = new Random();

	@Autowired
	private MemberService ms;

	@Autowired
	private MailComponent mc;

	@GetMapping("duplicateCheck")
	public String duplicateCheck(String userid) {
		int count = ms.check(userid);
		return String.valueOf(count);
	}

	@PostMapping("/ajax/sendMail")
	public int sendMail(@RequestBody HashMap<String, String> param, HttpSession session) {

		int num = ran.nextInt(999999);
		String authNumber = String.format("%06d", num);

		session.setAttribute("authNumber", authNumber);
		session.setMaxInactiveInterval(300);

		param.put("subject", "[듀세요] 회원가입 인증번호");
		param.put("content", authNumber);

		int row = mc.sendMimeMessage(param);
		return row;
	}

	@GetMapping("/ajax/authNumber/{inputNumber}")
	public int authNumber(@PathVariable("inputNumber") String inputNumber, HttpSession session) {
		String authNumber = (String) session.getAttribute("authNumber");
		int row = 0;
		if (inputNumber.equals(authNumber)) {
			row = 1;
		}
		return row;
	}

	@GetMapping(value = "/member/spec", produces = "application/json; charset=utf-8")
	public ConditionDTO selectSpec(@RequestParam String userid) {
		System.out.println(userid);
		ConditionDTO dto = ms.selectCondition(userid);
		return dto;

	}

	@PostMapping("/ajax/mpmodify")
	public String mypageModify(@RequestBody MemberDTO dto) {
		System.out.println(dto);
		System.out.println(dto.getUsername());
		System.out.println(dto.getGender());
		System.out.println(dto.getBirthYear());
		System.out.println(dto.getBirthMonth());
		System.out.println(dto.getBirthDay());
		System.out.println(dto.getUserid());
		int row = ms.mpModify(dto);
		System.out.println(row != 0 ? "수정 성공" : "수정 실패");
		return "redirect:/member/mypage/{idx}";
	}



}
