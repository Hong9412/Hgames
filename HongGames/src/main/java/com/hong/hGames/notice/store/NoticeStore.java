package com.hong.hGames.notice.store;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.apache.ibatis.session.RowBounds;

import com.hong.hGames.notice.domain.vo.NoticeVO;

@Mapper
public interface NoticeStore {

	@Insert("INSERT INTO NOTICE_TBL VALUES(SEQ_NOTICE_NO.NEXTVAL, #{noticeName}, #{noticeContent}, DEFAULT)")
	int insertNotice(NoticeVO notice);

	@Update("UPDATE NOTICE_TBL SET NOTICE_NAME = #{noticeName}, NOTICE_CONTENT = #{noticeContent} WHERE NOTICE_NO = #{noticeNo}")
	int modifyNotice(NoticeVO notice);
	
	@Delete("DELETE FROM NOTICE_TBL WHERE NOTICE_NO = #{noticeNo}")
	int deleteNotice(Integer noticeNo);

	@Select("SELECT * FROM NOTICE_TBL WHERE NOTICE_NO = #{noticeNo}")
	NoticeVO selectOneByNo(Integer noticeNo);

	@Select("SELECT * FROM NOTICE_TBL ORDER BY NOTICE_NO DESC")
	List<NoticeVO> selectNoticeList(RowBounds rowBounds);

	/* NoticeVO selectNoticeByNo(Integer noticeNo); */	

	@Select("SELECT * FROM NOTICE_TBL ORDER BY NOTICE_NO DESC")
	List<NoticeVO> adminNoticeList();

}
