<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>      
<!DOCTYPE html>
<html class="h-100">
	<head>
		<meta charset="UTF-8">
		<title>홍게임즈마이페이지</title>
	</head>
	<body class="d-flex flex-column h-100 text-bg-dark">
<!-- ================================헤더=============================================== -->		
		<%@ include file="../inc/head.jsp" %>						
		<jsp:include page="../inc/header.jsp"></jsp:include>	
<!-- ================================헤더=============================================== -->
		<div class="row justify-content-center text-bg-dark">
			<div class="col-md-4 d-flex flex-column flex-shrink-0 p-3" style="width: 280px;">
			<hr>
			<ul class="nav nav-pills flex-column mb-auto">
				<li><a href="/user/myPage" class="nav-link link-success">회원정보</a></li>
				<li><a href="/user/pay" class="nav-link link-success">결제내역</a></li>
				<li><a href="/user/myInquiry" class="nav-link link-success">문의내역</a></li>
			<c:if test="${userPw ne null }">				
				<li><a href="/user/delete" class="nav-link link-success">탈퇴하기</a></li>
			</c:if>
			</ul>
			<hr>
			</div>
			<div class="col-md-8 d-flex flex-column flex-shrink-0 p-3">
				<c:if test="${userPw ne null }">
					<div style="width: 800px;">
						<h2>회원정보<button type="button" class="btn btn-success" onclick="userModify()">정보수정</button></h2>
						<div class="input-group mb-3">
							<span class="input-group-text text-bg-dark" id="basic-addon3">유저 아이디</span>
							<span class="form-control text-bg-secondary" name="questionTitle" id="basic-url" aria-describedby="basic-addon3">${user.userId }</span>
				        </div>        
						<div class="input-group mb-3">
							<span class="input-group-text text-bg-dark" id="basic-addon3">이름</span>
							<span class="form-control text-bg-secondary" name="questionTitle" id="basic-url" aria-describedby="basic-addon3">${user.userName }</span>
						</div>     
						<div class="input-group mb-3">
							<span class="input-group-text text-bg-dark" id="basic-addon3">휴대폰번호</span>
							<span class="form-control text-bg-secondary" name="questionTitle" id="basic-url" aria-describedby="basic-addon3">${user.userPhone }</span>
						</div>     
						<div class="input-group mb-3">
							<span class="input-group-text text-bg-dark" id="basic-addon3">이메일</span>
							<span class="form-control text-bg-secondary" name="questionTitle" id="basic-url" aria-describedby="basic-addon3">${user.userEmail }</span>
						</div> 
					</div>	
				</c:if>
				<c:if test="${userPw eq null }">
					<div style="width: 800px;">
						<h2>회원정보</h2>
						<h2>카카오 로그인 계정입니다.</h2>       
					</div>	
				</c:if>
			</div>
		</div>  
<!-- ================================푸터=============================================== -->								
		<jsp:include page="../inc/footer.jsp"></jsp:include>	
<!-- ================================푸터=============================================== -->
		<script type="text/javascript">
			function userModify() {
				location.href ="/user/modify";		
			}
		</script>	
	</body>
</html>