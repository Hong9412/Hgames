<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>       
<!DOCTYPE html>
<html class="h-100">
	<head>
		<meta charset="UTF-8">
		<title>관리자 페이지</title>
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
				<h2>회원관리</h2>
				<table role="grid">
					<thead>
						<tr>	
							<th scope="col">유저 아이디</th>
							<th scope="col">비밀번호</th>
							<th scope="col">이름</th>
							<th scope="col">휴대폰번호</th>
							<th scope="col">이메일</th>
							<th scope="col">수정</th>
							<th scope="col">삭제</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${uList }" var="user" varStatus="i">
							<tr>
								<td>${user.userId }</td>
								<td>${user.userPw }</td>
								<td>${user.userName }</td>
								<td>${user.userPhone }</td>
								<td>${user.userEmail }</td>
								<td><button type="button" class="btn btn-success"  onclick="userModify(`${user.userId}`)">수정</button></td>
								<td><button type="button" class="btn btn-success" onclick="userDelete(`${user.userId}`)">삭제</button></td>
							</tr>			
						</c:forEach>
					</tbody>
					<tfoot>
						<tr align="center">
		 					<td colspan="6" style="text-align: center;">
							</td> 
						</tr>
					</tfoot>
				</table>				
			</div>
		</div>  
<!-- ================================푸터=============================================== -->								
		<jsp:include page="../inc/footer.jsp"></jsp:include>	
<!-- ================================푸터=============================================== -->		
	</body>
	<script>
		function userDelete(userId) {
		    if (!confirm("해당 유저 정보를 삭제하시겠습니까?")) {
		        // 취소(아니오) 버튼 클릭 시 이벤트
		    } else {
		        location.href = "/admin/delete?userId=" + userId;
		    }
		}
		function userModify(userId) {
		    if (!confirm("해당 유저 정보를 수정하시겠습니까?")) {
		        // 취소(아니오) 버튼 클릭 시 이벤트
		    } else {
		        location.href = "/admin/userModify?userId=" + userId;
		    }
		}
	</script>
</html>