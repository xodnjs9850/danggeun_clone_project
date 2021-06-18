package com.spring.joonggo.web.user.repository;

import com.spring.joonggo.web.user.domain.ModifyUser;
import com.spring.joonggo.web.user.domain.User;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface UserMapper {

    //회원 가입 기능
    void registerAccount(User user);

    //아이디, 이메일, 닉네임 중복체크
    int isDuplicate(Map<String, Object> datas);

    //회원 정보 조회 기능
    User getUser(String userId);

    //전체 회원 조회
    List<User> getAllUser();

    //회원 탈퇴 기능
    void deleteAccount(String userId);

    //회원 정보 수정
    void modifyUserInfo(User user);

    //자동로그인 관련 기능
    void saveKeepLogin(Map<String, Object> datas);

    //세션 아이디값을 통한 회원정보 조회
    User getUserBySessionId(String sessionId);

}
