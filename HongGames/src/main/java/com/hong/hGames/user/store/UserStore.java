package com.hong.hGames.user.store;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.hong.hGames.game.domain.KakaoPayVO;
import com.hong.hGames.user.domain.InquiryVO;
import com.hong.hGames.user.domain.UserVO;

@Mapper
public interface UserStore {

	@Insert("INSERT INTO USER_TBL VALUES(#{userId}, #{userPw}, #{userName}, #{userEmail}, #{userPhone})")
	int joinUser(UserVO user);

	@Select("SELECT * FROM USER_TBL WHERE USER_ID = #{userId} AND USER_PW = #{userPw}")
	UserVO checkUserLogin(UserVO user);

	@Delete("DELETE FROM USER_TBL WHERE USER_ID = #{userId}")
	int userDelete(String userId);

	@Insert("INSERT INTO QUESTION_TBL VALUES(SEQ_QUESTION_NO.NEXTVAL, #{userId}, #{questionCategory}, #{questionTitle}, #{questionContent}, DEFAULT, DEFAULT, DEFAULT, NULL)")
	int insertInquiry(InquiryVO que);

	@Select("SELECT * FROM QUESTION_TBL WHERE USER_ID = #{userId}")
	List<InquiryVO> selectUserQna(String userId);

	@Select("SELECT * FROM QUESTION_TBL WHERE QUESTION_NO = #{questionNo}")
	InquiryVO InquiryDetail(Integer questionNo);

	@Select("SELECT * FROM USER_TBL WHERE USER_ID = #{userId}")
	UserVO selectOneById(String userId);

	@Select("SELECT * FROM USER_TBL")
	List<UserVO> userList();

	@Select("SELECT * FROM QUESTION_TBL ORDER BY QUESTION_NO DESC")
	List<InquiryVO> selectAdminQna();

	@Update("UPDATE USER_TBL SET USER_PW = #{userPw}, USER_EMAIL= #{userEmail} WHERE USER_ID = #{userId}")
	int userModify(UserVO user);

	@Select("SELECT * FROM USER_TBL WHERE USER_ID = #{userId}")
	UserVO adminUserModify(String userId);

	@Update("UPDATE USER_TBL SET USER_PW = #{userPw}, USER_EMAIL= #{userEmail}, USER_NAME = #{userName} WHERE USER_ID = #{userId}")
	int userModifyByUserId(UserVO user);

	@Update("UPDATE QUESTION_TBL SET QUESTION_ANSWER = #{questionAnswer}, QUESTION_YN = 'Y', ANSWER_DATE = SYSDATE WHERE QUESTION_NO = #{questionNo}")
	int answerInquiry(InquiryVO qna);

	@Delete("DELETE FROM QUESTION_TBL WHERE QUESTION_NO = #{questionNo}")
	int deleteInqury(Integer questionNo);

	@Select("SELECT * FROM PAY_TBL WHERE USER_ID = #{userId}")
	List<KakaoPayVO> selectPay(String userId);
}
