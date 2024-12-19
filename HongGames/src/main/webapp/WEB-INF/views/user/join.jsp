<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  	
<!DOCTYPE html>
<html class="h-100">
<head>
	<meta charset="UTF-8">
	<title>홍게임즈회원가입</title>
	</head>
	<body class="d-flex flex-column h-100 text-bg-dark">
		<!-- ================================헤더=============================================== -->		
				<%@ include file="../inc/head.jsp" %>						
				<jsp:include page="../inc/header.jsp"></jsp:include>	
		<!-- ================================헤더=============================================== -->
		<div class="container-fluid text-bg-dark">
			<div class="row mt-5">
				<div class="col-4"></div>
				<div class="col-4 text-center">
					<h2>회원가입</h2> <br>
					<form action="/user/join" method="post">
						<div class="input-group mb-3">
							<span class="input-group-text text-bg-dark" id="basic-addon3">아이디</span>
							<input class="form-control text-bg-secondary" type="text" name="userId" placeholder="아이디를 입력해주세요." required> <br>
				        </div>
						<div class="input-group mb-3">
							<span class="input-group-text text-bg-dark" id="basic-addon3">비밀번호</span>
							<input class="form-control text-bg-secondary" type="password" name="userPw" placeholder="비밀번호를 입력해주세요." required> <br>
				        </div>
						<div class="input-group mb-3">
							<span class="input-group-text text-bg-dark" id="basic-addon3">성함</span>
							<input class="form-control text-bg-secondary" type="text" placeholder="성함을 입력해주세요." name="userName" required> <br>
				        </div>
						<div class="input-group mb-3">
							<span class="input-group-text text-bg-dark" id="basic-addon3">이메일</span>
							<input class="form-control text-bg-secondary" type="email" placeholder="이메일 입력해주세요." name="userEmail"  required> <br>
				        </div>
						<div class="input-group mb-3">
							<span class="input-group-text text-bg-dark" id="basic-addon3">휴대폰 번호</span>
							<input class="form-control text-bg-secondary" type="text" placeholder="휴대폰번호를 입력해주세요." name="userPhone" required> <br>
				        </div>
						<div class="form-group">
							<button class="btn btn-block btn-success" type="submit" id="signup" onclick="joinConfirm();">회원가입</button>
						</div>
					</form>		
				</div>
				<div class="col-4"></div>
			</div>
		</div>	
		<!-- ================================푸터=============================================== -->
		<jsp:include page="../inc/footer.jsp"></jsp:include>
		<!-- ================================푸터=============================================== -->
		<script type="text/javascript">
			function joinConfirm() {
			  if (!confirm("해당 정보로 가입하시겠습니까.")) {
			        // 취소(아니오) 버튼 클릭 시 이벤트
			    } else {
			    	
			    }
			}
		</script>
	</body>
</html>