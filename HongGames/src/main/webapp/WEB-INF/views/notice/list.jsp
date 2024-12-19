<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html class="h-100">
	<head>
		<meta charset="UTF-8">
		<title>관리자공지사항리스트</title>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@picocss/pico@2/css/pico.min.css"/>		
	</head>
	<body class="d-flex flex-column h-100 text-bg-dark">
		<h1>공지사항 관리</h1>
		<table role="grid">
			<thead>
				<tr>	
					<th scope="col">번호</th>
					<th scope="col">제목</th>
					<th scope="col">작성날짜</th>
					<th scope="col"><button type="button" onclick="insertNotice();">등록</button></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${nList }" var="notice" varStatus="i">
					<tr>
						<td>${i.count }</td>
						<td>
							<a href="/notice/detail?noticeNo=${notice.noticeNo }">${notice.noticeName }</a>
						</td>
						<td>${notice.noticeDate }</td>
						<td><button type="button" onclick="modifyNotice(${notice.noticeNo})">수정</button><td>
						<td><button type="button" onclick="deleteNotice(${notice.noticeNo});">삭제</button></td>
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
		<script type="text/javascript">
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