<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<!-- [ navigation menu ] start -->
<nav class="pcoded-navbar menu-light">
    <div class="navbar-wrapper">
        <div class="navbar-content scroll-div">
            <div class="">
                <div class="main-menu-header">
                    <img class="img-radius" src="/images/user/user_basic.png"
                        alt="User-Profile-Image">
                    <div class="user-details">
                        <div id="more-details">${loginUser.userId}</div>
                    </div>
                </div>
            </div>
            <ul class="nav pcoded-inner-navbar">
                <li class="nav-item pcoded-menu-caption">
                    <label>중고 거래</label>
                </li>
                <li class="nav-item">
                    <a href="/" class="nav-link "><span class="pcoded-micon">
                            <i class="feather icon-home"></i></span><span class="pcoded-mtext">홈</span></a>
                </li>
                <li class="nav-item pcoded-menu-caption">
                    <label>채팅</label>
                </li>
                <li class="nav-item">
                    <a href="/chatting" class="nav-link "><span class="pcoded-micon">
                            <i class="feather icon-message-circle"></i></span><span class="pcoded-mtext">채팅하기</span></a>
                </li>
                <li class="nav-item pcoded-menu-caption">
                    <label>동네 생활</label>
                </li>
                <li class="nav-item"><a href="/nboard/list" class="nav-link "><span class="pcoded-micon">
                            <i class="feather icon-layout"></i></span><span class="pcoded-mtext">동네생활
                            게시판</span></a></li>

                <li class="nav-item pcoded-menu-caption">
                    <label>나의 당근</label>
                </li>
                <li class="nav-item pcoded-hasmenu">
                    <a href="#!" class="nav-link "><span class="pcoded-micon">
                        <i class="feather icon-lock"></i></span>
                        <span class="pcoded-mtext">프로필</span></a>
                    <ul class="pcoded-submenu">
                        <li><a href="#!" target="_blank">구매내역</a></li>
                        <li><a href="#!" target="_blank">판매내역</a></li>
                        <li><a href="#!" target="_blank">관심상품</a></li>
                        <li><a href="/user/profile">프로필</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</nav>
<!-- [ navigation menu ] end -->