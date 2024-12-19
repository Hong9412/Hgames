<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html class="h-100">
	<head>
		<meta charset="UTF-8">
		<title>공지관리</title>
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
				<h2>공지관리<button type="button" class="btn btn-success"  onclick="insertNotice()">공지등록</button></h2>
				<table role="grid">
					<thead>
						<tr>	
							<th scope="col">번호</th>
							<th scope="col">제목</th>
							<th scope="col">작성날짜</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${nList }" var="notice" varStatus="i">
							<tr>
								<td class="link-success">${notice.noticeNo}</td>
								<td>
									<a href="/notice/detail?noticeNo=${notice.noticeNo }" class="nav-link link-white">${notice.noticeName }</a>
								</td>
								<td class="link-success">${notice.noticeDate }</td>
								<td><button type="button" class="btn btn-success"  onclick="modifyNotice(${notice.noticeNo})">수정</button><td>
								<td><button type="button" class="btn btn-success"  onclick="deleteNotice(${notice.noticeNo});">삭제</button></td>
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
	<script>
		function insertNotice() {
			location.href = "/notice/insert";
		}
		function deleteNotice(noticeNo) {
		    if (!confirm("해당 공지사항을 삭제하시겠습니까?")) {
		        // 취소(아니오) 버튼 클릭 시 이벤트
		    } else {
		        location.href = "/notice/delete?noticeNo=" + noticeNo;
		    }
		}
		function modifyNotice(noticeNo) {
		    if (!confirm("해당 공지사항을 수정하시겠습니까?")) {
		        // 취소(아니오) 버튼 클릭 시 이벤트
		    } else {
		        location.href = "/notice/modify?noticeNo=" + noticeNo;
		    }
		}	
	</script>
	</body>
</html>