<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>     
<!DOCTYPE html>
<html class="h-100">
	<head>
		<meta charset="UTF-8">
		<title>홍게임즈공지사항</title>	
	<body class="d-flex flex-column h-100 text-bg-dark">
<!-- ================================헤더=============================================== -->		
		<%@ include file="../inc/head.jsp" %>						
		<jsp:include page="../inc/header.jsp"></jsp:include>	
<!-- ================================헤더=============================================== -->
<div class="container-fluid text-bg-dark flex-shrink-0" style="margin-top: 70px;">
	<div class="row">
		<div class="col-2"></div>
		<div class="col-8">
			<div class="container-fluid text-bg-dark">
				<div class="row mb-3">
					<div class="col-md-2 themed-grid-col text-center"><h3>공지번호</h3></div>
					<div class="col-md-7 themed-grid-col text-center"><h3>제목</h3></div>
					<div class="col-md-3 themed-grid-col text-center"><h3>작성날짜</h3></div>
				</div>
				<c:forEach items="${nList }" var="notice" varStatus="i">
				<div class="row mb-3">
					<div class="col-md-2 themed-grid-col text-center link-success">${notice.noticeNo }</div>
					<div class="col-md-7 themed-grid-col"><a href="/notice/detail?noticeNo=${notice.noticeNo }" class="nav-link link-white">${notice.noticeName }</a></div>
					<div class="col-md-3 themed-grid-col text-center link-success">${notice.noticeDate }</div>
				</div>
				</c:forEach>
<%-- 				<c:forEach begin="${pi.startNavi}" end="${pi.endNavi }" var="p">
				<a href="#">${p}</a>
				</c:forEach> --%>			
			</div>
		</div>
		<div class="col-2"></div>
	</div>
</div>
<!-- ================================푸터=============================================== -->								
		<jsp:include page="../inc/footer.jsp"></jsp:include>	
<!-- ================================푸터=============================================== -->			
	</body>
</html>