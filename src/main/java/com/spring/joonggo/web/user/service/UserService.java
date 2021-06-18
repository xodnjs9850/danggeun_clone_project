package com.spring.joonggo.web.user.service;

import com.spring.joonggo.web.user.domain.LoginInfo;
import com.spring.joonggo.web.user.domain.ModifyUser;
import com.spring.joonggo.web.user.domain.User;
import com.spring.joonggo.web.user.repository.UserMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Service
@RequiredArgsConstructor
public class UserService {

    private final UserMapper userMapper;

    //회원 가입 기능
    public void registerAccount(User user) {
        String userPw = user.getUserPw();
        user.setUserPw(new BCryptPasswordEncoder().encode(userPw)); // 비밀번호 암호화

        userMapper.registerAccount(user);
    }


    /**아이디, 이메일, 닉네임 중복체크
     * @param type 계정, 이메일, 닉네임
     * @param keyword 중복검사값
     * @return 중복이면 true, 아니면 0
     */
    public boolean isDuplicate(String type, String keyword){
        Map<String, Object> checkDataMap = new HashMap<>();
        checkDataMap.put("type", type);
        checkDataMap.put("keyword", keyword);

        return userMapper.isDuplicate(checkDataMap) == 1; // 중복이면 true
    }


    //회원 정보 조회 기능
    public User getUser(String userId) {
        return userMapper.getUser(userId);
    }

    //전체 회원 조회
    public List<User> getAllUser() {
        return userMapper.getAllUser();
    }

    //회원 탈퇴 기능
    public void deleteAccount(String userId) {
        userMapper.deleteAccount(userId);
    }



    //회원 정보 수정
    public User modifyUserInfo(String userId, User user) {
        String userPW = user.getUserPw();
        User originUser = userMapper.getUser(userId);
        user.setUserPw(new BCryptPasswordEncoder().encode(userPW));
        user.setUserId(userId);


        userMapper.modifyUserInfo(user);

        return user;
    }


    //로그인 처리 기능
    public String login(LoginInfo inputUser) {
        User dbUSer = userMapper.getUser(inputUser.getUserId());

        if (dbUSer != null) {
            BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
            if (encoder.matches(inputUser.getUserPw(), dbUSer.getUserPw())){ //입력한 비밀번호와 복호화된 db 비밀번호 일치여부 확인
                return "success";
            } else {
                return "pwFail";
            }
        } else {
            return "idFail";
        }
    }

    //자동로그인 설정 기능
    public void saveKeepLogin(HttpSession session, HttpServletResponse response, String userId) {
        //자동로그인 쿠키 생성
        String sessionId = session.getId();
        Cookie cookie = new Cookie("loginCookie", sessionId);
        //쿠키 설정값 세팅
        cookie.setPath("/");
        //쿠키값 90일 유지
        int limitTime = 60*60*24*90;
        cookie.setMaxAge(limitTime);
        //로컬에 쿠키전송
        response.addCookie(cookie);
        //db에 자동로그인 관련값 저장
        Map<String, Object> keepLoginMap = new HashMap<>();
        keepLoginMap.put("sid", sessionId);
        //자동 로그인 유지시간을 날짜로 변환
        long expireMs = System.currentTimeMillis() + ((long)limitTime * 1000);
        Date limitDate = new Date(expireMs);
        keepLoginMap.put("lt", limitDate);
        keepLoginMap.put("acc", userId);

        userMapper.saveKeepLogin(keepLoginMap);
    }

    //자동로그인 해제 기능
    public void logout(String userId) {
        Map<String, Object> logoutMap = new HashMap<>();
        logoutMap.put("sid", "none");
        logoutMap.put("lt", new Date());
        logoutMap.put("acc", userId);

        userMapper.saveKeepLogin(logoutMap);
    }

    //비밀번호 확인 기능
    public boolean pwCheck(User loginUser) {
        User user = userMapper.getUser(loginUser.getUserId());
        if (user.getUserPw().equals(loginUser.getUserPw())) {
            return true;
        } else {
            return false;
        }
    }






}
