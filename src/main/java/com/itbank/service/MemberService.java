package com.itbank.service;

import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.component.HashComponent;
import com.itbank.model.ConditionDTO;
import com.itbank.model.MemberDTO;
import com.itbank.repository.MemberDAO;

@Service
public class MemberService {

   @Autowired private MemberDAO dao;
   @Autowired private HashComponent hash;
   
   public int join(MemberDTO dto) {
	  String hashPass = hash.getHash(dto.getUserpw());
	  dto.setUserpw(hashPass);
      return dao.join(dto);
   }

   public int check(String userid) {
      return dao.check(userid);
   }

   public MemberDTO selectOne(MemberDTO dto) {
      String hashPass = hash.getHash(dto.getUserpw());
      dto.setUserpw(hashPass);
      return dao.selectOne(dto);
   }

   public MemberDTO selectCheck(MemberDTO dto) {
      return dao.selectCheck(dto);
   }
   
   public String resetPass(MemberDTO dto) {
	      String newPassword = UUID.randomUUID().toString().replace("-", "").substring(0, 8);
//	      String hash = hashComponent.getHash(newPassword);
//	      
//	      System.out.println("newPassword : " + newPassword);
//	      System.out.println("hash : " + hash);
//	      
//	      dto.setUserpw(hash);
	      int row = dao.updatePassword(dto);
	      return row != 0 ? newPassword : null;
	   }

public int insertCondition(ConditionDTO dto) {
	return dao.insertCondition(dto);
}

}