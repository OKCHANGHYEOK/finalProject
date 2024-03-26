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
import com.itbank.model.ProfileDTO;
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
		int row = dao.conditionUpdate(dto);
		return row;
	}

	public int newPw(MemberDTO dto) {
		String hashPass = hash.getHash(dto.getUserpw());
		dto.setUserpw(hashPass);
		int row = dao.pwUpdate(dto);
		return row;
	}

	public MemberDTO memberOne(int idx) {
		return dao.memberOne(idx);
	}

	public int memberDelete(MemberDTO dto) {
		String hashPass = hash.getHash(dto.getUserpw());
		dto.setUserpw(hashPass);
		return dao.memberDelete(dto);
	}

	public int updateLastLogin(String userid) {
		return dao.updateLastLogin(userid);
	}

	public ProfileDTO selectProfile(String userid) {
		return dao.selectProfile(userid);
	}

	// 아이디 찾기
	public String findID(MemberDTO dto) {
	    // 데이터베이스에서 사용자의 아이디를 찾는 쿼리를 실행하여 결과를 가져옵니다.
	    String userId = dao.findUserId(dto);

	    if (userId != null) {
	        // 사용자의 아이디가 존재하는 경우에는 해당 아이디를 반환합니다.
	        return userId;
	    } else {
	        // 사용자의 아이디가 존재하지 않는 경우를 처리할 수 있는 방법에 따라 적절한 처리를 수행합니다.
	        // 예를 들어, 사용자에게 존재하지 않는 아이디임을 알리는 메시지를 반환하거나, 특정 값을 반환할 수 있습니다.
	        return "not_found";
	    }
	}

}