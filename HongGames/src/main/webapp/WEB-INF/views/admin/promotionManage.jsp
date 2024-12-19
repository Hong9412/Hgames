<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html class="h-100">
	<head>
		<meta charset="UTF-8">
		<title>관리자 프로모션 관리</title>
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
				<h2>프로모션관리<button type="button" class="btn btn-success" onclick="insertPromotion();">프로모션등록</button></h2>
				<table role="grid">
					<thead>
						<tr>	
							<th scope="col">번호</th>
							<th scope="col">제목</th>
							<th scope="col">등록일</th>
							<th scope="col">시작일</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${pList }" var="promotion" varStatus="i">
							<tr>
								<td>${promotion.promotionNo}</td>
								<td>
									${promotion.promotionTitle }
								</td>
								<td>${promotion.startDate }</td>
								<td>${promotion.endDate }</td>
								<td><button type="button" class="btn btn-success"  onclick="promotionDelete(${promotion.promotionNo});">삭제</button></td>
							</tr>			
						</c:forEach>
					</tbody>
					<tfoot>
						<tr align="center">
		 					<td colspan="5" style="text-align: center;">
							</td> 
						</tr>
					</tfoot>
				</table>					
			</div>
		</div>  
<!-- ================================푸터=============================================== -->								
		<jsp:include page="../inc/footer.jsp"></jsp:include>	
<!-- ================================푸터=============================================== -->	
	<script type="text/javascript">
		function insertPromotion() {
			if (!confirm("프로모션을 등록하시겠습니까?")) {
		        // 취소(아니오) 버튼 클릭 시 이벤트
			} else {
				location.href = "/admin/promotionInsert";
			}
		}
		function promotionDelete(promotionNo) {
			if (!confirm("해당 프로모션을 삭제하시겠습니까?")) {
			        // 취소(아니오) 버튼 클릭 시 이벤트
			} else {
				location.href = "/admin/promotionDelete?promotionNo=" + promotionNo;
			}
		}
	</script>
	</body>
</html>