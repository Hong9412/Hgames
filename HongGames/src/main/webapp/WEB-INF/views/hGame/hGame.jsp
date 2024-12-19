<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  	
<!DOCTYPE html>
<html class="h-100">
	<head>
		<meta charset="UTF-8">
		<title>홍게임즈</title>
		<style type="text/css">
			#noticeName {
			  display: inline-block;
			  width: 430px;
			  overflow: hidden;
			  text-overflow: ellipsis;
			  white-space: nowrap;
			}
			#noticeContent {
			  display: inline-block;
			  width: 430px;
			  overflow: hidden;
			  text-overflow: ellipsis;
			  white-space: nowrap;
			}
			div[name="gameRow"]:hover {
			    transform: scale(1.05);
			    transition: transform 0.3s ease-in-out;
			}
			#gameSelet {
				display: none;
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
					<div class="container-fluid">
			<div class="row">
				<div class="col-8">
					<div id="carouselExampleInterval" class="carousel slide" data-bs-ride="carousel">
						<div class="carousel-inner">
						<c:forEach items="${tList }" var="title" begin="0" end="3">
							<div class="carousel-item active" data-bs-interval="2000">
								<img src="../../resources/gameTitleImgs/${title.imageRename }" class="d-block w-100" alt="..." style="height: 470px; width: 680px;">
							</div>
						</c:forEach>
						<button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleInterval" data-bs-slide="prev">
							<span class="carousel-control-prev-icon" aria-hidden="true"></span>
							<span class="visually-hidden">Previous</span>
						</button>
						<button class="carousel-control-next" type="button" data-bs-target="#carouselExampleInterval" data-bs-slide="next">
							<span class="carousel-control-next-icon" aria-hidden="true"></span>
							<span class="visually-hidden">Next</span>
					</button>
				</div>
				</div>
				</div>
				<div class="col-4">
					<div class="p-4 mb-3 bg-body-dark rounded"">
						<h4 class="fst-italic">공지사항</h4>
						<div class="list-group-dark">
							<c:forEach items="${nList }" var="notice" begin="0" end="4">
								<a href="/notice/detail?noticeNo=${notice.noticeNo }" class="list-group-item list-group-item-action d-flex gap-3 py-3" aria-current="true" id="noticeName">
									<div class="d-flex gap-2 w-100 justify-content-between">
										<div>
											<h6 class="mb-0">${notice.noticeName }</h6>
											<p class="mb-0 opacity-75"  id="noticeContent">${notice.noticeContent }</p>
										</div>
									</div>
								</a>
							</c:forEach>
						</div>         
					</div>			
				</div>			
			</div>
		</div>
				<div class="row g-5">
					<div class="col-md-3">
				      <div class="position-sticky" style="top: 2rem;">
				        <div>
				          <h4 class="fst-italic">퍼블리셔</h4>
				          <ul class="list-unstyled">
				            <li>
				              <a class="d-flex flex-column flex-lg-row gap-3 align-items-start align-items-lg-center py-3 link-body-emphasis text-decoration-none border-top" href="#">
								<img alt="게임" src="../../resources/images/기어박스.jpg" style="width: 330px;">
				              </a>
				            </li>
				            <li>
				              <a class="d-flex flex-column flex-lg-row gap-3 align-items-start align-items-lg-center py-3 link-body-emphasis text-decoration-none border-top" href="#">
								<img alt="게임" src="../../resources/images/네오위즈.jpg" style="width: 330px;">
				              </a>
				            </li>
				            <li>
				              <a class="d-flex flex-column flex-lg-row gap-3 align-items-start align-items-lg-center py-3 link-body-emphasis text-decoration-none border-top" href="#">
								<img alt="게임" src="../../resources/images/세가.jpg" style="width: 330px;">
				              </a>
				            </li>
				            <li>
				              <a class="d-flex flex-column flex-lg-row gap-3 align-items-start align-items-lg-center py-3 link-body-emphasis text-decoration-none border-top" href="#">
								<img alt="게임" src="../../resources/images/캡콤.jpg" style="width: 330px;">
				              </a>
				            </li>
				            <li>
				              <a class="d-flex flex-column flex-lg-row gap-3 align-items-start align-items-lg-center py-3 link-body-emphasis text-decoration-none border-top" href="#">
								<img alt="게임" src="../../resources/images/투케이.jpg" style="width: 330px;">
				              </a>
				            </li>
				            <li>
				              <a class="d-flex flex-column flex-lg-row gap-3 align-items-start align-items-lg-center py-3 link-body-emphasis text-decoration-none border-top" href="#">
								<img alt="게임" src="../../resources/images/파라독스.jpg" style="width: 330px;">
				              </a>
				            </li>
				            <li>
				              <a class="d-flex flex-column flex-lg-row gap-3 align-items-start align-items-lg-center py-3 link-body-emphasis text-decoration-none border-top" href="#">
								<img alt="게임" src="../../resources/images/플스.jpg" style="width: 330px;">
				              </a>
				            </li>
				          </ul>
				        </div>
				      </div>
				    </div>
			
				    <div class="col-md-9">
						<h4 class="fst-italic">게임리스트</h4>
						<c:forEach items="${gList}" var="game" varStatus="i">
						    <a href="/hGame/detail?gameNo=${game.gameNo }" style="text-decoration:none; color:inherit;">
						        <div class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative" name="gameRow">
						            <div class="col-3 d-none d-lg-block">
						                <img alt="게임" src="../../resources/gameTitleImgs/${tList[i.index].imageRename}" style="width: 300px; height: 150px;">
						            </div>
						            <div class="col-7 p-4 d-flex flex-column position-static">
						                <h3 class="mb-0">${game.gameTitle}</h3>
						                <div class="mb-1 text-body-secondary">
						                    <span class="badge rounded-pill bg-secondary">${game.gameJenre}</span>                
						                    <span class="badge rounded-pill bg-secondary">${game.gamePlatform}</span>
						                    <c:if test="${game.gameKorean ne 'Y'}">
						                        <span class="badge rounded-pill bg-secondary">한글지원</span>
						                    </c:if>
						                    <c:if test="${game.gameKoreanVoice ne 'Y'}">
						                        <span class="badge rounded-pill bg-secondary">한글더빙</span>
						                    </c:if>
						                </div>
						            </div>
						            <div class="col-2" style="margin-top: 35px;">
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
						    </a>
						</c:forEach>
				    </div>
				  </div>
				</div>
				<div class="col-1"></div>
			</div>
		</div>
<!-- ================================푸터=============================================== -->								
		<jsp:include page="../inc/footer.jsp"></jsp:include>	
<!-- ================================푸터=============================================== -->	
	</body>
</html>