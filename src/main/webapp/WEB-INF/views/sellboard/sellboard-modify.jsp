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
            <!-- [ breadcrumb ] start -->
            <%@ include file="../include/sitename.jsp" %>
            <!-- [ breadcrumb ] end -->


            <!-- [ Main Content ] start -->
            <div class="row">
                <!-- [ form-element ] start -->
                <div class="col-sm-12">
                    <div class="card">
                        <div class="card-header">
                            <h5>중고거래 게시판</h5>
                        </div>
                        <div class="card-body">
                            <h5>글 작성</h5>
                            <hr>
                            <form action="/modify" method="POST">
                                <div class="row">
                                    <div class="col-md-6">
                                        <input type="hidden" name="productNum" value="${sellBoard.productNum}">
                                        <input type="hidden" name="sellerId" value="${loginUser.userId}">
                                        <input type="hidden" name="sellerNick" value="${loginUser.userNickname}">
                                        <div class="form-group">
                                            <label>닉네임</label>
                                            <p class="form-control">${loginUser.userNickname}</p>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>지역</label>
                                            <textarea class="form-control" name="sellArea" id="inputTitle"
                                                placeholder="판매 지역을 작성해주세요.">${sellBoard.sellArea}</textarea>
                                        </div>
                                    </div>
                                </div>

                                <h5 class="mt-5">글 상세내용 작성</h5>
                                <hr>

                                <div class="form-group">
                                    <label for="inputTitle">제목</label>
                                    <textarea class="form-control" name="productName" id="inputTitle"
                                        placeholder="게시글 제목을 작성해주세요.">${sellBoard.productName}</textarea>
                                </div>
                                <div class="form-group">
                                    <label for="exampleFormControlSelect1">카테고리</label>
                                    <select class="form-control" name="sellCategory" id="category">
                                        <option value="CLOTHING">의류</option>
                                        <option value="ELECTRONIC">전자기기</option>
                                        <option value="HOME">가전가구</option>
                                        <option value="LIVING">생활용품</option>
                                        <option value="REMARK">기타</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label for="inputTitle">가격</label>
                                    <textarea class="form-control" name="sellPrice" id="inputTitle" placeholder="₩">${sellBoard.sellPrice}</textarea>
                                </div>
                                <div class="form-group">
                                    <label for="inputContent">내용</label>
                                    <textarea class="form-control" name="productContent" id="inputContent"
                                        placeholder="게시글 내용을 작성해주세요. (가품 및 판매금지품목은 게시가 제한될 수 있습니다.)">${sellBoard.productContent}</textarea>
                                </div>
                                <!-- <div class="custom-file">
                                    <input type="file" class="custom-file-input" id="validatedCustomFile" required>
                                    <label class="custom-file-label" for="validatedCustomFile">파일 찾아보기</label>
                                </div><br><br> -->
                                <button type="submit" class="btn  btn-primary">수정하기</button>
                            </form>

                        </div>
                    </div>
                </div>
                <!-- [ form-element ] end -->
            </div>
            <!-- [ Main Content ] end -->

        </div>
    </div>

</body>

</html>