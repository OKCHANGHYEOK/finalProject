package com.itbank.repository;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.itbank.model.ConditionDTO;
import com.itbank.model.MemberDTO;

public interface MemberDAO {

	@Insert("insert into member(userid, userpw, username, email, gender, phoneNumber, birthYear, birthMonth, birthDay) "
			+ "values(#{userid}, #{userpw}, #{username}, #{email}, #{gender}, #{phoneNumber}, #{birthYear}, #{birthMonth}, #{birthDay})")
	int join(MemberDTO dto);

	@Insert("insert into condition(userid, marriedCount, residence," + " education, job, salary, "
			+ "religion, estate, owncar, " + "height, profile, introduce) "
			+ "values(#{userid}, #{marriedCount}, #{residence}, #{education}, #{job}, "
			+ "#{salary}, #{religion}, #{estate}, #{owncar}, " + "#{height}, #{profile}, #{introduce})")
	int insertCondition(ConditionDTO dto);

	@Select("select count(*) from member " + "where userid = #{userid}")
	int check(String userid);

	@Select("select * from member where userid = #{userid} and userpw = #{userpw}")
	MemberDTO selectOne(MemberDTO dto);

	@Select("select * from member where userid = #{userid} and username = #{username} and email = #{email}")
	MemberDTO selectCheck(MemberDTO dto);

	@Update("update member " + "      set" + "         userpw = #{userpw} " + "      where"
			+ "         userid = #{userid} and email = #{email}")
	int updatePassword(MemberDTO dto);

	@Select("select * from condition where userid = #{userid}")
	ConditionDTO selectCondition(String userid);

	@Select("select * from member where userid = #{userid}")
	MemberDTO selectOneById(String userid);

	@Select("select * from member order by idx desc")
	List<MemberDTO> selectList();

	@Update("update member " + " set" + "      username = #{username}," + "      gender = #{gender},"
			+ "      birthYear = #{birthYear}," + "      birthMonth = #{birthMonth}," + "      birthDay = #{birthDay}"
			+ " where" + "      userid = #{userid}")
	int update(MemberDTO dto);

	@Update("update condition " + " set" + "      marriedCount = #{marriedCount}," + "      residence = #{residence},"
			+ "      education = #{education}," + "      job = #{job}," + "      salary = #{salary},"
			+ "      religion = #{religion}," + "      estate = #{estate}," + "      owncar = #{owncar},"
			+ "      height = #{height}," + "      profile = #{profile}," + "      introduce = #{introduce}" + " where"
			+ "      userid = #{userid}")
	int conditionUpdate(ConditionDTO dto);
}
