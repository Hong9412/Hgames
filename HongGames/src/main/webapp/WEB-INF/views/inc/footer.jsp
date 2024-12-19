<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
	<div class="container-fluid text-bg-dark footer mt-auto py-3">
		<footer>
				<ul class="nav justify-content-center border-bottom">
					<li class="nav-item" ><a href="#" class="nav-link link-success px-2">Home</a></li>
					<li class="nav-item"><a href="#" class="nav-link link-success px-2">Features</a></li>
					<li class="nav-item"><a href="#" class="nav-link link-success px-2">Pricing</a></li>
					<li class="nav-item"><a href="#" class="nav-link link-success px-2">FAQs</a></li>
					<li class="nav-item"><a href="#" class="nav-link link-success px-2">About</a></li>
				</ul>
		</footer>
	</div>
<script type="text/javascript">
	function showLogin() {
		location.href ="/user/login";
	}
	function showJoin() {
		location.href ="/user/join";
	}
	function userLogout() {
		location.href ="/user/logout";		
	}
	function userMyPage() {
		location.href ="/user/myPage";			
	}
    function checkUserId() {
        if (!('${userId}')) {
            alert('로그인 후 이용가능합니다.');
            event.preventDefault();
        }
        return true;
    }
	function adminPage() {
		location.href ="/admin/management";		
	}
</script>