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

<!-- [ auth-signin ] start -->
<div class="auth-wrapper">
	<div class="auth-content">
		<div class="card">
			<div class="align-items-center text-center">
				<div class="col-md-12">
					<div class="card-body">

						<form action="/user/loginCheck" name="signIn" id="signInForm" method="post">
							<img src="/images/market_logo2.png" alt="로고 이미지" class="img-fluid mb-4">
							<h4 class="mb-3 f-w-400">로그인</h4>
							<div class="form-group mb-3">
								<label class="floating-label" for="userId">아이디</label>
								<span class="idCheck"></span>
								<input type="text" class="form-control" name="userId" id="userId" required="required"
									aria-required="true" placeholder="">
							</div>
							<div class="form-group mb-4">
								<label class="floating-label" for="userPw">비밀번호</label>
								<span class="pwCheck"></span>
								<input type="password" class="form-control" name="userPw" id="userPw"
									required="required" aria-required="true" placeholder="">
							</div>
							<div class="custom-control custom-checkbox text-left mb-4 mt-2">
								<input type="checkbox" class="custom-control-input" id="customCheck1" name="autoLogin">
								<label class="custom-control-label" for="customCheck1">자동 로그인</label>
							</div>
							<input type="submit" id="signIn-btn" class="btn btn-block btn-primary mb-4" value="로그인">
							
							<a href="https://kauth.kakao.com/oauth/authorize?client_id=${appKey}&redirect_uri=http://localhost:8181${redirectUri}&response_type=code">
								<img src="//mud-kage.kakao.com/14/dn/btqbjxsO6vP/KPiGpdnsubSq3a0PHEGUK1/o.jpg"
									alt="카카오 로그인" class="mb-4 kakao">
							</a>
							<!-- <p class="mb-2 text-muted"><a href="#" class="f-w-400">비밀번호 찾기</a></p> -->
							<!-- 비밀번호 찾기 페이지 만들기!!! -->
							<p class="mb-0 text-muted"><a href="/user/sign-up" class="f-w-400">회원가입하기</a></p>
						</form>

					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- [ auth-signin ] end -->

</body>

</html>