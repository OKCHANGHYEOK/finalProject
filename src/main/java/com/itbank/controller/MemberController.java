package com.itbank.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.itbank.model.ConditionDTO;
import com.itbank.model.MemberDTO;
import com.itbank.service.MemberService;

@Controller
@RequestMapping("/member")
public class MemberController {

	@Autowired
	private MemberService ms;

	@GetMapping("/join")
	public void join() {
	}

	@PostMapping("/join")
	public ModelAndView join(MemberDTO dto) {
		ModelAndView mav = new ModelAndView("alert");
		System.out.println("anjsnajdjksf");
		int row = 0;
		row = ms.join(dto);
		String msg = row != 0 ? "가입 성공" : "가입 실패";
		mav.addObject("msg", msg);
		return mav;
	}

	@GetMapping("/survey")
	public void survey() {
	}

	@PostMapping("/survey")
	public String survey(ConditionDTO dto) {
		int row = ms.insertCondition(dto);
		return row != 0 ? "redirect:/member/login" : "redirect:/alert";
	}

	@GetMapping("/login")
	public void login() {
	}

	@PostMapping("/login")
	public String login(MemberDTO dto, HttpSession session) {
		MemberDTO login = ms.selectOne(dto);
		if (login == null) {
			return "redirect:/alert";
		}

		session.setAttribute("login", login);

		return "redirect:/";
	}

	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}

	@GetMapping("/find")
	public void find() {
	}

	@GetMapping("/resetPass")
	public void resetPass() {
	}

	@PostMapping("/resetPass")
	public ModelAndView resetPass(MemberDTO dto) {
		ModelAndView mav = new ModelAndView("alert");
		String pass = ms.resetPass(dto);
		mav.addObject("msg", "변경된 비밀번호는 [" + pass + "] 입니다.");
		mav.addObject("url", pass != null ? "/member/login" : "");
		return mav;
	}

	@GetMapping("/mypage")
	public void mypage() {
	}

	@GetMapping("/mpmodify")
	public void mpmodify() {
	}

}
