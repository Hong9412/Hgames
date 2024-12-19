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
public class GameDetailImgVO {
	private int gameNo;
	private int detailNo;
	private String fileName;
	private String fileRename;
	private String filePath;
	private long fileLength;
}
