package com.itbank.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.itbank.component.Paging;
import com.itbank.model.ReviewDTO;
import com.itbank.service.ReviewService;

@Controller
@RequestMapping("/review")
public class ReviewController {
	
	@Autowired private ReviewService rs;
	
	@GetMapping("/list/{page}")
	public ModelAndView getReviewList(@PathVariable("page") int page, String search) {
		ModelAndView mav = new ModelAndView("/review/list");
		
		if(search == null) {search = "";}
		int boardCount = rs.getBoardCount(search);
		Paging paging = new Paging(page, boardCount);
		Map<String, Object> map = new HashMap<>();
		map.put("search", search);
		map.put("paging", paging);
		List<ReviewDTO> list = rs.selectList(map);
		System.out.println(list.toString());
		mav.addObject("list", list);
		mav.addObject("paging", paging);
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
