<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">

<head>
	<title>ORANGE MARKET</title>
    <style>

    </style>

    <!-- Meta -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="description" content="" />
    <meta name="keywords" content="">
    <meta name="author" content="Phoenixcoded" />

    <!-- chat css -->
    <link rel="stylesheet" href="/css/chat.css" />

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

            <div id="username-page">
                <div class="username-page-container">
                    <p class="title">채팅방에서 사용할 닉네임을 입력하세요!</p>
                    <form id="usernameForm" name="usernameForm">
                        <div class="form-group">
                            <input type="text" id="name" placeholder="${loginUser.userNickname}" autocomplete="off"
                                class="form-control" />
                        </div>
                        <div class="form-group">
                            <button type="submit" class="btn-primary">채팅 시작하기</button>
                        </div>
                    </form>
                </div>
            </div>

            <div id="chat-page" class="hidden">
                <div class="chat-container">
                    <div class="chat-header">
                        <h2>채팅</h2>
                    </div>
                    <div class="connecting">
                        연결중...
                    </div>
                    <ul id="messageArea">

                    </ul>
                    <form id="messageForm" name="messageForm">
                        <div class="form-group">
                            <div class="input-group clearfix">
                                <input type="text" id="message" placeholder="메시지를 입력하세요." autocomplete="off"
                                    class="form-control" />
                                <button type="submit" class="input-group button">보내기</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>


</body>

</html>