package com.hong.hGames.notice.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.hong.hGames.common.PageInfo;
import com.hong.hGames.notice.domain.vo.NoticeVO;
import com.hong.hGames.notice.service.NoticeService;

@Controller
public class NoticeController {
	
	@Autowired
	private NoticeService nService;
	
	// --------------- 공지사항 등록 페이지 이동 ------------------
	@GetMapping("/notice/insert")
	public String showWriteForm() {
		return "notice/write";
	}
	// --------------- 공지사항 등록 기능 ------------------
	@PostMapping("notice/insert")
	public String insertNotice(NoticeVO notice) {
		int result = nService.insertNotice(notice);
		return "redirect:/admin/notice";
	}
	// --------------- 공지사항 페이지 이동 ------------------
	@GetMapping("/hGame/notice")
	public String showHgameNoticeList(Model model
			, @RequestParam(value="page", required = false, defaultValue = "1") Integer currentPage) {
		int boardLimit = 10;
		int totalCount = 232;
		PageInfo pi = new PageInfo(currentPage, totalCount, boardLimit);		
		List<NoticeVO> nList = nService.selectNoticeList(pi);
		model.addAttribute("nList", nList);
		model.addAttribute("pi",pi);
		return "notice/notice";
	}	
	// --------------- 관리자 공지관리 페이지 이동 ------------------
	@GetMapping("/admin/notice")
	public String showNoticeForm(Model model) {
		List<NoticeVO> nList = nService.adminNoticeList();
		model.addAttribute("nList", nList);
		return "/admin/noticeManage";
	}	
	// --------------- 공지사항 상세 페이지 이동 ------------------
	@GetMapping("/notice/detail")
	public String showNoticeByNo(Model model, Integer noticeNo) {
		NoticeVO notice = nService.selectOneByNo(noticeNo);
		model.addAttribute("notice", notice);
		return "notice/detail";
	}
	// --------------- 공지사항 삭제 기능 ------------------
	@GetMapping("/notice/delete")
	public String deleteNotice(Model model, Integer noticeNo) {
		int result = nService.deleteNotice(noticeNo);
		return "redirect:/admin/notice";
	}
	// --------------- 공지사항 수정 페이지 이동 ------------------
	@GetMapping("/notice/modify")
	public String showModifyNotice(Model model, Integer noticeNo) {
		NoticeVO notice = nService.selectOneByNo(noticeNo);
		model.addAttribute("notice", notice);
		return "notice/modify";
	}
	
	// --------------- 공지사항 수정 기능 ------------------
	@PostMapping("/notice/update")
	public String ModifyNotice(Model model, NoticeVO notice) {
		int result = nService.modifyNotice(notice);
		model.addAttribute("notice", notice);
		return "redirect:/admin/notice";
	}
}