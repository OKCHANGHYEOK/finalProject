package com.itbank.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.itbank.model.ReviewDTO;
import com.itbank.service.ReviewService;

@Controller
@RequestMapping("/review")
public class ReviewController {
	
	@Autowired private ReviewService rs;
	
	@GetMapping("/list")
	public ModelAndView getReviewList() {
		ModelAndView mav = new ModelAndView();
		List<ReviewDTO> list = rs.selectList();
		mav.addObject("list", list);
		return mav;
	}
	@GetMapping("/write")
	public void reviewWrite() {}
	
	@PostMapping("/write")
	public String reviewWrite(ReviewDTO dto) {
		int row = rs.write(dto);
		System.out.println(row != 0 ? "후기 작성 성공" : "후기 작성 실패");
		return "redirect:/review/list";
	}
	
	@GetMapping("/view/{idx}")
	public ModelAndView getReviewOne(@PathVariable("idx") int idx) {
		ModelAndView mav = new ModelAndView("/review/view");
		ReviewDTO dto = rs.selectOne(idx);
		List<ReviewDTO> list = rs.recommendList(idx);
		mav.addObject("dto", dto);
		mav.addObject("list", list);
		return mav;
	}

	

}
