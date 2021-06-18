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
                <div class="col-sm-12">
                    <div class="card">
                        <div class="card-header">
                            <h5>나의 당근</h5>
                        </div>


                        <div class="navbar-content scroll-div">
                            <div class="">
                                <div class="main-menu-header profile-name"><br>
                                    <img class="img-radius profile-img" src="/images/user/user_basic.png"
                                        alt="User-Profile-Image">
                                    <div class="user-details">
                                        <div id="more-details">${loginUser.userNickname}</div>
                                        <div id="profile-info">
                                            <p id="region">${loginUser.userAddress}</p>
                                            <p id="userId"> #${loginUser.userId}</p>
                                        </div><br>
                                        <a href="/user/profile-modify" type="button" class="btn  btn-primary">프로필
                                            수정하기</a>
                                        <hr>
                                        <a href="#" class="profile-list">
                                            <div>
                                                <span class="lnr lnr-list lnra"></span>
                                                <p>판매내역</p>
                                            </div>
                                        </a>

                                        <a href="#" class="profile-list">
                                            <div>
                                                <span class="lnr lnr-inbox lnra"></span>
                                                <p>구매내역</p>
                                            </div>
                                        </a>

                                        <a href="#" class="profile-list">
                                            <div>
                                                <span class="lnr lnr-heart lnra"></span>
                                                <p>관심목록</p>
                                            </div>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- [ form-element ] end -->
            </div>
        </div>
        <!-- [ Main Content ] end -->
    </div>
</body>

</html>