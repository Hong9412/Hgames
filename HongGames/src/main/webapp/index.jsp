<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>홍게임즈</title>
</head>
<!-- ================================헤더=============================================== -->		
		<%@ include file="../inc/head.jsp" %>						
		<jsp:include page="../inc/header.jsp"></jsp:include>	
<!-- ================================헤더=============================================== -->
<body>
	<main class="main">
		<div class="main-layer1">
			<div id="gamelist">
				<div class="games">
					<a href=""><img
						src="https://image.directg.net/upload/product/goods_1692174390_bimg.jpg"
						alt="" class="gamesimg"></a> <a href=""><img src="#"
						alt="플랫폼로고" class="flatform" id="steamlogo"></a>
					<div class="gameshop">
						<p>59,800원</p>
					</div>
					<div class="gameinformation">돌연변이 닌자 거북이: 슈레더의 복수 - 디멘션
						쉘쇼크(스팀)</div>
				</div>
				<div class="games">
					<a href=""><img
						src="https://image.directg.net/upload/product/goods_1559876570_bimg.jpg"
						alt="" class="gamesimg"></a> <a href=""><img src="#"
						alt="플랫폼로고" class="flatform" id="steamlogo"></a>
					<div class="gameshop">51,500원</div>
					<div class="gameinformation">[특전제공] 싱킹 시티 - 네크로노미콘 에디션</div>
				</div>
			</div>
		</div>
<!-- ================================푸터=============================================== -->								
		<jsp:include page="../inc/footer.jsp"></jsp:include>	
<!-- ================================푸터=============================================== -->	
	</main>
</body>
</html>