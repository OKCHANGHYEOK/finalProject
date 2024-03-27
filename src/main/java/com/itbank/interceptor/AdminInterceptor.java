package com.itbank.interceptor;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

import com.itbank.model.MemberDTO;


public class AdminInterceptor implements HandlerInterceptor {
    
	@Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		HttpSession session = request.getSession();
        MemberDTO login = (MemberDTO) session.getAttribute("login");
        
        if (login == null || login.getIsManager() == 0) {
        	 String path = "/WEB-INF/views/manageAlert.jsp";
             RequestDispatcher rd = request.getRequestDispatcher(path);
             request.setAttribute("msg", "관리자만 접속 가능합니다");
             request.setAttribute("url", "/");
             rd.forward(request, response);
        	return false;
        } else {
            return true;
        }
    }
}
