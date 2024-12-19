package com.hong.hGames.game.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter
@ToString
@AllArgsConstructor
@RequiredArgsConstructor
public class TitleImgVO {
	private int gameNo;
	private String imageName;
	private String imageRename;
	private String imagePath;
	private long imageLength;
}
