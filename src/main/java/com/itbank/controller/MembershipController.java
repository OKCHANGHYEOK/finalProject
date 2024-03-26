package com.itbank.controller;


import java.io.IOException;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URISyntaxException;
import java.net.URL;

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

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ObjectNode;
import com.itbank.component.MembershipComponent;
import com.itbank.model.MembershipDTO;
import com.itbank.service.MembershipService;

@Controller
@RequestMapping("/membership")
public class MembershipController {
   
   @Autowired private MembershipService ms;
   @Autowired private MembershipComponent mc;
   
   @GetMapping("/getAccessToken")
   public void getAccessToken() throws URISyntaxException, IOException, InterruptedException {
      String token = mc.getImportToken();
      System.out.println(token);
   }
   
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
   
   @GetMapping("/myMembership/{userid}")
   public ModelAndView myMembership(@PathVariable("userid") String userid) {
	   ModelAndView mav = new ModelAndView("/membership/myMembership");
	   MembershipDTO dto = ms.getmyMembership(userid);
	   mav.addObject("dto", dto);
	   
	   return mav;
   }
   

   @PostMapping("/refund")
   @ResponseBody
   public String refund(@RequestBody String requestBody) {
	   try {
           // JSON 요청 본문 파싱
           ObjectMapper objectMapper = new ObjectMapper();
           JsonNode jsonNode = objectMapper.readTree(requestBody);

           // merchant_uid 추출
           String merchantUid = jsonNode.get("merchant_uid").asText();

           // JSON 객체 생성
           ObjectNode requestBodyNode = objectMapper.createObjectNode();
           // merchant_uid 추가
           requestBodyNode.put("merchant_uid", merchantUid);

           // IAMPORT API에 요청 보내기
           URL url = new URL("https://api.iamport.kr/payments/cancel");
           HttpURLConnection conn = (HttpURLConnection) url.openConnection();
           conn.setRequestMethod("POST");
           conn.setRequestProperty("Content-Type", "application/json");
           conn.setRequestProperty("Accept", "application/json");
           conn.setRequestProperty("Authorization", MembershipComponent.getImportToken());
           conn.setDoOutput(true);

           // API 요청 본문 설정
           String requestBodyToIamport = objectMapper.writeValueAsString(requestBodyNode);
           OutputStream os = conn.getOutputStream();
           os.write(requestBodyToIamport.getBytes());
           os.flush();

           // HTTP 응답 코드 확인
           int responseCode = conn.getResponseCode();
           if (responseCode == HttpURLConnection.HTTP_OK) {
               // 정상적으로 처리된 경우
               return "환불이 성공적으로 처리되었습니다."; // 환불 성공 메시지 반환
           } else {
               // 오류가 발생한 경우
               return "환불 처리 중 오류가 발생하였습니다. 응답 코드: " + responseCode; // 환불 실패 메시지 반환
           }
       } catch (Exception e) {
           e.printStackTrace();
           return "환불 처리 중 오류가 발생하였습니다."; // 환불 실패 메시지 반환
       }
   }
   
   @GetMapping("/delete/{payNum}")
   public ModelAndView delete(@PathVariable("payNum") String payNum) {
	   ModelAndView mav = new ModelAndView("/membership/delete");
	   int row = ms.deletePaymentInfo(payNum);
	   String message = row != 0 ? "환불 성공" : "환불 실패";
	   mav.addObject("message", message);
	   return mav;
   }
   
   
   
   
   



}