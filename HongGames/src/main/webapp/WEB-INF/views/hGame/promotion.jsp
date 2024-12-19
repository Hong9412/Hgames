<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>      
<!DOCTYPE html>
<html class="h-100">
	<head>
		<meta charset="UTF-8">
		<title>홍게임즈프로모션</title>
		<style type="text/css">
			.gameItem:hover {
			    transform: scale(1.05);
			    transition: transform 0.3s ease;
			}
		</style>					
	</head>
	<body class="d-flex flex-column h-100 text-bg-dark">
<!-- ================================헤더=============================================== -->		
		<%@ include file="../inc/head.jsp" %>						
		<jsp:include page="../inc/header.jsp"></jsp:include>	
<!-- ================================헤더=============================================== -->
		<div class="container-fluid text-bg-dark">
			<div class="row">
				<div class="col-1"></div>
				<div class="col-10">
					<c:forEach items="${pList }" var="promotion" varStatus="i">
						<div class="p-4 p-md-5 mb-4 mt-5 rounded text-body-emphasis text-bg-secondary">
							<div class="col-lg-6 px-0">
								<h1 class="display-5 fst-italic">${promotion.promotionTitle }</h1>
								<p class="lead my-2">${promotion.startDate } ~ ${promotion.endDate }</p>
								<p class="lead my-3">${promotion.promotionContent }</p>
							</div>
						</div>			
					    <div id="gameList" style="display: flex; flex-wrap: wrap; justify-content:flex-flow; column-gap: 20px; row-gap: 20px;">
					        <c:forEach items="${gList}" var="game" varStatus="j">
						        <a href="/hGame/detail?gameNo=${game.gameNo }" style="text-decoration:none; color:inherit;">
						            <c:if test="${game.promotionNo == promotion.promotionNo}">
						                <div style="margin-bottom: 10px; border: 1px solid gray; width: 315px;" class="gameItem">
						                    <div>
						                        <img src="../../resources/gameTitleImgs/${tList[j.index].imageRename}" alt="타이틀이미지" style="width: 315px; height: 220px;">
						                        <br>${game.gameTitle} <br>
						                        <span class="badge rounded-pill bg-secondary">${game.gameJenre}</span>              
						                        <span class="badge rounded-pill bg-secondary">${game.gamePlatform}</span> <br><br>
						                        <c:if test="${game.gameSale ne 0}">
						                            금액 : <s>${game.gamePrice}원</s> <br>
						                            할인가 : <c:out value="${Math.round(game.gamePrice * (100 - game.gameSale) / 100)}원"/>
						                        </c:if>
						                        <c:if test="${game.gameSale eq 0}">
						                            금액 : ${game.gamePrice}원
						                        </c:if>
						                        <c:if test="${game.gameSale ne 0}">
						                            <span class="badge bg-danger">${game.gameSale}%</span>
						                        </c:if>
						                    </div>
						                </div>
						            </c:if>
						        </a>
					        </c:forEach>
					    </div>
					</c:forEach>
				</div>
				<div class="col-1"></div>
			</div>
		</div>
<!-- ================================푸터=============================================== -->								
		<jsp:include page="../inc/footer.jsp"></jsp:include>	
<!-- ================================푸터=============================================== -->	
	</body>
</html>