<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>      
<!DOCTYPE html>
<html class="h-100">
	<head>
		<meta charset="UTF-8">
		<title>게임관리</title>
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
				<h2>게임관리<button type="button" class="btn btn-success"  onclick="insertGame();">게임등록</button></h2>
				<table role="grid">
					<thead>
						<tr>
							<th scope="col">게임번호</th>
							<th scope="col">타이틀사진</th>
							<th scope="col">게임제목</th>
							<th scope="col">플랫폼</th>
							<th scope="col">장르</th>
							<th scope="col">출시일</th>
							<th scope="col">가격</th>
							<th scope="col">할인률</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${gList}" var="game" varStatus="i">
							    <tr>
							        <td>${game.gameNo}</td>
							        <td><img src="../../resources/gameTitleImgs/${tList[i.index].imageRename}" alt="타이틀이미지" style="width: 100px; height: 100px;"></td>
							        <td>${game.gameTitle}</td>
							        <td>${game.gamePlatform}</td>
							        <td>${game.gameJenre}</td>
							        <td>${game.gameDate}</td>
							        <td>${game.gamePrice}</td>
							        <td>${game.gameSale}%</td>
							        <td><button type="button" class="btn btn-success"  onclick="gameDelete(${game.gameNo});">삭제</button></td>
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
			function insertGame() {
				location.href = "/game/insert"
			}
			function gameDelete(gameNo) {
			    if (!confirm("해당 게임을 삭제하시겠습니까?")) {
			        // 취소(아니오) 버튼 클릭 시 이벤트
			    } else {
					location.href = "/game/delete?gameNo=" + gameNo;
					alert("삭제가 완료되었습니다. :)");
			    }	
			}
		</script>				
	</body>
</html>