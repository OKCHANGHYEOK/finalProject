package com.itbank.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.itbank.model.ReviewLikeDTO;
import com.itbank.model.ReviewReplyDTO;
import com.itbank.service.ReplyService;
import com.itbank.service.ReviewService;

@RestController
@RequestMapping("/reviewAjax")
public class ReviewAjaxContoller {
	
	@Autowired ReplyService rs;
	@Autowired ReviewService review;
	
	@GetMapping("/view/{board_idx}")
	public List<ReviewReplyDTO> getReplyList(@PathVariable("board_idx") int board_idx) {
		List<ReviewReplyDTO> list = rs.selectList(board_idx); 
		return list;
	}
   @PostMapping("/write")
   public int replyWrite(@RequestBody ReviewReplyDTO dto) {
      int row = rs.insertWrite(dto);
      System.out.println(row != 0 ? "댓글 작성 성공" : "댓글 작성 실패");
      return row;
   }
	@PostMapping("/like")
	public String LikeOrUnlike(@RequestBody ReviewLikeDTO like) {
		String check = "";
		int row = 0;
		ReviewLikeDTO dto = review.selectLike(like);
		if(dto == null) {
			row = review.addLike(like);
			check = "좋아요";
		} else {
			row = review.deleteLike(like);
			check = "좋아요 취소";
		}
		return check;
	}
	@PostMapping("/count")
	public int likeCount(@RequestBody ReviewLikeDTO like) {
		int count = review.getLikeCount(like);
		return count;
	}
	
}
