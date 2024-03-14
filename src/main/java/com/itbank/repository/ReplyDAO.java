package com.itbank.repository;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import com.itbank.model.ReviewReplyDTO;

@Repository
public interface ReplyDAO {
	
	@Select("select * from reviewReply where board_idx = #{board_idx} order by idx")
	List<ReviewReplyDTO> selectList(int board_idx);
	
	@Insert("insert into reviewReply (board_idx, writer, content) values (#{board_idx}, #{writer}, #{content})")
	int insertWrite(ReviewReplyDTO dto);
	
}
