<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <div class="text-bg-dark">
 	<header class="d-flex flex-wrap align-items-center justify-content-center justify-content-md-between py-3 border-bottom">
	<div class="col-md-3 mb-md-0">
	  <a href="/" class="d-inline-flex link-body-emphasis text-decoration-none">
	        <svg class="bi" width="40" height="32" role="img" aria-label="Bootstrap"><use xlink:href="#bootstrap"></use></svg>
	      </a>
	    </div>
		<ul class="nav col-12 col-md-auto justify-content-center mb-md-0">
			<li><a href="/" class="nav-link link-success px-2">메인</a></li>
			<li><a href="/hGame/option" class="nav-link link-success px-2">게임</a></li>
			<li><a href="/hGame/promotion"" class="nav-link link-success px-2">프로모션</a></li>
			<li><a href="/hGame/notice" class="nav-link link-success px-2">공지사항</a></li>
			<li><a href="/user/inquiry" class="nav-link link-success px-2" onclick="checkUserId()">문의하기</a></li>
		</ul>
		<c:if test="${userId eq null }">
			<div class="col-md-3 text-end">
				<button type="button" class="btn btn-outline-success me-2" onclick="showLogin();">로그인</button>
				<button type="button" class="btn btn-success" onclick="showJoin();">회원가입</button>
			</div>   
		</c:if>
		<c:if test="${userId ne null }">
			<c:if test="${userId ne 'admin' }">
				<div class="col-md-3 text-end">				
					<button type="button" class="btn btn-outline-success me-2" onclick="userLogout();">로그아웃</button>
					<button type="button" class="btn btn-success" onclick="userMyPage();">마이페이지</button>
				</div>
			</c:if>
			<c:if test="${userId eq 'admin' }">
				<div class="col-md-3 text-end">	
					<button type="button" class="btn btn-outline-success me-2" onclick="userLogout();">로그아웃</button>
					<button type="button" class="btn btn-success" onclick="adminPage();">관리페이지</button>
				</div>
			</c:if>
		</c:if>
	</header>
 </div>
