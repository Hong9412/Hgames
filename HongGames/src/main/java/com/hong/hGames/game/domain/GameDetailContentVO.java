package com.hong.hGames.game.domain;

import lombok.AllArgsConstructor;
import lombok.RequiredArgsConstructor;

@AllArgsConstructor
@RequiredArgsConstructor
public class GameDetailContentVO {
	private int gameNo;
	private int contentNo;
	private String detailContent;
	
	public int getGameNo() {
		return gameNo;
	}
	public void setGameNo(int gameNo) {
		this.gameNo = gameNo;
	}
	public int getContentNo() {
		return contentNo;
	}
	public void setContentNo(int contentNo) {
		this.contentNo = contentNo;
	}
	public String getDetailContent() {
		return detailContent;
	}
	public void setDetailContent(String detailContent) {
		this.detailContent = detailContent;
	}
	@Override
	public String toString() {
		return "GameDetailContentVO [gameNo=" + gameNo + ", contentNo=" + contentNo + ", detailContent=" + detailContent
				+ "]";
	}
}
