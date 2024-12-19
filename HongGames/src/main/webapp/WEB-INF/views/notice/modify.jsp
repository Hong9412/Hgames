<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>      
<!DOCTYPE html>
<html class="h-100">
	<head>
		<meta charset="UTF-8">
		<title>공지사항 수정</title>	
	</head>
	<body class="d-flex flex-column h-100 text-bg-dark">
<!-- ================================헤더=============================================== -->		
		<%@ include file="../inc/head.jsp" %>						
		<jsp:include page="../inc/header.jsp"></jsp:include>	
<!-- ================================헤더=============================================== -->
		<div class="container">
			<div class="row">
				<div class="col-3"></div>
				<div class="col-6">
					<h1>공지사항 수정</h1>
					<form action="/notice/update" method="post">
							<div class="input-group mb-3">
								<span class="input-group-text text-bg-dark" id="basic-addon3">제목</span>
								<input type="text" class="form-control text-bg-secondary" name="noticeName" value="${notice.noticeName}" required>
					        </div>
							<div class="input-group">
								<span class="input-group-text text-bg-dark">내용</span>
								<textarea rows="5" cols="50" class="form-control text-bg-secondary" name="noticeContent">${notice.noticeContent}</textarea>
					        </div> <br>
						<input type="hidden" name="noticeNo" value="${notice.noticeNo}">

						<input type="submit" value="등록" onclick="modifyNotice()">
					</form>
				</div>
				<div class="col-3"></div>
			</div>
		</div>	
<!-- ================================푸터=============================================== -->								
		<jsp:include page="../inc/footer.jsp"></jsp:include>	
<!-- ================================푸터=============================================== -->
	<script type="text/javascript">
		function modifyNotice() {
		  if (!confirm("내용을 수정하시겠습니까? : ) ")) {
		        // 취소(아니오)
		    } else {
		    	alert("공지 수정스 완뇨~ :)");
		    }
		}				
	</script>
	</body>
</html>