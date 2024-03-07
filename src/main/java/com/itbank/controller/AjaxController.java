package com.itbank.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.itbank.component.RandomNumberGenerator;
import com.itbank.model.MemberDTO;
import com.itbank.service.MemberService;

@RestController
public class AjaxController {

	@Autowired
	private MemberService ms;

	@Autowired private JavaMailSender javaMailSender;
	
	@Autowired private RandomNumberGenerator rg;
	
	@GetMapping("duplicateCheck")
	public String duplicateCheck(String userid) {
		int count = ms.check(userid);
		return String.valueOf(count);
	}

	@PostMapping("sendEmail")
	public String sendEmail(@RequestBody MemberDTO dto) {
		MemberDTO check = ms.selectCheck(dto);

		if (check == null) {
			return "fail";
		} else {
			try {
				// 간단한 이메일 메시지 생성
				SimpleMailMessage message = new SimpleMailMessage();
				String verifyCode = rg.generateRandomNumberString();
				
				message.setFrom("dkdldy2@naver.com"); // 송신자 이메일
				message.setTo(dto.getEmail()); // 수신자 이메일
				message.setSubject("듀세요 - 비밀번호 재발급 안내"); // 이메일 제목
				String msg = "비밀번호 재발급 안내\n";
				msg += "=================\n";
				msg += "인증번호 : " + verifyCode;
				message.setText(msg); // 이메일 내용

				// 이메일 보내기
				javaMailSender.send(message);

				return verifyCode;
			} catch (Exception e) {
				return "이메일 전송에 실패했습니다: " + e.getMessage();
			}

		}

	}
}
