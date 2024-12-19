package com.hong.hGames.notice.domain.vo;

import java.sql.Date;
import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class NoticeVO {
	@NonNull
	private Integer noticeNo;
	@NonNull
	private String noticeName;
	@NonNull
	private String noticeContent;
	@NonNull
	private Date noticeDate;
}