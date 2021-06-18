package com.spring.joonggo.web.user.service;

import java.util.Map;

public interface OAuthService {

    //액세스 토큰 발급 메서드
    String getAccessToken(String authCode) throws Exception;

    Map<String, Object> getKakaoUserInfo(String accessToken) throws Exception;

    //로그아웃 메서드
    void logout(String accessToken) throws Exception;
}
