package com.itbank.service;

import java.io.File;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.model.MarriageDTO;
import com.itbank.model.ReviewDTO;
import com.itbank.model.ReviewLikeDTO;
import com.itbank.repository.ReviewDAO;

@Service
public class ReviewService {

	@Autowired ReviewDAO dao;
	private String saveDirectory = "C:\\upload";
	
	public List<ReviewDTO> selectList(Map<String, Object> map) {
		return dao.selectList(map);
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
	public int getBoardCount(String search) {
		return dao.boardCount(search);
	}
	public ReviewLikeDTO selectLike(ReviewLikeDTO like) {
		return dao.selectLike(like);
	}
	public int addLike(ReviewLikeDTO like) {
		return dao.insertLike(like);
	}
	public int deleteLike(ReviewLikeDTO like) {
		return dao.deleteLike(like);
	}
	public int getLikeCount(ReviewLikeDTO like) {
		return dao.selectCount(like);
	}
	public MarriageDTO selectMate(String writer) {
		return dao.selectMate(writer);
	}
	public int update(ReviewDTO dto) {
		String img = dto.getUpload().getOriginalFilename();
		File f = new File(saveDirectory, img);
		try {
			dto.getUpload().transferTo(f);
		} catch (Exception e) {
			e.printStackTrace();
		}
		dto.setImg(img);
		return dao.update(dto);
	}
	public int delete(int idx) {
		return dao.delete(idx);
	}

}
