package com.itbank.repository;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import com.itbank.model.ReviewDTO;

@Repository
public interface ReviewDAO {
	
	@Select("select * from review where (title like '%' || #{search} || '%' or content like '%' || #{search} || '%' or writer like '%' || #{search} || '%') order by idx desc offset #{paging.offset} rows fetch next #{paging.fetch} rows only")
	List<ReviewDTO> selectList(Map<String, Object> map);
	
	@Insert("insert into review (title, img, writer, content) values (#{title}, #{img}, #{writer}, #{content})")
	int insert(ReviewDTO dto);
	
	@Select("select * from review where idx = #{idx}")
	ReviewDTO selectOne(int idx);
	
	@Select("SELECT * FROM ( SELECT * FROM review WHERE idx <> #{idx} ORDER BY writeDate DESC ) WHERE ROWNUM <= 4")
	List<ReviewDTO> recommendList(int idx);
	
	@Select("select count(*) from review where (title like '%' || #{search} || '%' or content like '%' || #{search} || '%' or writer like '%' || #{search} || '%')")
	int boardCount(String search);

}
