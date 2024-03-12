package com.itbank.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;

import com.itbank.model.MemberDTO;
import com.itbank.service.MemberService;


public class LoginInterceptor implements HandlerInterceptor {
	
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		String url = request.getRequestURI();
		String cpath = request.getContextPath();
		MemberDTO login = (MemberDTO) session.getAttribute("login");
		if(login == null) {
			response.sendRedirect(cpath + "/member/login");
		}
		
		return true;
	}
}
