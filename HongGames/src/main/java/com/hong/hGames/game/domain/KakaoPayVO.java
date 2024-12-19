package com.hong.hGames.game.domain;

import java.util.Date;

import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;

public class KakaoPayVO {
	
	private int payNo;
	private String userId;
	private String gameTitle;
	private String howPay;
	private int gamePrice;
	private Date priceDate;
	public String gameKey;
	
	public KakaoPayVO() {
		
	}
	
	public KakaoPayVO(String gameKey) {
		super();
		this.gameKey = gameKey;
	}

	public int getPayNo() {
		return payNo;
	}

	public void setPayNo(int payNo) {
		this.payNo = payNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getGameTitle() {
		return gameTitle;
	}

	public void setGameTitle(String gameTitle) {
		this.gameTitle = gameTitle;
	}

	public String getHowPay() {
		return howPay;
	}

	public void setHowPay(String howPay) {
		this.howPay = howPay;
	}

	public int getGamePrice() {
		return gamePrice;
	}

	public void setGamePrice(int gamePrice) {
		this.gamePrice = gamePrice;
	}

	public Date getPriceDate() {
		return priceDate;
	}

	public void setPriceDate(Date priceDate) {
		this.priceDate = priceDate;
	}

	public String getGameKey() {
		return gameKey;
	}

	public void setGameKey(String gameKey) {
		this.gameKey = gameKey;
	}

	@Override
	public String toString() {
		return "KakaoPayVO [payNo=" + payNo + ", userId=" + userId + ", gameTitle=" + gameTitle + ", howPay=" + howPay
				+ ", gamePrice=" + gamePrice + ", priceDate=" + priceDate + ", gameKey=" + gameKey + "]";
	}
}
