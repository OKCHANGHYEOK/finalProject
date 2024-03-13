package com.itbank.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.model.ReviewReplyDTO;
import com.itbank.repository.ReplyDAO;

@Service
public class ReplyService {
	
	@Autowired ReplyDAO dao;

	public int insertWrite(ReviewReplyDTO dto) {
		return dao.insertWrite(dto);
	}

	public List<ReviewReplyDTO> selectList(int board_idx) {
		return dao.selectList(board_idx);
	}

}
