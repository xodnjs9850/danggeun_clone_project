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

<body class="loader-fill">
    <!-- [ Pre-loader ] start -->
    <div class="loader-bg">
        <div class="loader-track">
            <div class=""></div>
        </div>
    </div>
    <!-- [ Pre-loader ] End -->

    <!-- [ navigation menu ] start -->
    <%@ include file="../include/navigation.jsp" %>
    <!-- [ navigation menu ] end -->


    <!-- [ Header ] start -->
    <%@ include file="../include/header.jsp" %>
    <!-- [ Header ] end -->


    <!-- [ Main Content ] start -->
    <div class="pcoded-main-container">
        <div class="pcoded-content">
            <!-- [ sitename ] start -->
            <%@ include file="../include/sitename.jsp" %>
            <!-- [ sitename ] end -->


            <!-- [ Main Content ] start -->
            <div class="row">
                <!-- [ form-element ] start -->
                <div class="card">
                    <div class="col-sm-12">
                        <div class="card-header">
                            <h5>프로필 수정</h5>
                        </div>
                        <div class="navbar-content scroll-div">
                            <div class="main-menu-header profile-name"><br>
                                <img class="img-radius profile-img" src="/images/user/user_basic.png"
                                    alt="User-Profile-Image">
                                <div class="user-details">
                                    <div id="profile-info">
                                        <p id="userId"> #${loginUser.userId}</p>
                                    </div><br>
                                    <div class="card-body">
                                        <form action="/user/profile-modify" name="modify" id="modifyForm" method="post">
                                            <input type="hidden" name="auth" value="USER">
                                            <div class="form-group mb-3">
                                                <label class="floating-label" for="userNickname">닉네임</label>
                                                <span id="nicknameChk"></span>
                                                <input type="text" class="form-control" name="userNickname"
                                                    id="userNickname" required="required" aria-required="true"
                                                    maxlength="10" placeholder="# ${loginUser.userNickname}">
                                            </div>
                                            <div class="form-group mb-3">
                                                <label class="floating-label" for="userEmail">이메일</label>
                                                <span id="emailChk"></span>
                                                <input type="text" class="form-control" name="userEmail" id="userEmail"
                                                    required="required" aria-required="true"
                                                    placeholder="# ${loginUser.userEmail}">
                                            </div>
                                            <!-- <div class="form-group mb-3">
                                                <label class="floating-label" for="userId">지역</label>
                                                <span id="idChk"></span>
                                                <input type="text" class="form-control" name="userId" id="user_id"
                                                    maxlength="14" required="required" aria-required="true"
                                                    placeholder="지역 선택"> 지역 설정
                                            </div> -->
                                            <div class="form-group mb-4">
                                                <label class="floating-label" for="userPw">새로운 비밀번호</label>
                                                <span id="pwChk"></span>
                                                <input type="password" class="form-control" name="userPw" id="userPw"
                                                    maxlength="20" required="required" aria-required="true"
                                                    placeholder="영문과 특수문자를 포함한 최소 8자">
                                            </div>
                                            <div class="form-group mb-4">
                                                <label class="floating-label" for="userPwChk">새로운 비밀번호
                                                    확인</label>
                                                <span id="pwChk2"></span>
                                                <input type="password" class="form-control" name="userPwChk"
                                                    id="userPwChk" maxlength="20" required="required"
                                                    aria-required="true" placeholder="비밀번호가 일치해야 합니다.">
                                            </div>
                                        </form>
                                        <a href="/user/profile?userId=${loginUser.userId}" type="button"
                                            class="btn btn-primary btn-block mb-4" id="modify-btn">수정하기</a>
                                        <p class="mb-2">
                                            <a href="/user/withdraw?userId=${loginUser.userId}" class="f-w-400"
                                                id="delete-btn">탈퇴하기</a>
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- [ form-element ] end -->
                </div>
                <!-- [ Main Content ] end -->
            </div>
        </div>
    </div>



    <script>
        $(function () { //jQuery Start

            //입력값 검증 정규 표현식
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


            //비밀번호 입력값 검증
            $('#userPw').on('keyup', function () {
                //비밀번호 공백 확인
                if ($("#userPw").val().trim() === "") {
                    $('#userPw').css("background-color", "pink");
                    $('#pwChk').html('<b style="font-size:14px;color:red;">[Danger : 비밀번호 필수정보]</b>');
                    chk1 = false;
                }
                //비밀번호 유효성검사
                else if (!getPwCheck.test($("#userPw").val()) || $("#userPw").val().length < 8) {
                    $('#userPw').css("background-color", "pink");
                    $('#pwChk').html('<b style="font-size:14px;color:red;">[특수문자 포함 8자이상]</b>');
                    chk1 = false;
                } else {
                    $('#userPw').css("background-color", "aqua");
                    $('#pwChk').html('<b style="font-size:14px;color:green;">[Success : 비밀번호]</b>');
                    chk1 = true;
                }
            });

            //패스워드 확인 입력값 검증
            $('#userPwChk').on('keyup', function () {
                //비밀번호 확인란 공백 확인
                if ($("#userPwChk").val().trim() === "") {
                    $('#userPwChk').css("background-color", "pink");
                    $('#pwChk2').html(
                        '<b style="font-size:14px;color:red;">[Danger : 비밀번호 확인 필수정보]</b>');
                    chk2 = false;
                }
                //비밀번호 확인란 유효성검사
                else if ($("#userPw").val() !== $("#userPwChk").val()) {
                    $('#userPwChk').css("background-color", "pink");
                    $('#pwChk2').html('<b style="font-size:14px;color:red;">[특수문자 포함 8자이상]</b>');
                    chk2 = false;
                } else {
                    $('#userPwChk').css("background-color", "aqua");
                    $('#pwChk2').html('<b style="font-size:14px;color:green;">[Success : 비밀번호]</b>');
                    chk2 = true;
                }
            });

            //닉네임 입력값 검증
            $('#userNickname').on('keyup', function () {
                //닉네임값 공백 확인
                if ($("#userNickname").val().trim() === "") {
                    $('#userNickname').css("background-color", "pink");
                    $('#nicknameChk').html(
                        '<b style="font-size:14px;color:red;">[Danger : 닉네임 필수정보]</b>');
                    chk3 = false;
                }
                //닉네임값 유효성검사
                else if (!getNickname.test($("#userNickname").val())) {
                    $('#userNickname').css("background-color", "pink");
                    $('#nicknameChk').html('<b style="font-size:14px;color:red;">[한글로 최대 10자]</b>');
                    chk3 = false;
                } else {
                    $('#userNickname').css("background-color", "aqua");
                    $('#nicknameChk').html(
                        '<b style="font-size:14px;color:green;">[Success : 닉네임]</b>');
                    chk3 = true;
                }
            });

            //이메일 입력값 검증
            const $emailInput = $('#userEmail');
            $emailInput.on('keyup', function () {
                //이메일값 공백 확인
                if ($emailInput.val().trim() === "") {
                    $emailInput.css("background-color", "pink");
                    $('#emailChk').html('<b style="font-size:14px;color:red;">[Danger : 이메일 필수정보]</b>');
                    chk4 = false;
                }
                //이메일값 유효성검사
                else if (!getMail.test($emailInput.val())) {
                    $emailInput.css("background-color", "pink");
                    $('#emailChk').html(
                        '<b style="font-size:14px;color:red;">[Danger : 이메일 형식 오류]</b>');
                    chk4 = false;
                } else {
                    //이메일 중복확인 비동기 통신
                    fetch('/check?type=email&keyword=' + $emailInput.val())
                        .then(res => res.text())
                        .then(flag => {
                            //console.log(flag);
                            if (flag === 'true') {
                                $emailInput.css('background', 'pink');
                                $('#emailChk').html(
                                    '<b style="font-size:14px; color:red;">[Danger : 이메일 중복]</b>'
                                );
                                chk4 = false;
                            } else {
                                $emailInput.css('background', 'aqua');
                                $('#emailChk').html(
                                    '<b style="font-size:14px; color:green;">[Success : 이메일]</b>'
                                );
                                chk4 = true;
                            }
                        });
                }
            });

            //수정하기 버튼 클릭 이벤트
            $('#modify-btn').on('click', e => {
                e.preventDefault();
                if (chk1 && chk2 && chk3 && chk4) {
                    $('#modifyForm').submit(); //수동 submit
                } else {
                    alert('입력값을 모두 기재해주세요.');
                }
            });


        }); //jQuery End
    </script>

</body>

</html>