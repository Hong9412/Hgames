<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="h-100">
	<head>
		<meta charset="UTF-8">
		<title>게임 등록 페이지</title>
	</head>
	<body class="d-flex flex-column h-100 text-bg-dark">
<!-- ================================헤더=============================================== -->		
		<%@ include file="../inc/head.jsp" %>						
		<jsp:include page="../inc/header.jsp"></jsp:include>	
<!-- ================================헤더=============================================== -->	
<div class="container-fiuid text-bg-dark">
	<form action="/game/insert" method="post" enctype="multipart/form-data">
	<div class="row justify-content-center">
		<div class="col-2"></div>
		<div class="col-5 justify-content-center" style="margin-top: 50px;">
			<div class="input-group mb-3" style="width: 500px;">
				<span class="input-group-text text-bg-dark text-center" id="basic-addon3">게임제목</span>
				<input type="text" class="form-control text-bg-secondary" name="gameTitle" id="basic-url" aria-describedby="basic-addon3" placeholder="게임 제목을 입력해주세요" required>
	        </div>	
			<div class="input-group mb-3">
				<span class="input-group-text text-bg-dark" id="basic-addon3">메인사진</span>
				<img id="preview" style="width: 500px; height: 400px"/>
	        </div>		        		
			<input type="file" class="form-control text-bg-secondary" name="hong" id="basic-url" aria-describedby="basic-addon3" onchange="readURL(this);" style="width: 500px;" required>
		</div>
		<div class="col-3 justify-content-center">
			<div class="input-group mb-3" style="margin-top: 110px; margin-bottom: 40px;">
				<span class="input-group-text text-bg-dark" id="basic-addon3">장르선택</span>
				<select class="form-select text-bg-secondary" name="gameJenre" id="country" required>
					<option value="X">::: 장르 선택 :::</option>
					<option value="액션">액션</option>
					<option value="롤플레잉">롤플레잉</option>
					<option value="스포츠">스포츠</option>
					<option value="전략/시뮬레이션">전략/시뮬레이션</option>
				</select>
            </div>	
            
			<div class="input-group mb-3" style="margin-bottom: 40px;">
				<span class="input-group-text text-bg-dark" id="basic-addon3">유형선택</span>
				<select class="form-select text-bg-secondary" name="gameCategory" id="country" required>
					<option value="X">::: 게임 유형 선택 :::</option>
					<option value="전체">전체</option>
					<option value="기본게임">기본게임</option>
					<option value="DLC">DLC</option>
				</select>
            </div>	
            
			<div class="input-group mb-3" style="margin-bottom: 40px;">
				<span class="input-group-text text-bg-dark" id="basic-addon3">플랫폼선택</span>
				<select class="form-select text-bg-secondary" name="gamePlatform" id="country" required>
					<option value="X">::: 플랫폼 선택 :::</option>
					<option value="steam">steam</option>
					<option value="Ubisoft Connect">Ubisoft Connect</option>
					<option value="Epic games">Epic games</option>
					<option value="Rockster Games">Rockster Games</option>
				</select>
            </div>	
            
			<div class="input-group mb-3" style="margin-bottom: 40px;">
				<span class="input-group-text text-bg-dark" id="basic-addon3">퍼블리셔선택</span>
				<select class="form-select text-bg-secondary" name="gamePublisher" id="country" required>
					<option value="X">::: 퍼플리셔 선택 :::</option>
					<option value="Gearbox">Gearbox</option>
					<option value="NEOWIZ">NEOWIZ</option>
					<option value="SEGA">SEGA</option>
					<option value="2K">2K</option>
					<option value="Paradox">Paradox</option>
					<option value="playstation PC">playstation PC</option>
				</select>
            </div>	
            
			<div class="input-group mb-3" style="margin-bottom: 40px;">
				<span class="input-group-text text-bg-dark" id="basic-addon3">자막여부</span>
				<select class="form-select text-bg-secondary" name="gameKorean" id="country" required>
					<option value="X">::: 자막여부 :::</option>
					<option value="Y">자막 있음</option>
					<option value="N">자막 없음</option>
				</select>
            </div>	
            
			<div class="input-group mb-3" style="margin-bottom: 40px;">
				<span class="input-group-text text-bg-dark" id="basic-addon3">더빙여부</span>
				<select class="form-select text-bg-secondary" name="gameKoreanVoice" id="country" required>
					<option value="X">::: 더빙여부 :::</option>
					<option value="Y">더빙 있음</option>
					<option value="N">더빙 없음</option>
				</select>
            </div>
            	
			<div class="input-group mb-3">
				<span class="input-group-text text-bg-dark" id="basic-addon3">게임가격</span>
				<input type="text" class="form-control text-bg-secondary" name="gamePrice" id="basic-url" aria-describedby="basic-addon3" placeholder="가격을 입력해주세요" required>
	        </div>
	        
			<div class="input-group mb-3">
				<span class="input-group-text text-bg-dark" id="basic-addon3">출시일</span>
				<input type="date" class="form-control text-bg-secondary" name="gameDate" id="basic-url" aria-describedby="basic-addon3" placeholder="게임 제목을 입력해주세요" required>
	        </div>	
		</div>
		<div class="col-2"></div>
	</div>
	<div class="row justify-content-center">
		<div class="col-3"></div>
		<div class="col-6 justify-content-center"><br>
			<div id="container" style="display: flex; flex-direction: column; align-items: center;"></div>
			<input type="button" value="내용 추가" onclick="add()">	
			<button type="submit" class="btn btn-success" onclick="insertGame();">게임등록</button>	         
		</div>
		<div class="col-3"></div>
	</div>
	</form>
</div>
<!-- ================================푸터=============================================== -->								
		<jsp:include page="../inc/footer.jsp"></jsp:include>	
<!-- ================================푸터=============================================== -->	
	<script type="text/javascript">
		// 대표사진 미리보기 
		function readURL(input) {
			if (input.files && input.files[0]) {
				var reader = new FileReader();
				reader.onload = function(e) {
					document.getElementById('preview').src = e.target.result;
				};
				reader.readAsDataURL(input.files[0]);
			} else {
				document.getElementById('preview').src = "";
			}
		}
		
		function insertGame() {
			if (!confirm("게임을 등록하시겠습니까? ")) {
		        // 취소(아니오) 버튼 클릭 시 이벤트
			} else {
				alert("등록되었습니다.");
				location.href = "/game/insert";
			}			
		}
		function add() {
		    var container = document.getElementById('container');

		    // 파일 입력 필드 생성 및 숨기기
		    var fileInput = document.createElement('input');
		    fileInput.type = 'file';
		    fileInput.style.display = 'none'; // 입력 필드 숨기기
		    fileInput.name = 'images'; 
		    fileInput.onchange = function(event) { previewImage(event.target, uploadDiv); };

		    // 사용자 정의 업로드 영역 생성
		    var uploadDiv = document.createElement('div');
		    uploadDiv.style.width = '500px';
		    uploadDiv.style.height = '300px';
		    uploadDiv.style.border = '1px solid #ccc'; // 변경: 회색 실선 테두리로 설정
		    uploadDiv.style.display = 'flex';
		    uploadDiv.style.alignItems = 'center';
		    uploadDiv.style.justifyContent = 'center';
		    uploadDiv.style.overflow = 'hidden'; // 추가: div의 내용이 넘치지 않도록 설정
		    uploadDiv.style.position = 'relative'; // 추가: 상대 위치 지정
		    uploadDiv.style.cursor = 'pointer';
		    uploadDiv.textContent = '클릭하여 이미지 업로드';

		    uploadDiv.onclick = function() { fileInput.click(); };

		    // 이미지 미리보기를 위한 img 태그 생성
		    var imgPreview = document.createElement('img');
		    imgPreview.style.width = '500px';
		    imgPreview.style.height = '300px';
		    imgPreview.style.objectFit = 'contain'; // 비율을 유지하며 div에 맞게 조절
		    imgPreview.style.position = 'absolute'; // 추가: 절대 위치 지정
		    imgPreview.style.top = '0'; // 추가: 상단 정렬
		    imgPreview.style.left = '0'; // 추가: 왼쪽 정렬
		    imgPreview.alt = '미리보기';
		    imgPreview.style.display = 'none'; // 초기에는 숨김

		    uploadDiv.appendChild(imgPreview);

		    // 텍스트영역 생성
		    var textArea = document.createElement('textarea');
		    textArea.className = 'form-control text-bg-secondary';
		    textArea.style.marginTop = '15px';
		    textArea.style.marginBottom = '15px';
		    textArea.style.heigh = '100px';
		    textArea.name = 'detailContent';
		    textArea.placeholder = '추가 내용을 입력해주세요';

		    container.appendChild(fileInput);
		    container.appendChild(uploadDiv);
		    container.appendChild(textArea);
		}

		function previewImage(input, uploadDiv) {
		    var reader = new FileReader();
		    reader.onload = function(e) {
		        var imgPreview = uploadDiv.querySelector('img');
		        imgPreview.style.display = 'block'; // 이미지 미리보기 표시
		        imgPreview.src = e.target.result;
		    };
		    reader.readAsDataURL(input.files[0]);
		}
	</script>		
	</body>
</html>