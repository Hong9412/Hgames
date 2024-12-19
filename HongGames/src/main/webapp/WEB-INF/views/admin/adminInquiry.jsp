<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>      
<!DOCTYPE html>
<html class="h-100">
	<head>
		<meta charset="UTF-8">
		<title>문의관리</title>
		<style type="text/css">
			table {
				text-align: center;
			}
			.name > tr{
				font-size: 23px;
			}
		</style>
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
				<h2>문의관리</h2>
				<table role="grid">
					<thead class="name">
						<tr>	
							<th scope="col">작성자</th>
							<th scope="col">문의구분</th>
							<th scope="col">제목</th>
							<th scope="col">작성날짜</th>
							<th scope="col">답변날짜</th>
							<th scope="col">상태</th>
							<th scope="col">삭제</th>
						</tr>
					</thead>
					<tbody class="content">
						<c:forEach items="${qList }" var="qna" varStatus="i">
							<tr>
								<td>${qna.userId }</td>
								<td class="link-success">${qna.questionCategory }</td>
								<td><a href="/user/InquiryDetail?questionNo=${qna.questionNo }" class="nav-link link-white">${qna.questionTitle }</a></td>
								<td class="link-success">${qna.questionDate }</td>
							<c:if test="${qna.answerDate eq null }">
								<td>X</td>
							</c:if>
							<c:if test="${qna.answerDate ne null }">
								<td>${qna.answerDate }</td>
							</c:if>								
							<c:if test="${qna.questionYn eq 'Y' }">
								<td>Y</td>
							</c:if>
							<c:if test="${qna.questionYn eq 'N' }">
								<td>N</td>
							</c:if>
							<td><button type="button" class="btn btn-success"  onclick="deleteInquiry(${qna.questionNo});">삭제</button></td>						
							</tr>			
						</c:forEach>
					</tbody>
					<tfoot>
						<tr align="center">
		 					<td colspan="3" style="text-align: center;">
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
		function deleteInquiry(questionNo) {
		    if (!confirm("해당 문의를 삭제하시겠습니까?")) {
		        // 취소(아니오) 버튼 클릭 시 이벤트
		    } else {
				location.href = "/notice/deleteInqury?questionNo=" + questionNo;
		    }
		}
	</script>	
	</body>
</html>