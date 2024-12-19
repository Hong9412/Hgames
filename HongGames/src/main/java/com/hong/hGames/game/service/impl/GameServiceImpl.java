package com.hong.hGames.game.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hong.hGames.game.domain.GameDetailContentVO;
import com.hong.hGames.game.domain.GameDetailImgVO;
import com.hong.hGames.game.domain.GameVO;
import com.hong.hGames.game.domain.KakaoPayVO;
import com.hong.hGames.game.domain.PromotionVO;
import com.hong.hGames.game.domain.TitleImgVO;
import com.hong.hGames.game.service.GameService;
import com.hong.hGames.game.store.GameStore;
import com.hong.hGames.notice.domain.vo.NoticeVO;

@Service
public class GameServiceImpl implements GameService {

    @Autowired
    private GameStore gStore;

    @Override
    public int insertGame(GameVO game, TitleImgVO titleImage) {
        int result = gStore.insertGame(game);
        if (result > 0) {
            int titleImageResult = gStore.insertTitleImage(titleImage);
        return result;
    }
		return result;
	}

	@Override
	public List<GameVO> gameList() {
		List<GameVO> gList = gStore.gameList();
		return gList;
	}

	@Override
	public List<TitleImgVO> titleList() {
		List<TitleImgVO> tList = gStore.titleList();
		return tList;
	}

	@Override
	public List<GameVO> getGamesByJenre(String gameJenre) {
		List<GameVO> gList = gStore.getGamesByJenre(gameJenre);
		return gList;
	}

	@Override
	public List<GameVO> getGamesByPlatform(String gamePlatform) {
		List<GameVO> gList = gStore.getGamesByPlatform(gamePlatform);
		return gList;
	}

	@Override
	public int gameDelete(String gameNo) {
		int result = gStore.gameDelete(gameNo);
		return result;
	}

	@Override
	public int promotionInsert(PromotionVO promotion, List<String> gameNoList, List<String> gameSaleList) {
	    int result = gStore.promotionInsert(promotion);
	    if (result > 0) {
	        int promotionNo = promotion.getPromotionNo();
	        for (int i = 0; i < gameNoList.size(); i++) {
	            String gameNo = gameNoList.get(i);
	            String gameSale = gameSaleList.get(i);
	            gStore.updateGameSaleAndPromotionNo(gameNo, gameSale, promotionNo);
	        }
	    }
	    return result;
	}

	@Override
	public List<PromotionVO> promotionList() {
		List<PromotionVO> pList = gStore.promotionList();
		return pList;
	}

	@Override
	public int deletePromotion(Integer promotionNo) {
		int result = gStore.deletePromotion(promotionNo);
        if (result > 0) {
            int promotionResult = gStore.resetPromotionGame(promotionNo);
        return result;
        }
		return result;
	}

	@Override
	public void insertGameImages(GameDetailImgVO gameImgs) {
		gStore.insertGameImages(gameImgs);
	}

	@Override
	public List<NoticeVO> getNoticeList() {
		List<NoticeVO> result = gStore.getNoticeList();
		return result;
	}

	@Override
	public List<GameVO> getGameList() {
		List<GameVO> result = gStore.getGameList();
		return result;
	}

	@Override
	public void insertDetailContent(GameDetailContentVO newContent) {
		gStore.insertDetailContent(newContent);
	}

	@Override
	public GameVO selectGame(Integer gameNo) {
		GameVO game = gStore.selectGame(gameNo);
		return game;
	}

	@Override
	public TitleImgVO selectTitleImg(Integer gameNo) {
		TitleImgVO title = gStore.selectTitleImg(gameNo);
		return title;
	}

	@Override
	public List<GameDetailContentVO> selectDetailContent(Integer gameNo) {
		List<GameDetailContentVO> dList = gStore.selectDetailContent(gameNo);
		return dList;
	}

	@Override
	public List<GameDetailImgVO> selectImageList(Integer gameNo) {
		List<GameDetailImgVO> iList = gStore.selectImageList(gameNo);
		return iList;
	}

	@Override
	public void savePaymentInfo(KakaoPayVO paymentInfo) {
		gStore.savePaymentInfo(paymentInfo);	
	}
}
