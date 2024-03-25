package com.itbank.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.itbank.model.ChatDTO;
import com.itbank.model.MatchDTO;
import com.itbank.service.ChatService;

@RestController
public class ChatAjaxController {

	@Autowired private ChatService cs;
	
	@PostMapping("/chat/load")
	public List<ChatDTO> getChatList(@RequestBody MatchDTO dto) {
		List<ChatDTO> list = cs.selectChats(dto);
		if(list == null) {
			list = new ArrayList<ChatDTO>();
		}
		return list;
	}
}
