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
                            <h5>동네생활 게시판</h5>
                        </div>
                        <div class="card-body">
                            <h5>글 정보</h5>
                            <hr>
                            <div class="row">
                                <div class="col-md-6">
                                    <form>
                                        <div class="form-group" id="boardNo" value="${board.boardNo}">
                                            <label for="exampleInputNo">글번호</label>
                                            <p class="form-control">${board.boardNo}</p>
                                        </div>
                                        <div class="form-group" id="views" value="${board.views}">
                                            <label for="exampleInputUserId">조회수</label>
                                            <p class="form-control">${board.views}</p>
                                        </div>
                                        <div class="form-group" id="postDate" value="${board.postDate}">
                                            <label>작성시간</label>
                                            <p class="form-control">
                                                <fmt:formatDate value="${board.postDate}"
                                                    pattern="yyyy년 MM월 dd일 HH:mm:ss" />
                                            </p>
                                            <!-- 안나옴 -->
                                        </div>

                                    </form>
                                </div>

                                <div class="col-md-6">
                                    <form>
                                        <div class="form-group" id="userNickName" value="${board.userNickName}">
                                            <label for="exampleInputNo">닉네임</label>
                                            <p class="form-control">${board.userNickName}</p>
                                        </div>
                                        <div class="form-group" id="recommend" value="${board.recommend}">
                                            <label for="exampleInputUserId">추천수</label>
                                            <p class="form-control">${board.recommend}</p>
                                        </div>
                                        <div class="form-group" id="category" value="${board.category}">
                                            <label for="exampleFormControlSelect1">카테고리</label>
                                            <p class="form-control">${board.category}</p>
                                        </div>
                                    </form>
                                </div>
                            </div>

                            <h5 class="mt-5">글 내용</h5>
                            <hr>
                            <form>
                                <div class="form-group" id="title" value="${board.title}">
                                    <label for="inputTitle">제목</label>
                                    <p class="form-control">${board.title}</p>

                                </div>
                                <div class="form-group" id="content" value="${board.content}">
                                    <label for="inputContent">내용</label>
                                    <p class="form-control">${board.content}</p>
                                </div>
                                <!-- 첨부파일 영역 -->
                                <!-- <div class="custom-file">
                                    <input type="file" class="custom-file-input" id="validatedCustomFile" required>
                                    <label class="custom-file-label" for="validatedCustomFile">파일 업로드
                                        비활성화하기!!!!!!</label>
                                </div> -->
                                <br><br>
                                
                                <c:if test="${board.userId == loginUser.userId || loginUser.auth == 'ADMIN'}">
                                <button type="button"
                                    onclick="location.href='/nboard/modify?boardNo=${board.boardNo}&vf=false'"
                                    class="btn  btn-primary">수정하기</button>
                                </c:if>

                                <c:if test="${board.userId == loginUser.userId || loginUser.auth == 'ADMIN'}">
                                <button type="button" onclick="location.href='/nboard/delete?boardNo=${board.boardNo}'"
                                    class="btn  btn-success">삭제하기</button>
                                    </c:if>
                                
                                <!-- <button type="button" class="btn disabled btn-secondary">목록으로 돌아가기</button> -->
                                <!-- <button type="button" onclick="location.href='nboard-list.html' " class="btn disabled btn-secondary">목록으로 돌아가기</button> -->
                                <button type="button"
                                    onclick="location.href='/nboard/list?page=${cri.page}&type=${cri.type}&keyword=${cri.keyword}&amount=${cri.amount}&category=${cri.category}' "
                                    class="btn  btn-secondary">목록으로 돌아가기</button>
                            </form><br>

                        </div>
                    </div>
                </div>
                <!-- [ form-element ] end -->

                <!-- [ reply ] start -->
                <div class="col-sm-12">
                    <div class="card">
                        <div class="card-header">
                            <h5>댓글목록(<span id="commentCnt"></span>)</h5>
                        </div>
                        <div class="card-body">
                            
                                <div class="row">
                                    <div class="col-md-9">
                                        <div class="form-group">
                                            <label for="newCommentText" hidden>댓글 내용</label>
                                            <textarea rows="3" id="newCommentText" name="commentText"
                                                class="form-control" placeholder="댓글을 입력해주세요."></textarea>
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <label for="newCommentWriter" hidden>댓글 작성자</label>
                                            <button id="commentAddBtn" class="btn  btn-primary btn-lg">등록하기</button>
                                        </div>
                                    </div>
                                </div>
                            

                            <br>
                            <!-- 댓글 내용 헤더 -->
                            <table class="table table-hover">
                                <thead>
                                    <tr class="table-active">
                                        <th scope="col">닉네임</th>
                                        <th scope="col">댓글내용</th>
                                        <th scope="col">작성일자</th>
                                        <th scope="col">수정</th>
                                        <th scope="col">삭제</th>
                                    </tr>
                                </thead> 
                                <!-- 댓글 내용 바디  -->
                                <tbody id="commentData" class="comment-list">

                                </tbody>
                                    
                            </table>
                            <!-- 댓글 페이징 영역 -->
                            <ul class="pagination">

                            </ul>
                        </div>
                    </div>
                    <!-- [ reply ] end -->

                </div>
            </div>
            <!-- [ Main Content ] end -->
        </div>
    </div>

    <!-- 댓글 수정 모달 -->
    <div class="modal fade bd-example-modal-lg" id="commentModifyModal">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">

                <!-- Modal Header -->
                <div class="modal-header" style="background: #FD7E14; color: white;">
                    <h4 class="modal-title">댓글 수정하기</h4>
                    <button type="button" class="close text-white" data-dismiss="modal">X</button>
                </div>

                <!-- Modal body -->
                <div class="modal-body">
                    <div class="form-group">
                        <input id="modCommentNo" type="hidden">
                        <label for="modCommentText" hidden>댓글내용</label>
                        <textarea id="modCommentText" class="form-control" placeholder="수정할 댓글 내용을 입력하세요."
                            rows="3"></textarea>
                    </div>
                </div>

                <!-- Modal footer -->
                <div class="modal-footer">
                    <button id="commentModBtn" type="button" class="btn btn-orange">수정</button>
                    <button type="button" class="btn btn-danger" data-dismiss="modal">닫기</button>
                </div>


            </div>
        </div>
    </div>

    <!-- end replyModifyModal -->

    <!-- 댓글 관련 스크립트 -->
    <script>
        $(function () {
            //원본글 번호
            const boardNo = '${board.boardNo}';
            console.log("원본 글 번호 : " + boardNo);

            //날짜 포맷 변환 함수
            function formatDate(datetime) {
                //문자열 날짜 데이터를 날짜객체로 변환
                const dateObj = new Date(datetime);
                // console.log(dateObj);
                //날짜객체를 통해 각 날짜 정보 얻기
                let year = dateObj.getFullYear();
                let month = dateObj.getMonth() + 1; //1월을 0으로 가져오고 12월을 11로 가져오는 등 1을 부족하게 가져오기때문에 1을 더해줘야 함.
                let day = dateObj.getDate();
                let hour = dateObj.getHours();
                let minute = dateObj.getMinutes();

                //오전, 오후 시간체크
                let ampm = '';
                if (hour < 12 && hour >= 6) {
                    ampm = '오전';
                } else if (hour >= 12 && hour < 21) {
                    ampm = '오후';
                    if (hour !== 12) {
                        hour -= 12;
                    }
                } else if (hour >= 21 && hour <= 24) {
                    ampm = '밤';
                    hour -= 12;
                } else {
                    ampm = '새벽';
                }

                //숫자가 1자리일 경우 2자리로 변환
                (month < 10) ? month = '0' + month: month;
                (day < 10) ? day = '0' + day: day;
                (hour < 10) ? hour = '0' + hour: hour;
                (minute < 10) ? minute = '0' + minute: minute;

                return year + "-" + month + "-" + day + " " + ampm + " " + hour + ":" + minute;

            }

            //댓글 페이지 태그 생성 배치 함수
            function makePageInfo(pageInfo) {
                let tag = "";

                const begin = pageInfo.beginPage;
                const end = pageInfo.endPage;

                //이전 버튼 만들기
                if (pageInfo.prev) {
                    tag += "<li class='page-item'><a class='page-link' href='" + (begin - 1) +"' aria-label='Previous'><span aria-hidden='true'>&laquo;</span><span class='sr-only'>Previous</span></a></li>";
                }

                //페이지 번호 리스트 만들기
                for (let i = begin; i <= end; i++) {
                    const active = (pageInfo.criteria.page === i) ? 'page-active' : '';
                    tag += "<li class='page-item'><a class='page-link' href='" + i + "'>" + i + "</a></li>";
                    //active는 클릭한 태그의 뒷배경 색을 넣는 클래스
                }

                //다음 버튼 만들기
                if (pageInfo.next) {
                    tag += "<li class='page-item'><a class='page-link' href='" + (end + 1) +"' aria-label='Previous'><span aria-hidden='true'>&laquo;</span><span class='sr-only'>Next</span></a></li>";
                }

                $('.pagination').html(tag);

            };

            function makeCommentListDom(commentMap) {
                let tag = '';

                for (let comment of commentMap.commentList) {

                    // 댓글 내용
            
                    tag += "<tr id='commentList' data-commentNo='" + comment.commentNo + "' data-userId='" + comment.userId + "'>" +
                    "<td id='commentUserNickName' data-commentNick='" + comment.userNickName + "'>" + comment.userNickName + "</td>" +
                        "<td id='commentContent' data-commentContent='" + comment.commentContent + "'>" + comment.commentContent + "</td>" +
                        "<td id='commentDate' data-commentDate='" + comment.commentCreatedDate + "'>" + comment.commentCreatedDate + "</td>" +
                        "<td>" +
                        "   <a class='modi' href='#' value='" + comment.commentNo + "'>" +
                        "       <div class='modify' id='commentModBtn'>" +
                        "           <span class='lnr lnr-undo' id='commentModButton'></span>" +
                        "       </div>" +
                        "   </a>" +
                        "</td>" +
                        "<td>" +
                        "   <a href='#'>" +
                        "       <div class='remove' id='commentDelBtn'>" +
                        "           <span class='lnr lnr-cross-circle' id='commentDelButton'></span>" +
                        "       </div>" +
                        "   </a>" +
                        "</td>" +
                        "</tr>";

                }
                //만든 태그를 댓글목록 안에 배치
                $('#commentData').html(tag);

                //댓글 수 배치
                console.log(commentMap.count);
                $('#commentCnt').text(commentMap.count);

                //페이지 태그 배치
                makePageInfo(commentMap.pageInfo);

            };

            //댓글 목록 비동기 요청처리 함수
            function getCommentList(page) {
                fetch('/api/comment/' + boardNo + "/" + page)
                .then(res => res.json())
                .then(commentMap => {
                    console.log(commentMap);
                    makeCommentListDom(commentMap);
                });
            };

            //페이지 첫 진입시 비동기로 댓글목록 1페이지를 불러옴
            getCommentList(1);

            //페이지 버튼 클릭 이벤트
            $('.pagination').on('click', 'li a', e => { //'li a'는 e.target == 'li a'와 같은 의미
                e.preventDefault();
                getCommentList(e.target.getAttribute('href'));
                console.log($(this));
                //아래는 JQuery 버전. $(this)가 e.target
                // getReplyList($(this).attr('href'));
            });

            //댓글 등록 버튼 클릭 이벤트
            $('#commentAddBtn').on('click', e => {

                e.preventDefault();

                //댓글객체
                const replyInfo = {
                        boardNo: boardNo,
                        commentContent: $('#newCommentText').val(),
                        userId: '${loginUser.userId}',
                        userNickName: '${loginUser.userNickname}'
                    };

                    console.log(replyInfo);

                //서버로 댓글 내용을 전송해서 DB에 저장
                const reqInfo = {
                    method: 'POST', //요청 방식
                    headers: {
                        'content-type': 'application/json'
                    },
                    body: JSON.stringify(replyInfo)
                };
                fetch('/api/comment', reqInfo)
                .then(res => res.text())
                .then(msg => {
                    if (msg === 'insertSuccess') {
                        getCommentList(1);
                        $('newCommentText').val('');
                    } else {
                        alert('댓글 등록에 실패했습니다.')
                    }
                })
            });

            const $modal = $('#commentModifyModal');
            //댓글 수정 버튼 클릭 이벤트
            $('#commentData').on('click', '#commentModButton', e => {
                // console.log(e.target);
                e.preventDefault();
                const loginUser = '${loginUser.userId}';
                const writeUser = e.target.parentNode.parentNode.parentNode.parentNode.dataset.userid;
                
                console.log("로그인 중인 유저ID" + loginUser);
                console.log("클릭 타겟" + e.target);
                console.log("댓글 작성 유저ID" + writeUser);
                if (loginUser != writeUser) {
                    alert('작성자 본인만 댓글을 수정/삭제할 수 있습니다.');
                    return;
                }

                //모달 띄우기
                $modal.modal('show');

                const originText = e.target.parentNode.parentNode.parentNode.parentNode.children[1].dataset.commentcontent;
                // console.log(originText);
                $('#modCommentText').val(originText);

                //모달이 열릴 때 모달안에 댓글번호 넣어놓기
                const commentNo = e.target.parentNode.parentNode.parentNode.parentNode.dataset.commentno;
                console.log("댓글번호123" + commentNo);

                $('#modCommentNo').val(commentNo);
            });

            //모달창 닫기 이벤트
            $('.modal-header button, .modal-footer button').on('click', e => {
                $modal.modal('hide');

            });

            //댓글 수정 요청 이벤트
            $('#commentModBtn').on('click', e => {
                //댓글 번호
                const commentNo = $('#modCommentNo').val();
                // console.log("댓글 번호 : " + commentNo);
                const commentText = $('#modCommentText').val();
                
                const reqInfo = {
                    method: 'PUT',
                    headers: {
                        'content-type': 'application/json'
                    },
                    body: JSON.stringify({
                        commentNo: commentNo,
                        commentContent: commentText,
                        userId: '${loginUser.userId}',
                        userNickName: '${loginUser.userNickname}'
                    })
                }
                //비동기로 수정 요청
                fetch('/api/comment/' + commentNo, reqInfo)
                    .then(res => res.text())
                    .then(msg => {
                        if (msg === 'modSuccess') {
                            $modal.modal('hide');
                            getCommentList(1);
                        } else {
                            alert("댓글 수정에 실패했습니다.");
                        }
                    })
            });

            //댓글 삭제 비동기 요청 이벤트
            $('#commentData').on('click', '#commentDelButton', e => {

                e.preventDefault();
                const loginUser = '${loginUser.userId}';
                const writeUser = e.target.parentNode.parentNode.parentNode.parentNode.dataset.userid;
                if (loginUser != writeUser) {
                    alert('작성자 본인만 댓글을 수정/삭제할 수 있습니다.');
                    return;
                }

                console.log(e.target);
                const commentNo = e.target.parentNode.parentNode.parentNode.previousSibling.children[0].getAttribute('value');
                console.log(commentNo);

                const reqInfo = {
                    method: 'DELETE'
                }

                if (!confirm("정말로 삭제하시겠습니까?")) {
                    return;
                }
                fetch('/api/comment/' + commentNo, reqInfo)
                .then(res => res.text())
                .then(msg => {
                    if (msg === 'delSuccess') {
                            getCommentList(1);
                        } else {
                            alert('댓글 삭제에 실패했습니다.');
                        }
                })
            })


        })
    </script>
</body>

</html>