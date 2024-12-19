package com.hong.hGames.user.service;

import java.util.List;

import com.hong.hGames.game.domain.KakaoPayVO;
import com.hong.hGames.user.domain.InquiryVO;
import com.hong.hGames.user.domain.UserVO;

public interface UserService {

	int joinUser(UserVO user);

	UserVO checkUserLogin(UserVO user);

	int userDelete(String userId);

	int insertInquiry(InquiryVO que);

	List<InquiryVO> selectUserQna(String userId);

	InquiryVO InquiryDetail(Integer questionNo);

	UserVO selectOneById(String userId);

	List<UserVO> userList();

	List<InquiryVO> selectAdminQna();

	int userModify(UserVO user);
	
	UserVO adminUserModify(String userId);

	int userModifyByUserId(UserVO user);

	int answerInquiry(InquiryVO qna);

	int deleteInqury(Integer questionNo);

	List<KakaoPayVO> selectPay(String userId);
}
