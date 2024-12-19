<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  	
<!DOCTYPE html>
<html class="h-100">
<head>
<meta charset="UTF-8">
<title>홍게임즈로그인</title>
</head>
<body class="d-flex flex-column h-100 text-bg-dark">
<!-- ================================헤더=============================================== -->		
		<%@ include file="../inc/head.jsp" %>						
		<jsp:include page="../inc/header.jsp"></jsp:include>	
<!-- ================================헤더=============================================== -->
	<script src="https://t1.kakaocdn.net/kakao_js_sdk/2.7.1/kakao.min.js"
	  integrity="sha384-kDljxUXHaJ9xAb2AzRd59KxjrFjzHa5TAoFQ6GbYTCAG0bjM55XohjjDT7tDDC01" crossorigin="anonymous"></script>
	<script>
	  Kakao.init('3c28aec3867b8ec1ca3c741c41641deb'); // 사용하려는 앱의 JavaScript 키 입력
	</script>
	<p id="token-result"></p>
	<div class="modal modal-sheet position-static d-block text-bg-dark p-4 py-md-5" tabindex="-1" role="dialog" id="modalSignin">
		<div class="modal-dialog" role="document">
			<div class="modal-content rounded-4 shadow text-bg-dark">
				<div class="modal-header p-5 pb-4 border-bottom-0">
					<h1 class="fw-bold mb-0 fs-2">로그인</h1>
				</div>
				<div class="modal-body p-5 pt-0">
					<form class="/user/login" method="post">
						<div class="form-floating mb-5 text-bg-dark">
							<input type="text" class="form-control rounded-3 text-bg-secondary" name="userId"
								id="floatingInput" placeholder="아이디를 입력해주세요">
						</div>
						<div class="form-floating mb-5">
							<input type="password" class="form-control rounded-3 text-bg-secondary" name="userPw"
								id="floatingPassword" placeholder="비밀번호를 입력해주세요">
						</div>
						<button class="w-100 mb-2 btn btn-lg rounded-3 btn-success"
							type="submit">Sign up</button>
						<hr class="my-4">
						
<!-- 						<a id="kakao-login-btn" href="javascript:loginWithKakao()"> -->
<!-- 						  <img src="https://k.kakaocdn.net/14/dn/btroDszwNrM/I6efHub1SN5KCJqLm1Ovx1/o.jpg" style="width: 400px; height: 45px; margin-bottom: 20px;" -->
<!-- 						    alt="카카오 로그인 버튼" /> -->
<!-- 						</a> -->
						
						<button class="w-100 mb-2 btn btn-lg rounded-3 btn-warning" onclick="loginWithKakao()" type="button" style="height: 45px; margin-bottom: 20px;">
							카카오 로그인
							<p id="token-result"></p>
						</button>
						<button
							class="w-100 py-2 mb-5 btn btn-outline-success rounded-3"
							type="button" onclick="join();">
							<use xlink:href="#twitter"></use>
							회원가입
						</button>
						
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- ================================푸터=============================================== -->
	<jsp:include page="../inc/footer.jsp"></jsp:include>
	<!-- ================================푸터=============================================== -->
	<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>	
	<script type="text/javascript">
		function join() {
			location.href ="/user/join";
		}	
	</script>
	<script>
	  function loginWithKakao() {
	    Kakao.Auth.authorize({
	      redirectUri: 'http://127.0.0.1:9888/app/login/kakao',
	    });
	  }
	</script>
</body>
</html>