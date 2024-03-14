package com.itbank.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.itbank.model.ConditionDTO;
import com.itbank.model.MemberDTO;
import com.itbank.service.MemberService;

@Controller
@RequestMapping("/member")
public class MemberController {

	@Autowired
	private MemberService ms;

	@Autowired
	private StompController sc;

	@GetMapping("/join")
	public void join() {
	}

	@PostMapping("/join")
	public String join(MemberDTO dto, RedirectAttributes rttr) {
		int row = ms.join(dto);
		rttr.addFlashAttribute("userid", dto.getUserid());
		return "redirect:/member/survey";
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
	public String login(MemberDTO dto, HttpSession session, String save, HttpServletResponse response) {
		MemberDTO login = ms.selectOne(dto);
		int row = ms.updateLastLogin(login.getUserid());

		if (login == null) {
			return "redirect:/alert";
		}
		if (save != null) {
			Cookie cookie = new Cookie("save", dto.getUserid());
			cookie.setMaxAge(604800);
			cookie.setPath("/");
			response.addCookie(cookie);
		}
		session.setAttribute("login", login);

		return "redirect:/";
	}

	@GetMapping("/logout")
	public String logout(HttpSession session, HttpServletRequest request, HttpServletResponse response, String mypage) {
		session.invalidate();
		Cookie[] cookies = request.getCookies();
		if (cookies != null) {
			for (Cookie c : cookies) {
				if (c.getName().equals("save")) {
					c.setMaxAge(0);
					c.setPath("/");
					response.addCookie(c);
					break;
				}
			}
		}
		return mypage != null ? "redirect:/member/login" : "redirect:/";
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

	@GetMapping("/withdrawMember/{idx}")
	public ModelAndView withdrawMember(@PathVariable("idx") int idx) {
		ModelAndView mav = new ModelAndView("/member/withdrawMember");
		MemberDTO dto = ms.memberOne(idx);
		mav.addObject("dto", dto);
		return mav;
	}

	@PostMapping("/withdrawMember/{idx}")
	public String withdrawMemberPost(MemberDTO dto) {
		int row = ms.memberDelete(dto);
		System.out.println(row != 0 ? "삭제 성공" : "삭제 실패");
		return "redirect:/member/logout";
	}
}
