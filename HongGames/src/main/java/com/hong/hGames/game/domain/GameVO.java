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
public class GameVO {
	private int gameNo;
	private String gameTitle;
	private String gameJenre;
	private String gameCategory;
	private String gamePlatform;
	private Date gameDate;
	private String gameKorean;
	private String gameKoreanVoice;
	private int gamePrice;
	private int gameSale;
	private int promotionNo;
	private String gamePublisher;
}
