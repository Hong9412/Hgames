<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>      
<!DOCTYPE html>
<html class="h-100">
	<head>
		<meta charset="UTF-8">
		<title>공지사항 작성</title>
	</head>
	<body class="d-flex flex-column h-100 text-bg-dark">
<!-- ================================헤더=============================================== -->		
		<%@ include file="../inc/head.jsp" %>						
		<jsp:include page="../inc/header.jsp"></jsp:include>	
<!-- ================================헤더=============================================== -->
		<div class="container-fluid text-bg-dark">
			<div class="row">
				<div class=col-3></div>
				<div class=col-6>
					<h1>공지사항 등록</h1>
					<form action="/notice/insert" method="post">
						<div class="input-group mb-3">
							<span class="input-group-text text-bg-dark" id="basic-addon3">제목</span>
							<input type="text" class="form-control text-bg-secondary" name="noticeName" id="basic-url" aria-describedby="basic-addon3" required>
				        </div>
						<div class="input-group">
							<span class="input-group-text text-bg-dark">내용</span>
							<textarea class="form-control text-bg-secondary" name="noticeContent"  aria-label="With textarea" style="height: 144px;" required></textarea>
				        </div> <br>
						<input type="submit" class="btn btn-success" value="공지등록">
					</form>		
				</div>
				<div class=col-3></div>
			</div>
		</div>	
<!-- ================================푸터=============================================== -->								
		<jsp:include page="../inc/footer.jsp"></jsp:include>	
<!-- ================================푸터=============================================== -->			
	</body>
</html>