<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>     
<!DOCTYPE html>
<html class="h-100">
	<head>
		<meta charset="UTF-8">
		<title>게임 상세 페이지</title>
	</head>
	<body class="d-flex flex-column h-100 text-bg-dark">
<!-- ================================헤더=============================================== -->		
		<%@ include file="../inc/head.jsp" %>						
		<jsp:include page="../inc/header.jsp"></jsp:include>	
<!-- ================================헤더=============================================== -->
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<div class="container mt-5">
	<div class="row">
		<div class="col-1"></div>
		<div class="col-10">
		<div class="row g-5">
		    <div class="col-md-8 border-right">
		      <h3 class="pb-4 mb-4 fst-italic border-bottom">
		        ${game.gameTitle }
		      </h3>
				<c:forEach items="${dList }" var="dList" varStatus="i">
					<img alt="이미지" src="../../resources/gameDetailImgs/${iList[i.index].fileName}" style="width: 620px; height: 400px;"> <br>
					<div style="white-space: pre-line;">${dList.detailContent }</div>
		
				</c:forEach>
		    </div>
		
		    <div class="col-md-4">
		      <div class="position-sticky" style="top: 2rem;">
		      		<div class="container pb-4 mb-4 border-bottom">
		      			<img alt="이미지" src="../../resources/gameTitleImgs/${title.imageRename}" style="width: 310px; height: 170px;">
		      		</div>
					<div class="container pb-4 mb-4 border-bottom">
						장르 : ${game.gameJenre } <br>
						유형 : ${game.gameCategory } <br>
						플랫폼 : ${game.gamePlatform } <br>
						퍼블리셔 : ${game.gamePublisher } <br>
						출시일 : ${game.gameDate } <br>
						<c:if test="${game.gameKorean ne 'N' }">
							자막 : 한국어<br>
						</c:if>
						<c:if test="${game.gameKorean eq 'N' }">
							자막 : 지원X<br>
						</c:if>
						<c:if test="${game.gameKorean ne 'N' }">
							더빙 : 한글더빙 <br>
						</c:if>
						<c:if test="${game.gameKorean eq 'N' }">
							더빙 : 더빙 X<br>
						</c:if>
					</div>
					<div class="container pb-4 mb-4 border-bottom">
						<c:if test="${game.gameSale ne 0 }">
			                금액 : <s>${game.gamePrice}원</s> <br>
			                할인가 : <c:out value="${Math.round(game.gamePrice * (100 - game.gameSale) / 100)}원"/>
			            </c:if>
			            <c:if test="${game.gameSale eq 0 }">
			                금액 : ${game.gamePrice}원
			            </c:if>
			        </div>
			        <br><button type="button" onclick="requestPay()" id="check_module" class="btn btn-warning">카카오페이 결제하기</button>
		      </div>
		    </div>
		  </div>			
		</div>
		<div class="col-1"></div>
	</div>
</div>	

<!-- ================================푸터=============================================== -->								
		<jsp:include page="../inc/footer.jsp"></jsp:include>	
<!-- ================================푸터=============================================== -->
		<script>
		$("#check_module").click(function () {
		    if (!('${userId}')) {
		        alert('로그인 후 이용가능합니다.');
		        return;
		    }

		    var IMP = window.IMP;
		    IMP.init('imp33450327'); 
		    IMP.request_pay({
		        pg: 'kakaopay',
		        pay_method: 'card',
		        merchant_uid: 'merchant_' + new Date().getTime(),
		        name: '${game.gameTitle}', //결제창에서 보여질 이름
		        amount: ${Math.round(game.gamePrice * (100 - game.gameSale) / 100)},  //가격 
		        buyer_name: '${userId}',
		        m_redirect_url: 'https://www.yourdomain.com/payments/complete'
		        /*  
		            모바일 결제시,
		            결제가 끝나고 랜딩되는 URL을 지정 
		            (카카오페이, 페이코, 다날의 경우는 필요없음. PC와 마찬가지로 callback함수로 결과가 떨어짐) 
		        */
		    }, function (rsp) {
		        console.log(rsp);
		        if (rsp.success) {
		            var msg = '결제가 완료되었습니다. 게임코드는 마이페이지 결제내역에서 확인할 수 있습니다. :)';
		            
		            // 결제가 성공하면 컨트롤러 거쳐서 DB에 저장스 하귕~
		            var paymentInfo = {
		                userId: '${userId}',
		                gameTitle: '${game.gameTitle}',
		                gamePrice: ${Math.round(game.gamePrice * (100 - game.gameSale) / 100)},
		                howPay: '카카오페이'
		            };

		            $.ajax({
		                type: 'POST',
		                url: '/processPayment',
		                contentType: 'application/json',
		                data: JSON.stringify(paymentInfo),
		                success: function (response) {
		                    console.log(response);
		                },
		                error: function (xhr, status, error) {
		                    console.error(error);
		                }
		            });
		        } else {
		            var msg = '결제에 실패하였습니다.';
// 		            msg += '에러내용 : ' + rsp.error_msg;
		        }
		        alert(msg);
		    });
		});
		</script>
	</body>
</html>