package com.hong.hGames.game.controller;


import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.hong.hGames.game.domain.GameDetailContentVO;
import com.hong.hGames.game.domain.GameDetailImgVO;
import com.hong.hGames.game.domain.GameVO;
import com.hong.hGames.game.domain.PromotionVO;
import com.hong.hGames.game.domain.TitleImgVO;
import com.hong.hGames.game.service.GameService;
import com.hong.hGames.notice.domain.vo.NoticeVO;

@Controller
public class HgamesController {
	
	@Autowired
	private GameService gService;
	
	// --------------- 메인 페이지 이동 ------------------
	@GetMapping("/")
	public String showHgameForm(HttpSession session, Model model) {
		List<GameVO> gList = gService.getGameList();
		List<NoticeVO> nList = gService.getNoticeList();
		List<TitleImgVO> tList = gService.titleList();
		model.addAttribute("gList", gList); 
		model.addAttribute("nList", nList); 
		model.addAttribute("tList", tList); 		
		return "hGame/hGame";
	}
	// --------------- 자주 묻는 질문 페이지 이동 ------------------
	@GetMapping("/notice/support")
	public String showSupportForm(Model model) {
		return "notice/support";
	}
	// --------------- 게임 페이지 이동 ------------------
	@GetMapping("/hGame/option")
	public String showOptionForm(Model model) {
		List<GameVO> gList = gService.gameList();
		List<TitleImgVO> tList = gService.titleList();
		model.addAttribute("gList", gList); 
		model.addAttribute("tList", tList); 
		return "hGame/gameOption";
	}
	// --------------- 게임 상세 페이지 이동 ------------------
	@GetMapping("/hGame/detail")
	public String showDetailGame(Model model, Integer gameNo) {
		GameVO game = gService.selectGame(gameNo);
		TitleImgVO title = gService.selectTitleImg(gameNo);
		List<GameDetailContentVO> dList = gService.selectDetailContent(gameNo);
		List<GameDetailImgVO> iList = gService.selectImageList(gameNo);
		System.out.println(dList);
		System.out.println(iList);
		model.addAttribute("game", game); 
		model.addAttribute("title", title);              
		model.addAttribute("dList", dList); 
		model.addAttribute("iList", iList); 
		return "hGame/DetailGame";
	}
	// --------------- 게임 필터(장르) ------------------
	@GetMapping("/hGame/searchJenre")
	public String showJenreOption(String gameJenre, Model model) {
		List<GameVO> gList = gService.getGamesByJenre(gameJenre);
		List<TitleImgVO> tList = gService.titleList();
		model.addAttribute("gList", gList); 
		model.addAttribute("tList", tList); 
		return "hGame/gameOption";
	}
	// --------------- 게임 필터(플랫폼) ------------------
	@GetMapping("/hGame/searchPlatform")
	public String showPlatformOption(String gamePlatform, Model model) {
		List<GameVO> gList = gService.getGamesByPlatform(gamePlatform);
		List<TitleImgVO> tList = gService.titleList();
		model.addAttribute("gList", gList); 
		model.addAttribute("tList", tList); 
		return "hGame/gameOption";
	}
	// --------------- 프로모션 페이지 이동 ------------------
	@GetMapping("/hGame/promotion")
	public String showPromotionForm(Model model) {
		List<PromotionVO> pList = gService.promotionList();
		List<GameVO> gList = gService.gameList();
		List<TitleImgVO> tList = gService.titleList();
		model.addAttribute("pList", pList);
		model.addAttribute("gList", gList);
		model.addAttribute("tList", tList); 
		return "hGame/promotion";
	}
	// --------------- 관리자 프로모션 관리 이동 ------------------
	@GetMapping("/admin/promotionManage")
	public String showAdminPromotionManage(Model model) {
		List<PromotionVO> pList = gService.promotionList();
		model.addAttribute("pList", pList);
		return "admin/promotionManage";
	}
	// --------------- 관리자 프로모션 등록 페이지 이동 ------------------
	@GetMapping("/admin/promotionInsert")
	public String showPromotionInsert(Model model) {
		List<GameVO> gList = gService.gameList();
		List<TitleImgVO> tList = gService.titleList();
		model.addAttribute("gList", gList); 
		model.addAttribute("tList", tList); 
		return "hGame/insertPromotion";
	}
	// --------------- 관리자 프로모션 기능 ------------------
	@PostMapping("/admin/promotionInsert")
	public String promotionInsert(@RequestParam Map<String, String> paramMap, PromotionVO promotion) {
	    List<String> gameNoList = new ArrayList<>();
	    List<String> gameSaleList = new ArrayList<>();
	    
	    for (String key : paramMap.keySet()) {
	        if (key.startsWith("gameNo_")) {
	            String gameNo = paramMap.get(key);
	            gameNoList.add(gameNo);
	            String saleKey = "gameSale_" + gameNo;
	            String gameSale = paramMap.get(saleKey);
	            gameSaleList.add(gameSale);
	        }
	    }

	    int result = gService.promotionInsert(promotion, gameNoList, gameSaleList);
	    return "redirect:/admin/promotionManage";
	}
	// --------------- 관리자 프로모션 삭제 기능 ------------------
	@GetMapping("/admin/promotionDelete")
	public String promotionDelete(Integer promotionNo) {
		int result = gService.deletePromotion(promotionNo);
		return "redirect:/admin/promotionManage";
	}
	// --------------- 게임 등록 페이지 이동 ------------------	
	@GetMapping("/game/insert")
	public String showInsertGame() {
		return "hGame/insertGame";
	}
	// --------------- 게임 등록 기능 ------------------	
	@PostMapping("/game/insert")
	public String insertGame(GameVO game, TitleImgVO titleImage,
            @RequestParam(value = "detailContent", required = false) List<String> contentList,
            @RequestParam(value = "hong", required = false) MultipartFile hongImage,
            @RequestParam(value = "images", required = false) List<MultipartFile> imageList,
            HttpSession session, HttpServletRequest request) throws IllegalStateException, IOException {
		
		// ----------- 대표사진 등록 -------------------
		if (hongImage != null && !hongImage.isEmpty()) {
			Map<String, Object> bMap = this.saveFile(request, hongImage);
			titleImage.setImageName((String) bMap.get("fileName1"));
			titleImage.setImageRename((String) bMap.get("fileRename1"));
			titleImage.setImagePath((String) bMap.get("filePath1"));
			titleImage.setImageLength((Long) bMap.get("fileSize1"));
		}
		
		int result = gService.insertGame(game, titleImage);
		
		String[] gameContents = request.getParameterValues("detailContent");
		
        if(imageList != null && !imageList.isEmpty()) {
            for (MultipartFile detailImage : imageList) {
                if (detailImage != null && !detailImage.isEmpty()) {
                    Map<String, Object> dMap = this.saveFile2(request, detailImage);
                    GameDetailImgVO gameImgs = new GameDetailImgVO();
                    gameImgs.setFileName((String)dMap.get("fileName"));
                    gameImgs.setFileRename((String)dMap.get("fileRename"));
                    gameImgs.setFilePath((String)dMap.get("filePath"));
                    gameImgs.setFileLength((Long)dMap.get("fileSize"));
                    // 각 이미지 정보 저장
                    gService.insertGameImages(gameImgs);
                }
            }
        }
          
        if (contentList != null && !contentList.isEmpty()) {
            for (String content : contentList) {
                GameDetailContentVO newContent = new GameDetailContentVO();
                newContent.setDetailContent(content);
                gService.insertDetailContent(newContent);
            }
        }
        System.out.println(gameContents);
        return "redirect:/admin/gameManage";
			
    }
	
	// --------------- 게임관리 페이지 이동 ------------------
	@GetMapping("/admin/gameManage")
	public String showGameManage(Model model) {
		List<GameVO> gList = gService.gameList();
		List<TitleImgVO> tList = gService.titleList();
		model.addAttribute("gList", gList); 
		model.addAttribute("tList", tList); 
		return "/admin/gameManage";
	}
	// --------------- 게임 삭제 기능 ------------------
	@GetMapping("/game/delete")
	public String gameDelete(Model model, String gameNo) {
		int result = gService.gameDelete(gameNo);
		return "redirect:/admin/gameManage";
	}
	// --------------------------------------------------- 그 대표 사진 저장 경로 ---------------------------------------------------
	private Map<String, Object> saveFile(HttpServletRequest request, MultipartFile hongImage)
			throws IllegalStateException, IOException {
		String fileName1 = hongImage.getOriginalFilename();
		// 저장 경로
		String projectPath = request.getSession().getServletContext().getRealPath("resources");
		String saveDirectory = projectPath + "\\gameTitleImgs";
		File sDir = new File(saveDirectory);
		if (!sDir.exists()) {
			sDir.mkdir(); // 폴더가 없으면 자동으로 만들어줌
		}
		// 파일 리네임의 필요성!!
		// A : 1.png, B: 1.png --> 내용은 다르지만 이름이 같은 파일을 구별하기 위해서 꼭 파일 리네임을 해주어야함
		// 리네임을 할 때에는 올린 시각을 기준으로 파일 이름을 만들어서 따로 저장
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss"); // 나중에 SS랑 비교
		String strResult1 = sdf.format(new Date(System.currentTimeMillis()));
		String ext = fileName1.substring(fileName1.lastIndexOf(".") + 1); // 원본파일의 확장자 글자부터 시작되도록 +1 해줌
		String fileRename1 = strResult1 + "." + ext;
		
		String savePath1 = saveDirectory + "\\" + fileRename1;
		File file = new File(savePath1);
		
		// 파일 저장
		hongImage.transferTo(file);
		// DB에 저장할 파일정보 셋팅
		// 1. 파일이름, 2.파일 리네임, 3. 파일경로, 4.파일크기
		long fileLength1 = hongImage.getSize();
		Map<String, Object> infoMap = new HashMap<String, Object>();
		infoMap.put("fileName1", fileName1);
		infoMap.put("fileRename1", fileRename1);
		infoMap.put("filePath1", savePath1);
		infoMap.put("fileSize1", fileLength1);
		return infoMap;
	}
	
	
	
	
	// --------------------------------------------------- 왜 그 그 있잖아 디테일설명이미지 저장경로 ---------------------------------------------------
	private Map<String, Object> saveFile2(HttpServletRequest request, MultipartFile detailImage)
			throws IllegalStateException, IOException {
		String fileName = detailImage.getOriginalFilename();
		String projectPath = request.getSession().getServletContext().getRealPath("resources");
		String saveDirectory = projectPath + "\\gameDetailImgs";
		File sDir = new File(saveDirectory);
		if (!sDir.exists()) {
			sDir.mkdir();
		}
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String strResult = sdf.format(new Date(System.currentTimeMillis()));
		String ext = fileName.substring(fileName.lastIndexOf(".") + 1);
		String fileRename = strResult + "." + ext;
		String savePath = saveDirectory + "\\" + fileName;
		File file = new File(savePath);
		detailImage.transferTo(file);
		long fileLength = detailImage.getSize();
		Map<String, Object> infoMap2 = new HashMap<String, Object>();
		infoMap2.put("fileName", fileName);
		infoMap2.put("fileRename", fileRename);
		infoMap2.put("filePath", savePath);
		infoMap2.put("fileSize", fileLength);
		return infoMap2;
	}
}
