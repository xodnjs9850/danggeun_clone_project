<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">

<head>

	<title>ORANGE MARKET</title>
	<!-- Meta -->
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<meta name="description" content="" />
	<meta name="keywords" content="">
	<meta name="author" content="Phoenixcoded" />

	<%@ include file="../include/static-head.jsp" %>
</head>

<!-- [ signup ] start -->
<div class="auth-wrapper">
	<div class="auth-content">
		<div class="card">
			<div class="align-items-center text-center">
				<div class="col-md-12">
					<div class="card-body">
						<form action="/user/sign-up" name="signup" id="signUpForm" method="post">
							<input type="hidden" name="auth" value="USER">
							<img src="/images/market_logo2.png" alt="로고이미지" class="img-fluid mb-4">
							<h4 class="mb-3 f-w-400">회원가입</h4>

							<div class="form-group mb-3">
								<label class="floating-label" for="userId">아이디</label>
								<span id="idChk"></span>
								<input type="text" class="form-control" name="userId" id="user_id" maxlength="14"
									required="required" aria-required="true" placeholder="숫자와 영어로 4-14자">
							</div>
							<div class="form-group mb-3">
								<label class="floating-label" for="userNickname">닉네임</label>
								<span id="nicknameChk"></span>
								<input type="text" class="form-control" name="userNickname" id="userNickname"
									required="required" aria-required="true" maxlength="10" placeholder="한글로 최대 10자">
							</div>
							<div class="form-group">
								<label class="floating-address">주소
									<input type="hidden" id="userAd">
									<span id="addrChk"></span>
								</label>
								<input class="form-control" id="user_post" type="text" placeholder="주소검색하기" readonly
									onclick="findAddr()">
								<input class="form-control" id="user_addr" name="userAddress" type="text"
									placeholder="주소" readonly> <br>
							</div>
							<div class="form-group mb-3">
								<label class="floating-label" for="userEmail">이메일</label>
								<span id="emailChk"></span>
								<input type="text" class="form-control" name="userEmail" id="userEmail"
									required="required" aria-required="true" placeholder="ex) abc@gmail.com">
							</div>
							<div class="form-group mb-4">
								<label class="floating-label" for="userPw">비밀번호</label>
								<span id="pwChk"></span>
								<input type="password" class="form-control" name="userPw" id="userPw" maxlength="20"
									required="required" aria-required="true" placeholder="영문과 특수문자를 포함한 최소 8자">
							</div>
							<div class="form-group mb-4">
								<label class="floating-label" for="userPwChk">비밀번호 확인</label>
								<span id="pwChk2"></span>
								<input type="password" class="form-control" name="userPwChk" id="userPwChk"
									maxlength="20" required="required" aria-required="true"
									placeholder="비밀번호가 일치해야 합니다.">
							</div>
						</form>
						<input type="button" value="회원가입" class="btn btn-primary btn-block mb-4" id="signup-btn">
						<p class="mb-2">
							<a href="/user/sign-in" class="f-w-400">로그인하기</a>
						</p>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- [ signup ] end -->






<!-- 입력값 검증 script -->
<script>
	$(function () {

		//입력값 검증 정규 표현식
		const getIdCheck = RegExp(/^[a-zA-Z0-9]{4,14}$/); //아이디 검증
		const getPwCheck = RegExp(
			/([a-zA-Z0-9].*[!,@,#,$,%,^,&,*,?,_,~])|([!,@,#,$,%,^,&,*,?,_,~].*[a-zA-Z0-9])/); //비밀번호 검증
		const getNickname = RegExp(/^[가-힣]+$/); //닉네임 검증
		const getMail = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/); //이메일 검증


		//회원가입 입력값 검증===============================================
		//입력을 정확히 했는지 판단하는 변수들
		let chk1 = false,
			chk2 = false,
			chk3 = false,
			chk4 = false,
			chk5 = false;

		//아이디 입력값 검증
		const $idInput = $('#user_id');
		console.log($idInput);

		$idInput.on('keyup', e => {
			if ($idInput.val().trim() === '') {
				$idInput.css('background', 'pink');
				$('#idChk').html('<b style="color:red; font-size:14px;">[Danger : 아이디 필수정보]</b>');
				chk1 = false;

			} else if (!getIdCheck.test($idInput.val())) {
				$idInput.css('background', 'pink');
				$('#idChk').html(
					'<b style="color:red; font-size:14px;">[영문, 숫자 4~14자로 작성하세요.]</b>');
				chk1 = false;
			} else {
				//아이디 중복확인 비동기 요청
				fetch('/check?type=userId&keyword=' + $idInput.val())
					.then(res => res.text())
					.then(flag => {
						console.log(flag);
						if (flag === 'true') { //중복
							$idInput.css('backgroud', 'pink');
							$('#idChk').html(
								'<b style="color:red; font-size:14px;">[Danger : 아이디 중복]</b>');
							chk1 = false;
						} else { //중복x
							$idInput.css('background', 'aqua');
							$('#idChk').html(
								'<b style="color:green; font-size:14px;">[Success : 아이디]</b>');
							chk1 = true;
						}
					});
			}
		});

		//비밀번호 입력값 검증
		$('#userPw').on('keyup', function () {
			//비밀번호 공백 확인
			if ($("#userPw").val().trim() === "") {
				$('#userPw').css("background-color", "pink");
				$('#pwChk').html('<b style="font-size:14px;color:red;">[Danger : 비밀번호 필수정보]</b>');
				chk2 = false;
			}
			//비밀번호 유효성검사
			else if (!getPwCheck.test($("#userPw").val()) || $("#userPw").val().length < 8) {
				$('#userPw').css("background-color", "pink");
				$('#pwChk').html('<b style="font-size:14px;color:red;">[특수문자 포함 8자이상]</b>');
				chk2 = false;
			} else {
				$('#userPw').css("background-color", "aqua");
				$('#pwChk').html('<b style="font-size:14px;color:green;">[Success : 비밀번호]</b>');
				chk2 = true;
			}
		});

		//패스워드 확인 입력값 검증
		$('#userPwChk').on('keyup', function () {
			//비밀번호 확인란 공백 확인
			if ($("#userPwChk").val().trim() === "") {
				$('#userPwChk').css("background-color", "pink");
				$('#pwChk2').html('<b style="font-size:14px;color:red;">[Danger : 비밀번호 확인 필수정보]</b>');
				chk3 = false;
			}
			//비밀번호 확인란 유효성검사
			else if ($("#userPw").val() !== $("#userPwChk").val()) {
				$('#userPwChk').css("background-color", "pink");
				$('#pwChk2').html('<b style="font-size:14px;color:red;">[특수문자 포함 8자이상]</b>');
				chk3 = false;
			} else {
				$('#userPwChk').css("background-color", "aqua");
				$('#pwChk2').html('<b style="font-size:14px;color:green;">[Success : 비밀번호]</b>');
				chk3 = true;
			}
		});

		//닉네임 입력값 검증
		$('#userNickname').on('keyup', function () {
			//닉네임값 공백 확인
			if ($("#userNickname").val().trim() === "") {
				$('#userNickname').css("background-color", "pink");
				$('#nicknameChk').html('<b style="font-size:14px;color:red;">[Danger : 닉네임 필수정보]</b>');
				chk4 = false;
			}
			//닉네임값 유효성검사
			else if (!getNickname.test($("#userNickname").val())) {
				$('#userNickname').css("background-color", "pink");
				$('#nicknameChk').html('<b style="font-size:14px;color:red;">[한글로 최대 10자]</b>');
				chk4 = false;
			} else {
				$('#userNickname').css("background-color", "aqua");
				$('#nicknameChk').html('<b style="font-size:14px;color:green;">[Success : 닉네임]</b>');
				chk4 = true;
			}
		});

		//이메일 입력값 검증
		const $emailInput = $('#userEmail');
		$emailInput.on('keyup', function () {
			//이메일값 공백 확인
			if ($emailInput.val().trim() === "") {
				$emailInput.css("background-color", "pink");
				$('#emailChk').html('<b style="font-size:14px;color:red;">[Danger : 이메일 필수정보]</b>');
				chk5 = false;
			}
			//이메일값 유효성검사
			else if (!getMail.test($emailInput.val())) {
				$emailInput.css("background-color", "pink");
				$('#emailChk').html('<b style="font-size:14px;color:red;">[Danger : 이메일 형식 오류]</b>');
				chk5 = false;
			} else {
				//이메일 중복확인 비동기 통신
				fetch('/check?type=email&keyword=' + $emailInput.val())
					.then(res => res.text())
					.then(flag => {
						//console.log(flag);
						if (flag === 'true') {
							$emailInput.css('background', 'pink');
							$('#emailChk').html(
								'<b style="font-size:14px; color:red;">[Danger : 이메일 중복]</b>');
							chk5 = false;
						} else {
							$emailInput.css('background', 'aqua');
							$('#emailChk').html(
								'<b style="font-size:14px; color:green;">[Success : 이메일]</b>'
							);
							chk5 = true;
						}
					});
			}
		});

		//회원가입 버튼 클릭 이벤트
		$('#signup-btn').on('click', e => {
			if (chk1 && chk2 && chk3 && chk4 && chk5) {
				$('#signUpForm').submit(); //수동 submit
			} else {
				alert('입력값을 확인하세요!');
			}
		});

	}); //jQuery End
</script>

</body>

</html>