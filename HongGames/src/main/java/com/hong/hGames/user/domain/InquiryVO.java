package com.hong.hGames.user.domain;

import java.sql.Date;
import java.sql.Timestamp;

import org.springframework.stereotype.Service;

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
public class InquiryVO {
	private int questionNo;
	private String userId;
	private String questionCategory;
	private String questionTitle;
	private String questionContent;
	private Date questionDate;
	private String questionAnswer;
	private String questionYn;
	private Timestamp answerDate;
}
