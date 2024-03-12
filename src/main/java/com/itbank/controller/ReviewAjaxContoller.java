package com.itbank.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RestController;

import com.itbank.service.ReplyService;

@RestController
public class ReviewAjaxContoller {
	
	@Autowired ReplyService rs;
	
	
}
