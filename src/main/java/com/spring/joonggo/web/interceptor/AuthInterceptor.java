package com.spring.joonggo.web.interceptor;

import lombok.extern.log4j.Log4j2;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Configuration
@Log4j2
public class AuthInterceptor implements HandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

        log.info("인터셉터 작동 중 : 권한 검증");
        HttpSession session = request.getSession();

        if(session.getAttribute("loginUser") == null){ //로그인 안 했을 경우
            response.sendRedirect("/user/sign-in"); //url 지정하기 (다시 회원가입 or 로그인 페이지로)
            log.info("인터셉터 작동 : 회원 검증 실패!");
            return false; //진입 실패
        }
        log.info("인터셉터 작동 : 회원 검증 성공!");
        return true; //진입 허용
    }
}
