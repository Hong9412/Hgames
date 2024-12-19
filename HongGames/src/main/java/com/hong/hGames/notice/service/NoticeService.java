package com.hong.hGames.notice.service;

import java.util.List;

import com.hong.hGames.common.PageInfo;
import com.hong.hGames.notice.domain.vo.NoticeVO;

public interface NoticeService {

	int insertNotice(NoticeVO notice);

	List<NoticeVO> selectNoticeList(PageInfo pi);
	
	NoticeVO selectOneByNo(Integer noticeNo);

	int deleteNotice(Integer noticeNo);

	int modifyNotice(NoticeVO notice);

	List<NoticeVO> adminNoticeList();
}
