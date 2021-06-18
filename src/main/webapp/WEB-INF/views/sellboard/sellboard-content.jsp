<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
                            <h5>중고거래 게시판</h5>
                        </div>
                        <div class="card-body">
                            <h5>글 정보</h5>
                            <hr>
                            <div class="row">
                                <div class="col-md-6">
                                    <form>
                                        <div class="form-group" id="productNum" value="${sellBoard.productNum}">
                                            <label for="exampleInputNo">상품번호</label>
                                            <p class="form-control">${sellBoard.productNum}</p>
                                        </div>
                                        <div class="form-group" id="viewCount" value="${sellBoard.viewCount}">
                                            <label for="exampleInputUserId">조회수</label>
                                            <p class="form-control">${sellBoard.viewCount}</p>
                                        </div>
                                        <div class="form-group" id="createDate" value="${sellBoard.createDate}">
                                            <label>작성시간</label>
                                            <p class="form-control">
                                                <fmt:formatDate value="${sellBoard.createDate}"
                                                pattern="yyyy년 MM월 dd일 HH:mm:ss" />
                                            </p>
                                        </div>
                                        <div class="form-group" id="sellCategory" value="${sellBoard.sellCategory}">
                                            <label for="exampleFormControlSelect1">카테고리</label>
                                            <p class="form-control">${sellBoard.sellCategory}</p>
                                        </div>
                                    </form>
                                </div>
                                <div class="col-md-6">
                                    <form>
                                        <div class="form-group" id="userNickName" value="${loginUser.userNickname}">
                                            <label for="exampleInputNo">닉네임</label>
                                            <p class="form-control">${loginUser.userNickname}</p>
                                        </div>

                                        <div class="form-group" id="stateFlag" value="${sellBoard.stateFlag}">
                                            <label for="exampleInputUserId">판매상태</label>
                                            <p class="form-control">${sellBoard.stateFlag}</p>
                                        </div>
                                        <div class="form-group" id="sellArea" value="${sellBoard.sellArea}">
                                            <label for="exampleInputUserId">판매 지역</label>
                                            <p class="form-control">${sellBoard.sellArea}</p>
                                        </div>
                                    </form>
                                </div>
                            </div>
                            <h5 class="mt-5">글 내용</h5>
                            <hr>
                            <form>
                                <div class="form-group" id="productName" value="${sellBoard.productName}">
                                    <label for="inputTitle">제목</label>
                                    <p class="form-control">${sellBoard.productName}</p>
                                </div>

                                <div class="form-group">
                                    <label for="inputTitle">가격</label>
                                    <p class="form-control">${sellBoard.sellPrice}</p>
                                </div>
                                <div class="form-group" id="content" value="${sellBoard.productContent}">
                                    <label for="inputContent">내용</label>
                                    <p class="form-control">${sellBoard.productContent}</p>
                                </div>
                                <!-- 첨부파일 보여주는 영역 -->
                                <div class="show-file">
                                    <p><img src="/images/upload${mainImgPath}" width="30%"
                                        height="300" alt="썸네일 이미지"></p>
                                </div>
                                
                                <br><br>

                                <c:if test="${sellBoard.sellerId == loginUser.userId || loginUser.auth == 'ADMIN'}">
                                    <button type="button"
                                        onclick="location.href='/modify?productNum=${sellBoard.productNum}'"
                                        class="btn  btn-primary">수정하기</button>
                                </c:if>

                                <c:if test="${sellBoard.sellerId == loginUser.userId || loginUser.auth == 'ADMIN'}">
                                    <button type="button"
                                        onclick="location.href='/delete?productNum=${sellBoard.productNum}'"
                                        class="btn  btn-success">삭제하기</button>
                                </c:if>

                                <button type="button"
                                    onclick="location.href='/?page=${cri.page}&type=${cri.type}&keyword=${cri.keyword}&amount=${cri.amount}&category=${cri.category}' "
                                    class="btn  btn-secondary">목록으로 돌아가기</button>

                            </form><br>

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