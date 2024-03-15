package com.itbank.repository;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import com.itbank.model.MarriageDTO;
import com.itbank.model.ReviewDTO;
import com.itbank.model.ReviewLikeDTO;

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

	@Select("select * from reviewLike where userid = #{userid} and board_idx = #{board_idx}")
	ReviewLikeDTO selectLike(ReviewLikeDTO like);

	@Insert("insert into reviewLike (userid, board_idx) values (#{userid}, #{board_idx})")
	int insertLike(ReviewLikeDTO like);

	@Delete("delete from reviewLike where userid = #{userid} and board_idx = #{board_idx}")
	int deleteLike(ReviewLikeDTO like);
	
	@Select("select count(*) from reviewLike where board_idx = #{board_idx}")
	int selectCount(ReviewLikeDTO like);
	
	@Select("select * from marriage where user1 = #{writer} or user2 = #{writer}")
	MarriageDTO selectMate(String writer);
	
	@Update("update review "
			+ "set"
			+ "	title = #{title},"
			+ "	content = #{content},"
			+ "	img = #{img}"
			+ " where"
			+ "	idx = #{idx} and writer = #{writer}")
	int update(ReviewDTO dto);
	
	@Delete("delete from review where idx = #{idx}")
	int delete(int idx);
	

}
