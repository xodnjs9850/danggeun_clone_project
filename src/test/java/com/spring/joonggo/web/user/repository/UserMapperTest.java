package com.spring.joonggo.web.user.repository;

import com.spring.joonggo.web.user.domain.Auth;
import com.spring.joonggo.web.user.domain.ModifyUser;
import com.spring.joonggo.web.user.domain.User;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class UserMapperTest {

    @Autowired
    UserMapper userMapper;


    @Test
    @DisplayName("회원가입 테스트")
    void registerTest(){
        User user = new User();
        user.setUserId("bbb1123");
        user.setUserPw("465798");
        user.setUserEmail("bbb123@naver.com");
        user.setUserNickname("고길동");
        user.setAuth(Auth.USER);
        user.setUserAddress("대전 봉명동");

        userMapper.registerAccount(user);
        System.out.println("user = " + user);
    }
    
    @Test
    @DisplayName("회원탈퇴 테스트")
    void deleteTest(){
        userMapper.deleteAccount("aaa123");
    }

    @Test
    @DisplayName("아이디, 이메일 중복확인 테스트")
    void duplicateTest(){
        String acc = "aaa123";
        String nickname = "고길동";
        String email = "aaa123@naver.com";

        Map<String, Object> datas = new HashMap<>();
        datas.put("type", "userId");
        datas.put("keyword", acc);

/*        datas.put("type", "userEmail");
        datas.put("keyword", email);*/

/*        datas.put("type", "userNickname");
        datas.put("keyword", nickname);*/

        int result = userMapper.isDuplicate(datas);
        assertTrue(result == 1);
    }

    @Test
    @DisplayName("회원 전체조회 테스트")
    void getAllUserTest(){
        List<User> userList = userMapper.getAllUser();
        for (User user : userList) {
            System.out.println(user);
        }
    }

    @Test
    @DisplayName("id로 회원 1명 조회 테스트")
    void getUserTest(){
        User user = userMapper.getUser("aaa123");
        System.out.println("user = " + user);
    }

    @Test
    @DisplayName("회원 정보 수정 테스트")
    void modifyTest(){
        ModifyUser modifyUser = new ModifyUser();
        modifyUser.setUserId("aaa123");
        modifyUser.setUserPw("987654");
        modifyUser.setUserEmail("aaa123@naver.com");
        modifyUser.setUserNickname("도우너");

//        userMapper.modifyUserInfo(modifyUser);
    }
}