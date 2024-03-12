package com.itbank.service;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.component.HashComponent;
import com.itbank.model.ConditionDTO;
import com.itbank.model.MemberDTO;
import com.itbank.repository.MemberDAO;

@Service
public class MemberService {

	@Autowired
	private MemberDAO dao;
	@Autowired
	private HashComponent hash;

	private String saveDirectory = "C:\\upload";

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
		String fileName = dto.getUpload().getOriginalFilename();
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddhhmmss_");
		String today = sdf.format(date);

		fileName = today + fileName;

		File f = new File(saveDirectory, fileName);

		try {
			dto.getUpload().transferTo(f);
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		dto.setProfile(fileName);
		return dao.insertCondition(dto);
	}

	public ConditionDTO selectCondition(String userid) {
		return dao.selectCondition(userid);
	}

	public MemberDTO selectOneById(String userid) {
		return dao.selectOneById(userid);
	}

	public List<MemberDTO> selectList() {
		return dao.selectList();
	}

	public int mpModify(MemberDTO dto) {
		int row = dao.update(dto);
		return row;
	}

	public int conditionModify(ConditionDTO dto) {
		dto.setProfile(dto.getUpload().getOriginalFilename());
		int row = dao.conditionUpdate(dto);
		return row;
	}
}