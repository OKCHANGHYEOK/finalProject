package com.itbank.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.itbank.component.Paging;
import com.itbank.model.MarriageDTO;
import com.itbank.model.MemberDTO;
import com.itbank.model.ReviewDTO;
import com.itbank.model.ReviewLikeDTO;
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
		return "redirect:/review/list/1";
	}
	
	@GetMapping("/view/{idx}")
	public ModelAndView getReviewOne(@PathVariable("idx") int idx, HttpSession session) {
		ModelAndView mav = new ModelAndView("/review/view");
		MemberDTO login = (MemberDTO) session.getAttribute("login");
		String check = "빈하트";
		if(login != null) {
			ReviewLikeDTO rld = new ReviewLikeDTO();
			rld.setBoard_idx(idx);
			rld.setUserid(login.getUserid());
			ReviewLikeDTO like = rs.selectLike(rld);
			if(like != null) check = "꽉찬하트";
		}
		ReviewDTO dto = rs.selectOne(idx);
		List<ReviewDTO> list = rs.recommendList(idx);
		MarriageDTO mate = rs.selectMate(dto.getWriter());
		mav.addObject("dto", dto);
		mav.addObject("list", list);
		mav.addObject("check", check);
		mav.addObject("mate", mate);
		return mav;
	}
	@GetMapping("/modify/{idx}")
	public ModelAndView reviewModify(@PathVariable("idx") int idx) {
		ModelAndView mav = new ModelAndView("/review/modify");
		ReviewDTO dto = rs.selectOne(idx);
		mav.addObject("dto", dto);
		return mav;
	}
	@PostMapping("/modify/{idx}")
	public String reviewModify(ReviewDTO dto) {
		System.out.println(dto.getTitle());
		System.out.println(dto.getContent());
		System.out.println(dto.getImg());
		System.out.println(dto.getWriter());
		int row = rs.update(dto);
		System.out.println(row != 0 ? "리뷰 수정 성공" : "리뷰 수정 실패");
		return "redirect:/review/list/1";
	}
	@GetMapping("/delete/{idx}")
	public String reviewDelete(@PathVariable("idx") int idx) {
		int row = rs.delete(idx);
		System.out.println(row != 0 ? "리뷰 작성 성공" : "리뷰 작성 실패");
		return "redirect:/review/list/1";
	}
	
	

}
