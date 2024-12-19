<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>     
<!DOCTYPE html>
<html class="h-100">
	<head>
		<meta charset="UTF-8">
		<title>마이페이지</title>
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
				<h2>문의내역<button type="button" class="btn btn-success" onclick="userInquiry(`${userId}`);">문의하기</button></h2>
				<table role="grid">
					<thead>
						<tr>	
							<th scope="col">문의구분</th>
							<th scope="col">제목</th>
							<th scope="col">작성날짜</th>
							<th scope="col">상태</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${qList }" var="qna" varStatus="i">
							<tr>
								<td class="link-success">${qna.questionCategory }</td>
								<td><a href="/user/InquiryDetail?questionNo=${qna.questionNo }" class="nav-link link-white">${qna.questionTitle }</a></td>
								<td class="link-success">${qna.questionDate }</td>
							<c:if test="${qna.questionYn eq 'Y' }">
								<td><a href="/user/InquiryDetail?questionNo=${qna.questionNo }" class="nav-link link-white">답변확인</a></td>
							</c:if>
							<c:if test="${qna.questionYn eq 'N' }">
								<td>답변대기</td>
							</c:if>
							</tr>			
						</c:forEach>
					</tbody>
					<tfoot>
						<tr align="center">
		 					<td colspan="3" style="text-align: center;"></td> 
						</tr>
					</tfoot>
				</table>
			</div>
		</div>  
<!-- ================================푸터=============================================== -->								
		<jsp:include page="../inc/footer.jsp"></jsp:include>	
<!-- ================================푸터=============================================== -->
	<script type="text/javascript">
		function userInquiry(userId) {
			if(userId != "") {
				location.href = "/user/inquiry";			
			}else {
				alert("로그인 필요스~");
				location.href = "/user/login";			
			}
		}
	</script>		
	</body>
</html>