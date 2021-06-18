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
            <!-- [ breadcrumb ] start -->
            <%@ include file="../include/sitename.jsp" %>
            <!-- [ breadcrumb ] end -->



            <!-- [ Main Content ] start -->
            <div class="row">
                <!-- [ stiped-table ] start -->
                <div class="col-xl-12">
                    <div class="card">
                        <div class="card-header float-effect">
                            <h5>동네생활 게시판</h5>
                            <div class="btn-group card-option ">
                                <button type="button" class="btn dropdown-toggle" data-toggle="dropdown"
                                    aria-haspopup="true" aria-expanded="false">
                                    <i class="feather icon-more-horizontal"></i>
                                </button>
                                <ul class="list-unstyled card-option dropdown-menu dropdown-menu-right">
                                    <li class="dropdown-item full-card"><a href="#!">
                                            <span><i class="feather icon-maximize"></i> maximize</span>
                                            <span style="display:none"><i class="feather icon-minimize"></i>
                                                Restore</span></a></li>
                                    <li class="dropdown-item minimize-card"><a href="#!">
                                            <span><i class="feather icon-minus"></i> collapse</span>
                                            <span style="display:none"><i class="feather icon-plus"></i>
                                                expand</span></a></li>
                                    <li class="dropdown-item reload-card"><a href="#!"><i
                                                class="feather icon-refresh-cw"></i> reload</a></li>
                                    <li class="dropdown-item close-card"><a href="#!"><i class="feather icon-trash"></i>
                                            remove</a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="card-body">
                            <!-- 동네생활 카테고리 -->
                            <ul class="nav nav-tabs mb-3 categories" id="myTab" role="tablist">
                                <li class="nav-item">
                                    <a class="nav-link text-uppercase entire ${pageMaker.criteria.category == 'ALL' || param.category == null ? 'active' : ''}"
                                        id="contact-tab" data-toggle="tab" href="#" role="tab" aria-controls="contact"
                                        aria-selected="false">전체</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link text-uppercase neighbor ${pageMaker.criteria.category == 'NEIGHBOR' ? 'active' : ''}"
                                        id="contact-tab" data-toggle="tab" href="#" role="tab" aria-controls="contact"
                                        aria-selected="false">우리동네</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link text-uppercase issue ${pageMaker.criteria.category == 'ISSUE' ? 'active' : ''}"
                                        id="contact-tab" data-toggle="tab" href="#" role="tab" aria-controls="contact"
                                        aria-selected="false">사건/사고</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link text-uppercase dailylife ${pageMaker.criteria.category == 'DAILYLIFE' ? 'active' : ''}"
                                        id="contact-tab" data-toggle="tab" href="#" role="tab" aria-controls="contact"
                                        aria-selected="false">일상&자유</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link text-uppercase notice ${pageMaker.criteria.category == 'NOTICE' ? 'active' : ''}"
                                        id="contact-tab" data-toggle="tab" href="#" role="tab" aria-controls="contact"
                                        aria-selected="false">공지사항</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link text-uppercase etc ${pageMaker.criteria.category == 'ETC' ? 'active' : ''}"
                                        id="contact-tab" data-toggle="tab" href="#" role="tab" aria-controls="contact"
                                        aria-selected="false">기타</a>
                                </li>
                                <div class="search-icon">
                                    <li class="nav-item">
                                        <a href="#" class="pop-search"><i class="feather icon-search"></i></a>
                                    </li>
                                </div>
                            </ul>


                            <!-- 검색창 -->
                            <ul class="navbar-nav mr-auto">
                                <form class="search-bar" action="/nboard/list">
                                    <div class="input-select float-effect">
                                        <input type="hidden" name="amount" value="${pageMaker.criteria.amount}">
                                        <input type="hidden" name="category" value="${pageMaker.criteria.category}">
                                        <select class="select-inner" name="type">
                                            <option value="title" ${pageMaker.criteria.type=='title' ? 'selected' : ''
                                                }>제목
                                            </option>
                                            <option value="nickname" ${pageMaker.criteria.type=='nickname' ? 'selected'
                                                : '' }>작성자</option>
                                            <option value="content" ${pageMaker.criteria.type=='content' ? 'selected'
                                                : '' }>내용</option>
                                            <option value="titleContent" ${pageMaker.criteria.type=='titleContent'
                                                ? 'selected' : '' }>제목
                                                + 내용</option>
                                        </select>
                                    </div>
                                    <div class="float-effect">
                                        <input id="search" type="text" name="keyword" class="form-control"
                                            placeholder="검색어를 입력하세요" value="${pageMaker.criteria.keyword}" />
                                    </div>
                                    <div class="float-effect">
                                        <button class="btn  btn-primary btn-search" type="submit"><i
                                                class="feather icon-corner-down-right"></i></button>
                                    </div>
                                    <button type="button" class="close" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </form>
                            </ul>
                            <!-- 검색창 종료 -->




                            <div class="card-body table-border-style">
                                <div class="table-responsive">
                                    <table class="table table-hover mb-0">
                                        <thead>
                                            <tr>
                                                <th>번호</th>
                                                <th>닉네임</th>
                                                <th>제목</th>
                                                <th>내용</th>
                                                <th>조회수</th>
                                                <th>추천수</th>
                                                <th>작성일자</th>
                                            </tr>
                                        </thead>

                                        <!-- 반복문 -->
                                        <tbody>
                                            <c:forEach var="board" items="${nBoardList}">
                                                <tr>
                                                    <td id="boardNo" value="${board.boardNo}">${board.boardNo}</td>
                                                    <td id="userNickName" value="${board.userNickName}">
                                                        ${board.userNickName}</td>
                                                    <td id="title" value="${board.title}">
                                                        <a
                                                            href="/nboard/detail${pageMaker.makeParam(pageMaker.criteria.page)}&boardNo=${board.boardNo}&vf=true">${board.title}</a>
                                                        <c:if test="${board.newBoard}">
                                                            <span class="badge badge-pill badge-success">New</span>
                                                        </c:if>
                                                    </td>
                                                    <td id="content" value="${board.content}">${board.content}</td>
                                                    <td id="views" value="${board.views}">${board.views}</td>
                                                    <td id="recommend" value="${board.recommend}">${board.recommend}
                                                    </td>
                                                    <td id="postDate" value="${board.postDate}">
                                                        <fmt:formatDate value="${board.postDate}"
                                                            pattern="yyyy년 MM월 dd일 HH:mm:ss" />
                                                    </td>

                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>

                                    <!-- 페이지 영역 -->
                                    <ul class="pagination">

                                        <c:if test="${pageMaker.prev}">

                                            <li class="page-item">
                                                <a class="page-link"
                                                    href="/nboard/list${pageMaker.makeParam(pageMaker.beginPage-1)}"
                                                    aria-label="Previous">
                                                    <span aria-hidden="true">&laquo;</span>
                                                    <span class="sr-only">Previous</span>
                                                </a>
                                            </li>
                                        </c:if>

                                        <!-- li*5>a{[$]} -->
                                        <c:forEach var="i" begin="${pageMaker.beginPage}" end="${pageMaker.endPage}"
                                            step="1">

                                            <li class="page-item"><a class="page-link"
                                                    href="/nboard/list${pageMaker.makeParam(i)}">${i}</a></li>
                                            <!-- makeParam은 메서드이기 때문에 ()를 붙여서 call 해줌 -->
                                        </c:forEach>

                                        <c:if test="${pageMaker.next}">
                                            <li class="page-item">
                                                <a class="page-link"
                                                    href="/nboard/list${pageMaker.makeParam(pageMaker.endPage+1)}"
                                                    aria-label="Next">
                                                    <span aria-hidden="true">&raquo;</span>
                                                    <span class="sr-only">Next</span>
                                                </a>
                                            </li>
                                        </c:if>
                                    </ul>
                                    <!-- 페이지 영역 종료 -->
                                </div>
                            </div>
                            <!-- 게시글 작성 버튼 -->
                            <div class="fixed-button active">
                                <a href="/nboard/register" class="btn btn-md btn-primary">
                                    <i class="fa fa-plus-circle" aria-hidden="true"></i> 글 작성</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- [ stiped-table ] end -->
        </div>
        <!-- [ Main Content ] end -->
    </div>


    <!-- <script src="/js/nboard-category.js"></script> -->
    <script>
        $(function () {
            console.log("content-list script 시작33333");

            console.log("content-list script 시작");
            $('.neighbor').on('click', e => {
                console.log("neighbor 클릭이벤트!");
                location.href =
                    "/nboard/list${pageMaker.makeParam(pageMaker.criteria.page, pageMaker.criteria.amount, 'NEIGHBOR')}";
            })
            $('.issue').on('click', e => {
                console.log("issue 클릭이벤트!");
                console.log(e.target);
                location.href =
                    "/nboard/list${pageMaker.makeParam(pageMaker.criteria.page, pageMaker.criteria.amount, 'ISSUE')}";
            });
            $('.dailylife').on('click', e => {
                console.log("daily 클릭이벤트!");
                console.log(e.target);
                location.href =
                    "/nboard/list${pageMaker.makeParam(pageMaker.criteria.page, pageMaker.criteria.amount, 'DAILYLIFE')}";
            });
            $('.notice').on('click', e => {
                console.log("notice 클릭이벤트!");
                console.log(e.target);
                location.href =
                    "/nboard/list${pageMaker.makeParam(pageMaker.criteria.page, pageMaker.criteria.amount, 'NOTICE')}";
            });
            $('.etc').on('click', e => {
                console.log("etc 클릭이벤트!");
                console.log(e.target);
                location.href =
                    "/nboard/list${pageMaker.makeParam(pageMaker.criteria.page, pageMaker.criteria.amount, 'ETC')}";
            });
            $('.entire').on('click', e => {
                console.log("all 클릭이벤트!");
                console.log(e.target);
                location.href =
                    "/nboard/list${pageMaker.makeParam(pageMaker.criteria.page, pageMaker.criteria.amount, 'ALL')}";
            });

        });
    </script>

</body>

</html>