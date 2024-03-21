package com.itbank.service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.model.MembershipDTO;
import com.itbank.repository.MembershipDAO;

@Service
public class MembershipService {

   @Autowired MembershipDAO msDao;
   
   // 결제정보 데이터베이스로 넘기기
   public int insertMPay(MembershipDTO mpay, HttpSession session) {
       return msDao.insertMpay(mpay);
   }
   
   // 결제완표 페이지 컨트롤
   public MembershipDTO paymentContent(HttpSession session) {
	   return msDao.selectPayment();
   }

}
