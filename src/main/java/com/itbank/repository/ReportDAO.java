package com.itbank.repository;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.itbank.model.ReportDTO;

public interface ReportDAO {

	@Insert("insert into report (reporter, img, target, content) values (#{reporter}, #{img}, #{target}, #{content})")
	int insert(ReportDTO dto);

	@Select("select * from report where reporter = #{userid} order by idx desc")
	List<ReportDTO> selectList(String userid);

	@Delete("delete from report where idx = #{idx}")
	int delete(int idx);

	@Select("select * from report where idx = #{idx}")
	ReportDTO selectOne(int idx);

	@Update("update report "
			+ " set "
			+ " target = #{target},"
			+ " content = #{content}"
			+ " img = #{img}"
			+ " where"
			+ " reporter = #{reporter}")
	int update(ReportDTO dto);

}
