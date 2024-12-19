package com.hong.hGames.notice.service.impl;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hong.hGames.notice.store.NoticeStore;
import com.hong.hGames.common.PageInfo;
import com.hong.hGames.notice.domain.vo.NoticeVO;
import com.hong.hGames.notice.service.NoticeService;

@Service
public class NoticeServiceImpl implements NoticeService{

	@Autowired
	private NoticeStore nStore;
	
	@Override
	public int insertNotice(NoticeVO notice) {
		int result = nStore.insertNotice(notice);
		return result;
	}
	@Override
	public NoticeVO selectOneByNo(Integer noticeNo) {
		NoticeVO notice = nStore.selectOneByNo(noticeNo);
		return notice;
	}
	@Override
	public List<NoticeVO> selectNoticeList(PageInfo pi) {
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage()-1)*(pi.getBoardLimit());
		RowBounds rowBounds = new RowBounds(offset,limit);
		List<NoticeVO> nList = nStore.selectNoticeList(rowBounds);
		return nList;
	}
	@Override
	public int deleteNotice(Integer noticeNo) {
		int result = nStore.deleteNotice(noticeNo);
		return result;
	}
	@Override
	public int modifyNotice(NoticeVO notice) {
		int result = nStore.modifyNotice(notice);
		return result;
	}
	
	@Override
	public List<NoticeVO> adminNoticeList() {
		List<NoticeVO> nList = nStore.adminNoticeList();
		return nList;
	}
}
