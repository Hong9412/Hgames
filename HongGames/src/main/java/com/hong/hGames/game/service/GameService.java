package com.hong.hGames.game.service;

import java.util.List;

import com.hong.hGames.game.domain.GameDetailContentVO;
import com.hong.hGames.game.domain.GameDetailImgVO;
import com.hong.hGames.game.domain.GameVO;
import com.hong.hGames.game.domain.KakaoPayVO;
import com.hong.hGames.game.domain.PromotionVO;
import com.hong.hGames.game.domain.TitleImgVO;
import com.hong.hGames.notice.domain.vo.NoticeVO;

public interface GameService {

	int insertGame(GameVO game, TitleImgVO titleImage);

	List<GameVO> gameList();

	List<TitleImgVO> titleList();

	List<GameVO> getGamesByJenre(String gameJenre);

	List<GameVO> getGamesByPlatform(String gamePlatform);

	int gameDelete(String gameNo);

	List<PromotionVO> promotionList();

	int deletePromotion(Integer promotionNo);

	int promotionInsert(PromotionVO promotion, List<String> gameNoList, List<String> gameSaleList);

	void insertGameImages(GameDetailImgVO gameImgs);

	List<NoticeVO> getNoticeList();

	List<GameVO> getGameList();

	void insertDetailContent(GameDetailContentVO newContent);

	GameVO selectGame(Integer gameNo);

	TitleImgVO selectTitleImg(Integer gameNo);

	List<GameDetailContentVO> selectDetailContent(Integer gameNo);

	List<GameDetailImgVO> selectImageList(Integer gameNo);

	void savePaymentInfo(KakaoPayVO paymentInfo);

}