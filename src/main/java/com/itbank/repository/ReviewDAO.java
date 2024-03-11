package com.itbank.repository;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import com.itbank.model.ReviewDTO;

@Repository
public interface ReviewDAO {
	
	@Select("select * from review order by idx desc")
	List<ReviewDTO> selectList();
	
	@Insert("insert into review (title, img, writer, content) values (#{title}, #{img}, #{writer}, #{content})")
	int insert(ReviewDTO dto);
	
	@Select("select * from review where idx = #{idx}")
	ReviewDTO selectOne(int idx);
	
	@Select("SELECT * FROM ( SELECT * FROM review WHERE idx <> #{idx} ORDER BY writeDate DESC ) WHERE ROWNUM <= 4")
	List<ReviewDTO> recommendList(int idx);


}
