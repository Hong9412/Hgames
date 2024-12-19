<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>      
<!DOCTYPE html>
<html class="h-100">
	<head>
		<meta charset="UTF-8">
		<title>홍게임즈문의하기</title>
		<link rel="stylesheet" href="/resources/css/inquiry.css">			
	</head>
	<body class="d-flex flex-column h-100 text-bg-dark">
<!-- ================================헤더=============================================== -->		
		<%@ include file="../inc/head.jsp" %>						
		<%@include file="../inc/header.jsp" %>
<!-- ================================헤더=============================================== -->
		<div class="container-fluid text-bg-dark">
			<div class="row">
				<div class="col-2"></div>
				<div class="col-8">
					<h2 id="inquiryTitle">문의하기</h2>
				<form action="/user/inquiry" method="post">
					<input type="hidden" name="userId" value="${userId }">
					<div class="input-group mb-3">
						<span class="input-group-text text-bg-secondary" id="basic-addon3">문의제목</span>
						<input type="text" class="form-control text-bg-secondary" name="questionTitle" id="basic-url" aria-describedby="basic-addon3" required>
			        </div>
					<div class="col-md-5">
						<label for="country" class="form-label">문의구분</label>
						<select class="form-select text-bg-secondary" name="questionCategory" id="country" required>
							<option value="게임설치,플레이">게임 설치, 플레이</option>
							<option value="주문,결제">주문, 결제</option>
							<option value="제품코드(키)오류">제품 코드(키) 오류</option>
							<option value="한글,제공콘텐츠">한글, 제공 콘텐츠</option>
							<option value="계정,회원,인증">계정, 회원, 인증</option>
							<option value="취소,환불">취소, 환불</option>
							<option value="기타">기타</option>
						</select>
		            </div> <br>
					<div class="input-group">
						<span class="input-group-text text-bg-secondary">문의내용</span>
						<textarea class="form-control text-bg-secondary" name="questionContent"  aria-label="With textarea" style="height: 300px;" required></textarea>
			        </div> <br>
			        <div class="justify-content-center">
						<button class="btn btn-success" type="submit" onclick="insertConfirm();">문의하기</button>
			        </div>
				</form>	
				</div>
				<div class="col-2"></div>		
			</div>							
		</div>
<!-- ================================푸터=============================================== -->								
		<jsp:include page="../inc/footer.jsp"></jsp:include>	
<!-- ================================푸터=============================================== -->		
		<script type="text/javascript">
			function insertConfirm() {
			  if (!confirm("문의를 등록하시겠습니까?")) {
			        // 취소(아니오)
			    } else {
			    	
			    }
			}
		</script>				
	</body>
</html>