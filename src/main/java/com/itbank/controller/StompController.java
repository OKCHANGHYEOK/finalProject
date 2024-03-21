package com.itbank.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;

import com.itbank.model.MemberDTO;
import com.itbank.model.MessageDTO;
import com.itbank.service.ChatService;
import com.itbank.service.ManagerService;

@Controller
public class StompController {
	
	@Autowired private ManagerService ms;
	@Autowired private ChatService cs;
	
	@MessageMapping("/register")
	@SendTo("/broker/admin")
	public MessageDTO register(String userid) {
		MessageDTO dto = new MessageDTO();
		dto.setText(userid + "님의 스펙이 등록되었습니다");
		return dto;
	}
	
	@MessageMapping("/ping")
	public void ping() {}
	
//	@MessageMapping("/enter")
//	@SendTo("/broker/chat")
//	public String enter() {
//		return "입장이요~";
//	}
	
	@MessageMapping("/message/")
	@SendTo("/broker/chat")
	public MessageDTO sendMessage(MessageDTO message) {
		MemberDTO dto = ms.getUserDetail(message.getUserid());
		int record = cs.record(message);
		message.setProfile(dto.getProfile());
		return message;
	}
}
