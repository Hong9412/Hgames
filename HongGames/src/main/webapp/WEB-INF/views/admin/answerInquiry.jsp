<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="h-100">
	<head>
		<meta charset="UTF-8">
		<title>관리자 문의답변</title>
	</head>
	<body class="d-flex flex-column h-100 text-bg-dark">
<!-- ================================헤더=============================================== -->		
		<%@ include file="../inc/head.jsp" %>						
		<jsp:include page="../inc/header.jsp"></jsp:include>	
<!-- ================================헤더=============================================== -->	
<div class="container text-bg-dark">
	<div class="row">
		<div class=col-2></div>
		<div class=col-8>
			<div class="input-group mb-3" style="margin-top: 40px;">
				<span class="input-group-text text-bg-dark" id="basic-addon3">문의제목</span>
				<span class="form-control text-bg-secondary" name="questionTitle" id="basic-url" aria-describedby="basic-addon3">${qna.questionTitle }</span>
	        </div>        
			<div class="input-group mb-3">
				<span class="input-group-text text-bg-dark" id="basic-addon3">문의구분</span>
				<span class="form-control text-bg-secondary" name="questionTitle" id="basic-url" aria-describedby="basic-addon3">${qna.questionCategory }</span>
			</div>     
			<div class="input-group mb-3">
				<span class="input-group-text text-bg-dark" id="basic-addon3">작성날짜</span>
				<span class="form-control text-bg-secondary" name="questionTitle" id="basic-url" aria-describedby="basic-addon3">${qna.questionDate }</span>
			</div>     
			<div class="input-group mb-3">
				<span class="input-group-text text-bg-dark" id="basic-addon3">문의내용</span>
				<span class="form-control text-bg-secondary" name="questionTitle" id="basic-url" aria-describedby="basic-addon3" style="height: 350px;">${qna.questionContent }</span>
			</div> 
			============================================================================ <br> 
			<div>
				<form action="/admin/answerInsert" method="post">
					<input type="hidden" name="questionNo" value="${qna.questionNo }">
					<div class="input-group">
						<span class="input-group-text text-bg-dark">답변내용</span>
						<textarea class="form-control text-bg-secondary" name="questionAnswer"  aria-label="With textarea" style="height: 200px;" required></textarea>
			        </div> <br>
					<button type="submit" class="btn btn-success onclick="answerInsert();">답변등록</button>
				</form>
			</div>			
		</div>	
		<div class=col-2></div>
	</div>
</div>
<!-- ================================푸터=============================================== -->								
		<jsp:include page="../inc/footer.jsp"></jsp:include>	
<!-- ================================푸터=============================================== -->
	<script type="text/javascript">
		function answerInsert() {
			  if (!confirm("답변을 작성하시겠습니까?")) {
			        // 취소(아니오) 버튼 클릭 시 이벤트
			    } else {
			    	alert("답변이 등록되었습니다.");
			    }
			}		
	</script>			
	</body>
</html>