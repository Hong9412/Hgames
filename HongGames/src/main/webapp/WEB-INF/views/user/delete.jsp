<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html class="h-100">
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
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
			<c:if test="${userPw ne null }">	
				<li><a href="/user/myPage" class="nav-link link-success">회원정보</a></li>
			</c:if>
				<li><a href="/user/pay" class="nav-link link-success">결제내역</a></li>
				<li><a href="/user/myInquiry" class="nav-link link-success">문의내역</a></li>
			<c:if test="${userPw ne null }">				
				<li><a href="/user/delete" class="nav-link link-success">탈퇴하기</a></li>
			</c:if>
			</ul>
			<hr>
			</div>
			<div class="col-md-8 d-flex flex-column flex-shrink-0 p-3">
			  	<h2>회원탈퇴</h2>
			  	<form action="/user/delete" method="get">
					<span>회원탈퇴 전, 아래의 내용을 다시 한번 확인 후 신중하게 진행해주시기 바랍니다.</span> <br>
                    <span>- 회원탈퇴 즉시 소유한 모든 포인트는 삭제 처리되며, 복구가 불가합니다.</span> <br>
                    <span>- 회원탈퇴 즉시 회원정보가 삭제되며, 주문내역과 제공 콘텐츠 정보 제공이 불가합니다.</span> <br>
					<button type="button" onclick="userDelete('${userId}');" class="btn btn-danger">탈퇴하기</button>
			  	</form>
			</div>
		</div>  
<!-- ================================푸터=============================================== -->								
		<jsp:include page="../inc/footer.jsp"></jsp:include>	
<!-- ================================푸터=============================================== -->	
		<script type="text/javascript">
			function userDelete(userId) {
			  if (!confirm("정말로 회원탈퇴를 하시겠습니까?")) {
			        // 취소(아니오) 버튼 클릭 시 이벤트
			  } else {
				  location.href ="/user/userDelete?userId=" + userId;				  
			  }
			}
		</script>	
	</body>
</html>