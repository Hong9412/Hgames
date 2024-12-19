<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>     
<!DOCTYPE html>
	<html class="h-100">
	<head>
		<meta charset="UTF-8">
		<title>문의내역 상세</title>
	</head>
	<body class="d-flex flex-column h-100 text-bg-dark">
<!-- ================================헤더=============================================== -->		
		<%@ include file="../inc/head.jsp" %>						
		<jsp:include page="../inc/header.jsp"></jsp:include>	
<!-- ================================헤더=============================================== -->
<div class="container-fluid text-bg-dark">
	<div class="row">
		<div class="col-3"></div>
		<div class="col-6" style="margin-top: 50px;">
			<div class="input-group mb-3">
				<span class="input-group-text text-bg-dark" id="basic-addon3">문의제목</span>
				<span class="form-control text-bg-secondary" name="questionTitle" id="basic-url" aria-describedby="basic-addon3">${qna.questionTitle }</span>
	        </div>        
			<div class="input-group mb-3" style="margin-top: 20px;">
				<span class="input-group-text text-bg-dark" id="basic-addon3">문의구분</span>
				<span class="form-control text-bg-secondary" name="questionTitle" id="basic-url" aria-describedby="basic-addon3">${qna.questionCategory }</span>
			</div>     
			<div class="input-group mb-3" style="margin-top: 20px;">
				<span class="input-group-text text-bg-dark" id="basic-addon3">작성날짜</span>
				<span class="form-control text-bg-secondary" name="questionTitle" id="basic-url" aria-describedby="basic-addon3">${qna.questionDate }</span>
			</div>     
			<div class="input-group mb-3" style="margin-top: 50px;">
				<span class="input-group-text text-bg-dark" id="basic-addon3">문의내용</span>
				<span class="form-control text-bg-secondary" name="questionTitle" id="basic-url" aria-describedby="basic-addon3" style="height: 350px;">${qna.questionContent }</span>
			</div> 
	        <c:if test="${qna.questionYn ne 'N' }">
			============================================================================= <br>        
				답변날짜 : ${qna.answerDate } <br>
				답변내용 : ${qna.questionAnswer }
	        </c:if>		
			<c:if test="${userId eq 'admin' }">
				<c:if test="${qna.questionAnswer eq null}">
					<div class="justify-content-center">
						<button class="btn btn-success type="button" onclick="answerInquiry(${qna.questionNo});">문의답변</button>
					</div>
				</c:if>
				<c:if test="${qna.questionAnswer ne null}">
					<div class="justify-content-center">
						<button class="btn btn-success type="button" onclick="answerInquiry(${qna.questionNo});">답변수정</button>
					</div>
				</c:if>
			</c:if> 	
		</div>		    
		<div class="col-3"></div>
	</div>
</div>
<!-- ================================푸터=============================================== -->								
		<jsp:include page="../inc/footer.jsp"></jsp:include>	
<!-- ================================푸터=============================================== -->
	<script type="text/javascript">
		function answerInquiry(questionNo) {
			location.href ="/admin/answerInquiry?questionNo=" + questionNo;
		}
	</script>			
	</body>
</html>