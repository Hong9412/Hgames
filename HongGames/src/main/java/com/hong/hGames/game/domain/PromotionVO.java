package com.hong.hGames.game.domain;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter
@ToString
@AllArgsConstructor
@RequiredArgsConstructor
public class PromotionVO {
	private int promotionNo;
	private String promotionTitle;
	private Date startDate;
	private Date endDate;
	private String promotionContent;
}
