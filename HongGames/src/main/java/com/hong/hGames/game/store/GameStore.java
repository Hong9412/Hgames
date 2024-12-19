package com.hong.hGames.game.store;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.hong.hGames.game.domain.GameDetailContentVO;
import com.hong.hGames.game.domain.GameDetailImgVO;
import com.hong.hGames.game.domain.GameVO;
import com.hong.hGames.game.domain.KakaoPayVO;
import com.hong.hGames.game.domain.PromotionVO;
import com.hong.hGames.game.domain.TitleImgVO;
import com.hong.hGames.notice.domain.vo.NoticeVO;

@Mapper
public interface GameStore {

    @Insert("INSERT INTO GAME_TBL VALUES(SEQ_GAME_NO.NEXTVAL, #{game.gameTitle}, #{game.gameJenre}, #{game.gameCategory}, #{game.gamePlatform}, #{game.gameDate}, #{game.gameKorean}, #{game.gameKoreanVoice}, #{game.gamePrice}, DEFAULT, DEFAULT, #{game.gamePublisher})")
    int insertGame(@Param("game") GameVO game);

    @Insert("INSERT INTO TITLEIMG_TBL VALUES(SEQ_TITLE_NO.NEXTVAL, #{titleImage.imageName}, #{titleImage.imageRename}, #{titleImage.imagePath}, #{titleImage.imageLength})")
    int insertTitleImage(@Param("titleImage") TitleImgVO titleImage);

    @Select("SELECT * FROM GAME_TBL ORDER BY GAME_NO DESC")
	List<GameVO> gameList();

    @Select("SELECT * FROM TITLEIMG_TBL ORDER BY GAME_NO DESC")
	List<TitleImgVO> titleList();
    
    @Select("SELECT * FROM GAME_TBL WHERE gameJenre = #{gameJenre} AND gamePlatform = #{gamePlatform} AND gameCategory = #{gameCategory}")
	List<GameVO> searchGames(String gameJenre, String gamePlatform, String gameCategory);

    @Select("SELECT * FROM GAME_TBL WHERE GAME_JENRE = #{gameJenre}")
	List<GameVO> getGamesByJenre(String gameJenre);
    
    @Select("SELECT * FROM GAME_TBL WHERE GAME_PLATFORM = #{gamePlatform}")
	List<GameVO> getGamesByPlatform(String gamePlatform);

    @Delete("DELETE FROM GAME_TBL WHERE GAME_NO = #{gameNo}")
	int gameDelete(String gameNo);
    
    @Insert("INSERT INTO PROMOTION_TBL VALUES(SEQ_PROMOTION_NO.NEXTVAL, #{promotionTitle}, #{startDate}, #{endDate}, #{promotionContent})")
	int promotionInsert(PromotionVO promotion);

    @Update("UPDATE GAME_TBL SET GAME_SALE = #{gameSale}, PROMOTION_NO = SEQ_PROMOTION_NO.CURRVAL WHERE GAME_NO = #{gameNo}")
    int updateGameSaleAndPromotionNo(@Param("gameNo") String gameNo, @Param("gameSale") String gameSale, @Param("promotionNo") int promotionNo);

    @Select("SELECT * FROM PROMOTION_TBL")
	List<PromotionVO> promotionList();

    @Delete("DELETE FROM PROMOTION_TBL WHERE PROMOTION_NO = #{promotionNo}")
	int deletePromotion(Integer promotionNo);
    
    @Update("UPDATE GAME_TBL SET GAME_SALE = DEFAULT WHERE PROMOTION_NO = #{promotionNo}")
	int resetPromotionGame(Integer promotionNo);

    @Insert("INSERT INTO GAME_IMGS VALUES(SEQ_GAME_NO.CURRVAL, SEQ_DETAIL_NO.NEXTVAL, #{fileName}, #{fileRename}, #{filePath}, #{fileLength})")
	void insertGameImages(GameDetailImgVO gameImgs);

    @Select("SELECT * FROM NOTICE_TBL ORDER BY NOTICE_DATE DESC ")
	List<NoticeVO> getNoticeList();

    @Select("SELECT * FROM GAME_TBL ORDER BY GAME_NO DESC")
	List<GameVO> getGameList();

    @Insert("INSERT INTO GAME_DETAIL_CONTENT VALUES(SEQ_GAME_NO.CURRVAL,SEQ_CONTENT_NO.NEXTVAL, #{detailContent})")
	void insertDetailContent(GameDetailContentVO newContent);

    @Select("SELECT * FROM GAME_TBL WHERE GAME_NO = #{gameNo}")
	GameVO selectGame(Integer gameNo);
    
    @Select("SELECT * FROM TITLEIMG_TBL WHERE GAME_NO = #{gameNo}")
	TitleImgVO selectTitleImg(Integer gameNo);

    @Select("SELECT * FROM GAME_DETAIL_CONTENT WHERE GAME_NO = #{gameNo}")
	List<GameDetailContentVO> selectDetailContent(Integer gameNo);

    @Select("SELECT * FROM GAME_IMGS WHERE GAME_NO = #{gameNo}")
	List<GameDetailImgVO> selectImageList(Integer gameNo);

    @Insert("INSERT INTO PAY_TBL VALUES(SEQ_PAY_NO.NEXTVAL,#{userId} ,#{gameTitle}, #{howPay}, #{gamePrice}, DEFAULT, #{gameKey})")
	void savePaymentInfo(KakaoPayVO paymentInfo);
}
