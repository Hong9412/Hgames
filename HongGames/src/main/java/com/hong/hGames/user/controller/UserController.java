package com.hong.hGames.user.controller;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.hong.hGames.game.domain.KakaoPayVO;
import com.hong.hGames.user.domain.UserVO;
import com.hong.hGames.user.service.UserService;

@Controller
public class UserController {
	
	@Autowired
	private UserService uService;
	
	// --------------- 로그인 페이지 이동 ------------------
	@GetMapping("/user/login")
	public String showLoginForm() {
		return "user/login";
	}
	// --------------- 유저 로그인 기능 ------------------
	@PostMapping("/user/login")
	public String userLogin(String userId, String userPw, UserVO user, HttpSession session) {
		user = uService.checkUserLogin(user);
		if(user != null) {
			session.setAttribute("userId", user.getUserId());
			session.setAttribute("userPw", user.getUserName());	
			return "redirect:/";
		}else {
			return "";			
		}
	}
	// --------------- 카카오 로그인 -------------------------------------------
	@GetMapping("/app/login/kakao")
	public String socialNetworkLogin(String code, HttpSession session) throws Exception {
		System.out.println(code);
		String access_Token = this.getAccessToken(code);
	    HashMap<String, Object> userInfo = this.getKakaoInfo(access_Token);
	    System.out.println("login Controller : " + userInfo);
	    //    클라이언트의 이메일이 존재할 때 세션에 해당 이메일과 토큰 등록
	    if (userInfo.get("userNickname") != null) {
	        session.setAttribute("userId", userInfo.get("userNickname"));
	    }	    	
		return "redirect:/";
	}
	
	// 카카오 로그인 access_token 리턴
	public String getAccessToken(String code) throws Exception {
		String access_Token = "";
		String refresh_Token = "";
		String reqURL = "https://kauth.kakao.com/oauth/token";

		try {
			URL url = new URL(reqURL);

			HttpURLConnection conn = (HttpURLConnection) url.openConnection();

			// POST 요청을 위해 기본값이 false인 setDoOutput을 true로
			conn.setRequestMethod("POST");
			conn.setDoOutput(true);

			// POST 요청에 필요로 요구하는 파라미터 스트림을 통해 전송
			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
			StringBuilder sb = new StringBuilder();
			sb.append("grant_type=authorization_code");
			sb.append("&client_id=3c28aec3867b8ec1ca3c741c41641deb"); // 본인이 발급받은 key
			sb.append("&redirect_uri=http://127.0.0.1:9888/app/login/kakao"); // 본인이 설정해 놓은 경로
			sb.append("&code=" + code);
			bw.write(sb.toString());
			bw.flush();

			// 결과 코드가 200이라면 성공
			int responseCode = conn.getResponseCode();
			System.out.println("responseCode : " + responseCode);

			// 요청을 통해 얻은 JSON타입의 Response 메세지 읽어오기
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			String line = "";
			String result = "";

			while ((line = br.readLine()) != null) {
				result += line;
			}
			System.out.println("response body : " + result);

			// Gson 라이브러리에 포함된 클래스로 JSON파싱 객체 생성
			Gson gson = new Gson();
			JsonElement element = gson.fromJson(result, JsonElement.class);

			access_Token = element.getAsJsonObject().get("access_token").getAsString();
			refresh_Token = element.getAsJsonObject().get("refresh_token").getAsString();

			System.out.println("access_token : " + access_Token);
			System.out.println("refresh_token : " + refresh_Token);

			br.close();
			bw.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return access_Token;
	}

	// 카카오 사용자 정보 추출
	public HashMap<String, Object> getKakaoInfo(String accessToken) throws Exception {
	    HashMap<String, Object> userInfo = new HashMap<>();
	    String reqURL = "https://kapi.kakao.com/v2/user/me";
	    try {
	        URL url = new URL(reqURL);
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        conn.setRequestMethod("GET");
	        conn.setRequestProperty("Authorization", "Bearer " + accessToken);

	        int responseCode = conn.getResponseCode();
	        System.out.println("responseCode : " + responseCode);

	        BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	        String result = br.lines().collect(Collectors.joining());
	        System.out.println("response body : " + result);

	        Gson gson = new Gson();
	        JsonObject element = gson.fromJson(result, JsonObject.class);

	        JsonObject properties = element.getAsJsonObject("properties");
	        JsonObject kakao_account = element.getAsJsonObject("kakao_account");

	        String userEmail = kakao_account.has("email") ? kakao_account.getAsJsonObject().get("email").getAsString() : null;
	        String userNickname = properties.has("nickname") ? properties.getAsJsonObject().get("nickname").getAsString() : null;

	        if (userEmail != null) {
	            userInfo.put("userEmail", userEmail);
	        }
	        if (userNickname != null) {
	            userInfo.put("userNickname", userNickname);
	        }

	    } catch (IOException e) {
	        e.printStackTrace();
	    }
	    return userInfo;
	}
	
	// --------------- 로그아웃 페이지 이동 ------------------
	@GetMapping("/user/logout")
	public String userLogout(HttpSession session, Model model) {
		if(session != null) {
			session.invalidate();
			return "redirect:/";
		}else {
			return "";
		}
	}
	// --------------- 유저 회원탈퇴 페이지 이동 ------------------
	@GetMapping("/user/delete")
	public String showUserDelete(HttpSession session, Model model) {
        String userId = (String)session.getAttribute("userId");
        model.addAttribute("userId", userId);
		return "user/delete";
	}
	// --------------- 유저 회원탈퇴 기능 ------------------
	@GetMapping("/user/userDelete")
	public String userDelete(Model model, HttpSession session) {
        String userId = (String)session.getAttribute("userId");
        model.addAttribute("userId", userId);
		int result = uService.userDelete(userId);
		session.invalidate();
		return "redirect:/";
	}
	// --------------- 유저 회원가입 페이지 이동 ------------------
	@GetMapping("/user/join")
	public String showJoinForm() {
		return "user/join";
	}
	// --------------- 유저 회원가입 기능 ------------------
	@PostMapping("/user/join")
	public String userJoin(UserVO user) {
		int result = uService.joinUser(user);
		if(result > 0) {
			return "redirect:/";
		}else {
			return "";
		}
	}
	// --------------- 유저 마이페이지 페이지 이동 ------------------
	@GetMapping("/user/myPage")
	public String showMyPageForm(HttpSession session, Model model, UserVO user) {
        String userId = (String) session.getAttribute("userId");
        user = uService.selectOneById(userId);
        model.addAttribute("user", user);
		return "user/myPage";
	}
	// --------------- 유저 정보 수정 페이지 이동 ------------------
	@GetMapping("/user/modify")
	public String showUserModify(HttpSession session, Model model, UserVO user) {
	    String userId = (String) session.getAttribute("userId");
	    user = uService.selectOneById(userId);
	    model.addAttribute("user", user);        
		return "user/modify";
	}
	@GetMapping("/user/pay")
	public String showUserPay(HttpSession session, Model model) {
		String userId = (String) session.getAttribute("userId");
		List<KakaoPayVO> pList = uService.selectPay(userId);
		model.addAttribute("pList",pList);
		return "user/payList";
	}
	// --------------- 유저 정보 수정 기능 ------------------
	@PostMapping("/user/modify")
	public String userModify(Model model, UserVO user) {
		int result = uService.userModify(user);
		model.addAttribute("user", user);  
		return "redirect:/user/myPage";
	}
	// --------------- 관리자 페이지 이동 ------------------
	@GetMapping("/admin/management")
	public String showAdminPage(Model model) {
		List<UserVO> uList = uService.userList();
		model.addAttribute("uList", uList);
		return "admin/userManage";
	}
	// --------------- 관리자 회원탈퇴 기능 ------------------
	@GetMapping("/admin/delete")
	public String adminUserDelete(String userId) {
		System.out.println(userId);
		int result = uService.userDelete(userId);
		return "redirect:/admin/management";
	}
	// --------------- 관리자 회원 정보 수정 페이지 이동 ------------------
	@GetMapping("/admin/userModify")
	public String ShowAdminUserModify(Model model, UserVO user, String userId) {
		user = uService.adminUserModify(userId);
		model.addAttribute("user", user); 
		return "admin/userModify";
	}
	// --------------- 관리자 회원 정보 수정 기능 ------------------
	@PostMapping("/admin/userModify")
	public String adminUserModify(Model model, UserVO user) {
		int result = uService.userModifyByUserId(user);
		model.addAttribute("user", user);  
		return "redirect:/admin/management";
	}
}
