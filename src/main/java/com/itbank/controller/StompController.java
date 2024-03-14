package com.itbank.controller;

import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;

import com.itbank.model.MessageDTO;

@Controller
public class StompController {
	
	@MessageMapping("/register")
	@SendTo("/broker/admin")
	public MessageDTO register(String userid) {
		MessageDTO dto = new MessageDTO();
		dto.setText(userid + "님의 스펙이 등록되었습니다");
		return dto;
	}
	
	@MessageMapping("/ping")
	public void ping() {}
}
