package com.itbank.repository;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.itbank.model.MemberDTO;

public interface MemberDAO {

	@Insert("insert into member(userid, userpw, username, email, gender, phoneNumber, birthYear, birthMonth, birthDay) "
			+ "values(#{userid}, #{userpw}, #{username}, #{email}, #{gender}, #{phoneNumber}, #{birthYear}, #{birthMonth}, #{birthDay})")
	int join(MemberDTO dto);

	@Select("select count(*) from member "
			+ "where userid = #{userid}")
	int check(String userid);

	@Select("select * from member where userid = #{userid} and userpw = #{userpw}")
	MemberDTO selectOne(MemberDTO dto);

	@Select("select * from member where userid = #{userid} and username = #{username} and email = #{email}")
	MemberDTO selectCheck(MemberDTO dto);
	
	@Update("update member "
	         + "      set"
	         + "         userpw = #{userpw} "
	         + "      where"
	         + "         userid = #{userid} and email = #{email}")
	   int updatePassword(MemberDTO dto);
}
