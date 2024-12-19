package com.hong.hGames.game.controller;

import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.hong.hGames.game.domain.KakaoPayVO;
import com.hong.hGames.game.service.GameService;

@RestController
public class KakaoPayController {
	
	@Autowired
	private GameService gService;
	
	@PostMapping("/processPayment")
    @ResponseBody
    public String processPayment(@RequestBody KakaoPayVO paymentInfo) {
		
		String gameKey = generateGameKey();
        paymentInfo.setGameKey(gameKey);
        gService.savePaymentInfo(paymentInfo);
        
        return "success";
    }
	
	private String generateGameKey() {
        Random random = new Random();
        
        StringBuilder gameKeyBuilder = new StringBuilder();
        for (int i = 0; i < 12; i++) {
            int digit = random.nextInt(10);
            gameKeyBuilder.append(digit);
        }
        
        return gameKeyBuilder.toString();
    }
}
