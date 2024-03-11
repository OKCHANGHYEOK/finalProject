package com.itbank.service;

import java.io.File;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.model.ReviewDTO;
import com.itbank.repository.ReviewDAO;

@Service
public class ReviewService {

	@Autowired ReviewDAO dao;
	private String saveDirectory = "C:\\upload";
	
	public List<ReviewDTO> selectList() {
		return dao.selectList();
	}
	public int write(ReviewDTO dto) {
		String img = dto.getUpload().getOriginalFilename();
		File f = new File(saveDirectory, img);
		try {
			dto.getUpload().transferTo(f);
		} catch (Exception e) {
			e.printStackTrace();
		}
		dto.setImg(img);
		return dao.insert(dto);
	}
	public ReviewDTO selectOne(int idx) {
		return dao.selectOne(idx);
	}
	public List<ReviewDTO> recommendList(int idx) {
		return dao.recommendList(idx);
	}

}
