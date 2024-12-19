<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html class="h-100">
	<head>
		<meta charset="UTF-8">
		<title>결제 내역</title>
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
				<h2>결제내역</h2>
					<table role="grid">
						<thead>
							<tr>	
								<th scope="col">결제번호</th>
								<th scope="col">구매자</th>
								<th scope="col">상품명</th>
								<th scope="col">결제수단</th>
								<th scope="col">결제금액</th>
								<th scope="col">주문일자</th>
								<th scope="col">게임코드</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${pList }" var="pList" varStatus="i">
								<tr>
									<td>${pList.payNo }</td>
									<td>${pList.userId }</td>
									<td>${pList.gameTitle }</td>
									<td>${pList.howPay }</td>
									<td>${pList.gamePrice }</td>
									<td>${pList.priceDate }</td>
									<td class="link-success">${pList.gameKey }</td>
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
	</body>
</html>