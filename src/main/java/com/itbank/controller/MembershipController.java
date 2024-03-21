package com.itbank.controller;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.itbank.model.MembershipDTO;
import com.itbank.service.MembershipService;

@Controller
@RequestMapping("/membership")
public class MembershipController {
   
   @Autowired private MembershipService ms;
   
   @PostMapping("/insertMPayGold")
   @ResponseBody
   public String insertMPayGold(@RequestBody MembershipDTO mpay, HttpSession session) {
      int row = ms.insertMPay(mpay, session);
      System.out.println(row != 0 ? "결제 성공" : "결제 실패");
      return "redirect:/membership/purcharse";
   }
   
   @PostMapping("/insertMPayStar")
   @ResponseBody
   public String insertMPayStar(@RequestBody MembershipDTO mpay, HttpSession session) {
      int row = ms.insertMPay(mpay, session);
      System.out.println(row != 0 ? "결제 성공" : "결제 실패");
      return "redirect:/membership/purcharse";
   }
   
   @PostMapping("/insertMPayVip")
   @ResponseBody
   public String insertMPayVip(@RequestBody MembershipDTO mpay, HttpSession session) {
      int row = ms.insertMPay(mpay, session);
      System.out.println(row != 0 ? "결제 성공" : "결제 실패");
      return "redirect:/membership/purcharse";
   }
   
   @GetMapping("/purchase")
   public void purchase() {
	   
   }
   @GetMapping("/introduce")
   public void introduce() {
      
   }

   
   
   
   
}
