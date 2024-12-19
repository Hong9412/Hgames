package com.hong.hGames.user.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.hong.hGames.user.domain.InquiryVO;
import com.hong.hGames.user.service.UserService;

@Controller
public class InquiryController {
	
	@Autowired
	private UserService uService;	
	
	// --------------- 문의하기 페이지 이동 ------------------
	@GetMapping("/user/inquiry")
	public String showInquiryForm(HttpSession session, Model model) {
        String userId = (String) session.getAttribute("userId");
        model.addAttribute("userId", userId);
		return "/notice/inquiry";
	}
	// --------------- 문의하기 기능 ------------------
	@PostMapping("/user/inquiry")
	public String insertInquiryForm(HttpSession session, Model model, InquiryVO que) {
        int result = uService.insertInquiry(que);
		if(result > 0) {
			return "redirect:/user/myInquiry";
		}else {
			return "";
		}
	}
	// --------------- 회원 문의목록 페이지 이동 ------------------
	@GetMapping("/user/myInquiry")
	public String showMyInquiryForm(HttpSession session, Model model) {
        String userId = (String) session.getAttribute("userId");
        model.addAttribute("userId", userId);
		List<InquiryVO> qList = uService.selectUserQna(userId);
		model.addAttribute("qList", qList);
		return "/user/myInquiry";
	}
	// --------------- 회원 문의 상세 페이지 ------------------
	@GetMapping("/user/InquiryDetail")
	public String InquiryDetail(Model model, Integer questionNo) {
		InquiryVO qna = uService.InquiryDetail(questionNo);
		model.addAttribute("qna", qna);
		return "/user/InquiryDetail";
	}
	// --------------- 관리자 문의관리 페이지 이동 ------------------
	@GetMapping("/admin/adminInquiry")
	public String ShowAdminInquiry(Model model) {
		List<InquiryVO> qList = uService.selectAdminQna();
        model.addAttribute("qList", qList);
		return "/admin/adminInquiry";		
	}
	// --------------- 관리자 문의 답변 페이지 이동 ------------------
	@GetMapping("/admin/answerInquiry")
	public String showAnswerInquiry(Model model, Integer questionNo) {
		InquiryVO qna = uService.InquiryDetail(questionNo);
		model.addAttribute("qna", qna);
		return "admin/answerInquiry";
	}
	// --------------- 관리자 문의 답변 기능 ------------------ 
	@PostMapping("/admin/answerInsert")
	public String answerInquiry(Model model, InquiryVO qna) {
		int result = uService.answerInquiry(qna);
		return "redirect:/admin/adminInquiry";
	}
	@GetMapping("/notice/deleteInqury")
	public String deleteInqury(Model model, Integer questionNo) {
		int result = uService.deleteInqury(questionNo);
		return "redirect:/admin/adminInquiry";
	}
}
