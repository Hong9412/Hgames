<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>      
<!DOCTYPE html>
<html class="h-100">
	<head>
		<meta charset="UTF-8">
		<title>홍게임즈게임옵션</title>
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
		<div class="col-12 mt-5 mb-5">
			<div style="text-align: center;">
			    <div style="margin-bottom: 10px;">
			        <button type="button" class="btn btn-secondary"  name="gameJenre" onclick="allGame();">전체</button>
			        <button type="button" class="btn btn-secondary"  name="gameJenre" onclick="searchJenre('액션');">액션</button>
			        <button type="button" class="btn btn-secondary"  name="gameJenre" onclick="searchJenre('롤플레잉');">롤플레잉</button>
			        <button type="button" class="btn btn-secondary"  name="gameJenre" onclick="searchJenre('스포츠');">스포츠</button>
			        <button type="button" class="btn btn-secondary"  name="gameJenre" onclick="searchJenre('전략/시뮬레이션');">전략/시뮬레이션</button> <br>
			    </div>
			    <div style="margin-bottom: 10px;">
			        <button type="button" class="btn btn-secondary" onclick="searchPlatform('steam');">Steam</button>
			        <button type="button" class="btn btn-secondary" onclick="searchPlatform('Ubisoft Connect');">Ubisoft Connect</button>
			        <button type="button" class="btn btn-secondary" onclick="searchPlatform('Epic games');">Epic games</button>
			        <button type="button" class="btn btn-secondary" onclick="searchPlatform('Rockster Games');">Rockstar Games</button>
			    </div>				
			</div>
			<div id="gameList" style="display: flex; flex-wrap: wrap; justify-content:flex-start; column-gap: 20px; row-gap: 20px;">
			    <!-- 게임 목록 -->
				<c:forEach items="${gList}" var="game" varStatus="i">
				    <a href="/hGame/detail?gameNo=${game.gameNo}" style="text-decoration:none; color:inherit;">
				        <div style="margin-bottom: 10px; border: 1px solid gray; height: 330px;"  class="gameItem">
				            <div>
				                <c:set var="image" value="" />
				                <c:forEach items="${tList}" var="title" varStatus="j">
				                    <c:if test="${game.gameNo == title.gameNo}">
				                        <c:set var="image" value="${title.imageRename}" />
				                    </c:if>
				                </c:forEach>
				                <img src="../../resources/gameTitleImgs/${image}" alt="타이틀이미지" style="width: 300px; height: 200px;">
				                <br>
				                ${game.gameTitle} <br>
				                <span class="badge rounded-pill bg-secondary">${game.gameJenre}</span>                
				                <span class="badge rounded-pill bg-secondary">${game.gamePlatform}</span> <br><br>
				                <c:if test="${game.gameSale ne 0 }">
				                    금액 : <s>${game.gamePrice}원</s> <br>
				                    할인가 : <c:out value="${Math.round(game.gamePrice * (100 - game.gameSale) / 100)}원"/>
				                </c:if>
				                <c:if test="${game.gameSale eq 0 }">
				                    금액 : ${game.gamePrice}원
				                </c:if>
				                <c:if test="${game.gameSale ne 0 }">
				                    <span class="badge bg-danger">${game.gameSale}%</span>
				                </c:if>
				            </div>
				        </div>
				    </a>
				</c:forEach>
			</div>			
		</div>
	</div>
</div>	
<!-- ================================푸터=============================================== -->								
		<jsp:include page="../inc/footer.jsp"></jsp:include>	
<!-- ================================푸터=============================================== -->
		<script type="text/javascript">
			function allGame() {
				location.href = "/hGame/option";
			}
		    function searchJenre(jenre) {
		        location.href = "/hGame/searchJenre?gameJenre=" + jenre;
		    }
		
		    function searchPlatform(platform) {
		    	location.href = "/hGame/searchPlatform?gamePlatform=" + platform;
		    }
		</script>
	</body>
</html>