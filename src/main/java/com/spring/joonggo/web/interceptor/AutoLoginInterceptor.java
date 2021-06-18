package com.spring.joonggo.web.interceptor;

import com.spring.joonggo.web.user.domain.User;
import com.spring.joonggo.web.user.repository.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.core.parameters.P;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.util.WebUtils;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Configuration
public class AutoLoginInterceptor implements HandlerInterceptor {

    @Autowired
    private UserMapper userMapper;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        //자동 로그인 쿠키가 존재하는지 확인 - 로컬 쿠키 읽는 메서드
        Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");

        //자동 로그인한 회원 경우 쿠키값과 db 비교
        if(loginCookie != null) {
            String value = loginCookie.getValue(); //로그인 쿠키 값
            User user = userMapper.getUserBySessionId(value);
            if(user != null) {
                //세션에 해당 회원정보 저장
                request.getSession().setAttribute("loginUser", user);
            }
        }
        return true;
    }
}
