package com.hong.hGames.user.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hong.hGames.game.domain.KakaoPayVO;
import com.hong.hGames.user.domain.InquiryVO;
import com.hong.hGames.user.domain.UserVO;
import com.hong.hGames.user.service.UserService;
import com.hong.hGames.user.store.UserStore;

@Service
public class UserServiceImpl implements UserService{

	@Autowired
	private UserStore uStore;

	@Override
	public int joinUser(UserVO user) {
		int result = uStore.joinUser(user);
		return result;
	}

	@Override
	public UserVO checkUserLogin(UserVO user) {
		user = uStore.checkUserLogin(user);
		return user;
	}

	@Override
	public int userDelete(String userId) {
		int result = uStore.userDelete(userId);
		return result;
	}

	@Override
	public int insertInquiry(InquiryVO que) {
		int result = uStore.insertInquiry(que);
		return result;
	}

	@Override
	public List<InquiryVO> selectUserQna(String userId) {
		List<InquiryVO> qList = uStore.selectUserQna(userId);
		return qList;
	}

	@Override
	public InquiryVO InquiryDetail(Integer questionNo) {
		InquiryVO result = uStore.InquiryDetail(questionNo);
		return result;
	}

	@Override
	public UserVO selectOneById(String userId) {
		UserVO user = uStore.selectOneById(userId);
		return user;
	}

	@Override
	public List<UserVO> userList() {
		List<UserVO> uList = uStore.userList();
		return uList;
	}

	@Override
	public List<InquiryVO> selectAdminQna() {
		List<InquiryVO> qList = uStore.selectAdminQna();
		return qList;
	}

	@Override
	public int userModify(UserVO user) {
		int result = uStore.userModify(user);
		return result;
	}

	@Override
	public UserVO adminUserModify(String userId) {
		UserVO user = uStore.adminUserModify(userId);
		return user;
	}

	@Override
	public int userModifyByUserId(UserVO user) {
		int result = uStore.userModifyByUserId(user);
		return result;
	}

	@Override
	public int answerInquiry(InquiryVO qna) {
		int result = uStore.answerInquiry(qna);
		return result;
	}

	@Override
	public int deleteInqury(Integer questionNo) {
		int result = uStore.deleteInqury(questionNo);
		return result;
	}

	@Override
	public List<KakaoPayVO> selectPay(String userId) {
		List<KakaoPayVO> pList = uStore.selectPay(userId);
		return pList;
	}
}
