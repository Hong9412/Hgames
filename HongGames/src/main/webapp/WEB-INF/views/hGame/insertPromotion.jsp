<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>     
<!DOCTYPE html>
	<html class="h-100">
	<head>
		<meta charset="UTF-8">
		<title>프로모션 등록</title>
	</head>
		<style type="text/css">
			table {
				border: 1px solid pink;
			}
			
			thead > tr > th {
				border: 1px solid pink;
			}
			tr > tb {
				border: 1px solid pink;
			}
		</style>
	<body class="d-flex flex-column h-100 text-bg-dark">
<!-- ================================헤더=============================================== -->		
		<%@ include file="../inc/head.jsp" %>						
		<jsp:include page="../inc/header.jsp"></jsp:include>	
<!-- ================================헤더=============================================== -->
		<div class="container-fluid text-bg-dark">
			<div class="row">
				<div class="col-3"></div>
				<div class="col-6">
					<div style="text-align: center;">
						<h1>프로모션 등록</h1>
						<form action="/admin/promotionInsert" method="post">
							<div class="input-group mb-3">
								<span class="input-group-text text-bg-dark" id="basic-addon3">제목</span>
								<input type="text" class="form-control text-bg-secondary" name="promotionTitle" id="basic-url" aria-describedby="basic-addon3" placeholder="프로모션 제목을 입력해주세요~" required>
					        </div>
							<div class="input-group mb-3">
								<span class="input-group-text text-bg-dark" id="basic-addon3">시작일</span>
								<input type="date" class="form-control text-bg-secondary" name="startDate" required>
								<span class="input-group-text text-bg-dark" id="basic-addon3">마감일</span>
								<input type="date" class="form-control text-bg-secondary" name="endDate" required>
					        </div>
							<div class="input-group">
								<span class="input-group-text text-bg-dark">프로모션소개</span>
								<textarea class="form-control text-bg-secondary" name="promotionContent"  aria-label="With textarea" style="height: 144px;" required></textarea>
					        </div> <br>
							<div>
								<h2>게임리스트</h2>		        
						        <table role="grid" style="width: 100%;">
									<thead>
										<tr>
											<th scope="col">등록여부</th>
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
									    	<c:if test="${game.gameSale eq '0'}" >
									        	<td><input type="checkbox" name="gameNo_${game.gameNo}" value="${game.gameNo}"></td>
									        </c:if>
									    	<c:if test="${game.gameSale ne '0'}" >
									        	<td>진행중</td>
									        </c:if>
									        <td>${game.gameNo}</td>
									        <td><img src="../../resources/gameTitleImgs/${tList[i.index].imageRename}" alt="타이틀이미지" style="width: 100px; height: 100px;"></td>
									        <td>${game.gameTitle}</td>
									        <td>${game.gamePlatform}</td>
									        <td>${game.gameJenre}</td>
									        <td>${game.gameDate}</td>
									        <td>${game.gamePrice}</td>
									        <c:if test="${game.gameSale eq '0'}" >
									        	<td><input type="text" name="gameSale_${game.gameNo}" class="form-control text-bg-secondary" placeholder="할인률 :)" style="width: 100px;"></td>
									        </c:if>
									        <c:if test="${game.gameSale ne '0'}" >
									        	<td>${game.gameSale}</td>
									        </c:if>
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
							<input type="submit" class="btn btn-success" value="프로모션 등록">
						</form>
					</div>
				</div>
				<div class="col-3"></div>
			</div>
		</div>
<!-- ================================푸터=============================================== -->								
		<jsp:include page="../inc/footer.jsp"></jsp:include>	
<!-- ================================푸터=============================================== -->
	</body>
</html>