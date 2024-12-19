<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
	<html class="h-100">
	<head>
		<meta charset="UTF-8">
		<title>회원정보수정</title>
	</head>
	<body class="d-flex flex-column h-100 text-bg-dark">
<!-- ================================헤더=============================================== -->		
		<%@ include file="../inc/head.jsp" %>						
		<jsp:include page="../inc/header.jsp"></jsp:include>	
<!-- ================================헤더=============================================== -->
		<div class="row justify-content-center text-bg-dark">
			<div class="col-md-4 d-flex flex-column flex-shrink-0 p-3 text-center" style="width: 280px;">
				<hr>
				<ul class="nav nav-pills flex-column mb-auto">
					<li><a href="/admin/management" class="nav-link link-light">회원관리</a></li>
					<li><a href="/admin/gameManage" class="nav-link link-light">게임관리</a></li>
					<li><a href="/admin/promotionManage" class="nav-link link-light">프로모션관리</a></li>
					<li><a href="/admin/adminInquiry" class="nav-link link-light">문의관리</a></li>
					<li><a href="/admin/notice" class="nav-link link-light">공지관리</a></li>
				</ul>
				<hr>
			</div>
				<div class="col-md-8 d-flex flex-column flex-shrink-0 p-3">
			<form action="/admin/userModify" method="post">
				<h2>정보수정</h2>
					<input type= "hidden" name="userId" value="${user.userId}">		
					<div class="input-group mb-3">
						<span class="input-group-text text-bg-dark" id="basic-addon3">아이디</span>
						<span class="form-control text-bg-secondary" name=" id="basic-url" aria-describedby="basic-addon3">${user.userId }</span>
			        </div>
					<div class="input-group mb-3">
						<span class="input-group-text text-bg-dark" id="basic-addon3">비밀번호</span>
						<input type="password" class="form-control text-bg-white"  name="userPw" value="${user.userPw }"> <br>
			        </div>
					<div class="input-group mb-3">
						<span class="input-group-text text-bg-dark" id="basic-addon3">이름</span>
						<input type="text" class="form-control text-bg-white" name="userName" value="${user.userName }"> <br>
			        </div>
			        <div class="input-group mb-3">
						<span class="input-group-text text-bg-dark" id="basic-addon3">휴대폰번호</span>
						<span class="form-control text-bg-secondary" name="" id="basic-url" aria-describedby="basic-addon3">${user.userPhone }</span>
			        </div>
					<div class="input-group mb-3">
						<span class="input-group-text text-bg-dark" id="basic-addon3">유저 이메일</span>
						<input type="email" class="form-control text-bg-white" name="userEmail" value="${user.userEmail }"><br>
			        </div>			        
				<input type="submit" class="btn btn-primary" onclick="userModify()" value="수정하기">
			</form>
				</div>
		</div>  
<!-- ================================푸터=============================================== -->								
		<jsp:include page="../inc/footer.jsp"></jsp:include>	
<!-- ================================푸터=============================================== -->
		<script type="text/javascript">
			function userModify() {
			    if (!confirm("해당 정보로 수정하시겠습니까?")) {
			        // 취소(아니오) 버튼 클릭 시 이벤트
			    } else {
			    }				
			}
		</script>		
	</body>
</html>