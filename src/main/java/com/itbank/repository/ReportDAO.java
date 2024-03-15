package com.itbank.repository;

import org.apache.ibatis.annotations.Insert;

import com.itbank.model.ReportDTO;

public interface ReportDAO {

	@Insert("insert into report (reporter, target, content) values (#{reporter}, #{target}, #{content})")
	int insert(ReportDTO dto);

}
