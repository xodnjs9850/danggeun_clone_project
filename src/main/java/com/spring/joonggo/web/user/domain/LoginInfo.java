package com.spring.joonggo.web.user.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter
@ToString
public class LoginInfo {

    private String userId; //아이디
    private String userPw; //비밀번호
    private boolean autoLogin; //자동로그인 여부
}
