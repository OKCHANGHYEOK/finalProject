package com.itbank.repository;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import com.itbank.model.MemberDTO;

public interface MemberDAO {

	@Insert("insert into member(userid, userpw, username, gender, age, email) "
			+ "values(#{userid}, #{userpw}, #{username}, #{gender}, #{age}, #{email})")
	int join(MemberDTO dto);

	@Select("select count(*) from member "
			+ "where userid = #{userid}")
	int check(String userid);

	@Select("select * from member where userid = #{userid} and userpw = #{userpw}")
	MemberDTO selectOne(MemberDTO dto);

	@Select("select * from member where userid = #{userid} and username = #{username} and email = #{email}")
	MemberDTO selectCheck(MemberDTO dto);

}
