package com.itbank.controller;

import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;

@Controller
public class StompController {
	
	@MessageMapping("/register")
	@SendTo("/broker/admin")
	public String register(String userid) {
		return userid + "님의 스펙이 등록되었습니다";
	}
	
	@MessageMapping("/ping")
	public void ping() {}
}
