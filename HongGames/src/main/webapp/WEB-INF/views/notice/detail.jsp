<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>      
<!DOCTYPE html>
	<html class="h-100">
	<head>
		<meta charset="UTF-8">
		<title>공지사항 상세</title>					
	</head>
	<body class="d-flex flex-column h-100 text-bg-dark">
<!-- ================================헤더=============================================== -->		
		<%@ include file="../inc/head.jsp" %>						
		<jsp:include page="../inc/header.jsp"></jsp:include>	
<!-- ================================헤더=============================================== -->
		<div class="container-fluid text-bg-dark mt-5">
			<div class="row">
				<div class="col-3"></div>
				<div class="col-6 justify-content-center">
					<h3 class="pb-4 mb-4 fst-italic border-bottom">${notice.noticeName }</h3>
					<figcaption class="figure-caption text-bg-dark">
						<h5>공지번호 : ${notice.noticeNo }
						작성날짜 : ${notice.noticeDate }</h5>
					</figcaption>
					<div class="input-group mt-5">
						${notice.noticeContent }
					</div>
				</div>
				<div class="col-3"></div>
			</div>
		</div>	
<!-- ================================푸터=============================================== -->								
		<jsp:include page="../inc/footer.jsp"></jsp:include>	
<!-- ================================푸터=============================================== -->			
	</body>
</html>