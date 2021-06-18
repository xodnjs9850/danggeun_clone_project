package com.spring.joonggo.web.user.service;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.spring.joonggo.web.user.domain.OAuthValue;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Service;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

@Service
@Log4j2
public class KakaoService implements OAuthValue, OAuthService {

    //토큰발급 메서드
    @Override
    public String getAccessToken(String authCode) throws Exception {
        String reqURI = "https://kauth.kakao.com/oauth/token"; //요청URI
        URL url = new URL(reqURI); //서버 투 서버 요청 발송 (객체생성)
        HttpURLConnection conn = (HttpURLConnection) url.openConnection(); //url연결, 연결 정보 커넥션 객체에 담기
        conn.setRequestMethod("POST"); //요청정보 설정
        conn.setDoOutput(true); //응답 결과
        sendRequestData(authCode, conn); //파라미터 정보 스트림 통해 전송

        return takeResponseData(conn); //응답 데이터 스트림 통해 읽음
    }

    //데이터 전송
    private void sendRequestData(String authCode, HttpURLConnection conn) {
        try (BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()))) {

            String queryParam = "grant_type=authorization_code"
                    + "&client_id=" + KAKAO_APP_KEY
                    + "&redirect_uri=http://localhost:8181" + KAKAO_REDIRECT_URI
                    + "&code=" + authCode;

            bw.write(queryParam); //스트림을 통해 파라미터 전송
            bw.flush(); //출력버퍼 비우기

            int responseCode = conn.getResponseCode();
            log.info("응답 코드: " + responseCode); //응답 상태코드 200이면 성공

        } catch (Exception e) {
            e.printStackTrace();
        }
    }


    //응답 데이터 읽음
    private String takeResponseData(HttpURLConnection conn) {
        try (BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()))) {

            //응답데이터를 입력스트림으로부터 읽어내기
            String responseData = br.readLine();
            log.info("response-data: " + responseData);

            //JSON 문자열을 Gson라이브러리를 사용하여 자바 객체로 파싱
            JsonParser parser = new JsonParser();//com.google.gson

            //JsonElement는 자바로 변환된 JSON 객체
            JsonElement element = parser.parse(responseData);
            log.info("element: " + element);

            //필요한 데이터를 json프로퍼티 키를 사용해서 추출
            String accessToken = element.getAsJsonObject().get("access_token").getAsString();
            String refreshToken = element.getAsJsonObject().get("refresh_token").getAsString();
            log.info("accessToken : " + accessToken);
            log.info("refreshToken : " + refreshToken);

            return accessToken;

        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    //유저정보 가져오는 메서드
    @Override
    public Map<String, Object> getKakaoUserInfo(String accessToken) throws Exception {

        String reqUrl = "https://kapi.kakao.com/v2/user/me";

        URL url = new URL(reqUrl);
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();

        //요청 메서드 설정
        conn.setRequestMethod("POST");
        conn.setDoOutput(true);

        //요청 헤더정보 설정
        conn.setRequestProperty("Authorization", "Bearer " + accessToken);//Bearer 다음 한 칸 띄고, accessToken

        //요청 보내기
        try (BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()))) {

            //응답 상태코드 200이면 성공
            int responseCode = conn.getResponseCode();
            log.info("보내기 응답 코드: " + responseCode);

        } catch (Exception e) {
            e.printStackTrace();
        }

        //데이터 읽기
        try (BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()))) {

            //응답데이터를 입력스트림으로부터 읽어내기
            String responseData = br.readLine();
            log.info("response-data: " + responseData);

            //JSON 문자열을 Gson라이브러리를 사용하여 자바 객체로 파싱
            JsonParser parser = new JsonParser();//com.google.gson

            //JsonElement는 자바로 변환된 JSON 객체
            JsonElement element = parser.parse(responseData);

            //필요한 데이터를 json프로퍼티 키를 사용해서 추출
            //kakao_account 정보 추출
            JsonObject kakaoAccount
                    = element.getAsJsonObject()
                    .get("kakao_account").getAsJsonObject();

            log.info("카카오계정 정보: " + kakaoAccount);

            String nickname = kakaoAccount.get("profile").getAsJsonObject().get("nickname").getAsString();
            String profileImgPath = kakaoAccount.get("profile").getAsJsonObject().get("profile_image_url").getAsString();
            String email = kakaoAccount.get("email").getAsString();

            log.info("카카오 닉네임 " + nickname);
            log.info("카카오 프로필 이미지 경로 " + profileImgPath);
            log.info("카카오 이메일 " + email);

            //추출한 정보를 맵 또는 카카오 전용 도메인 객체를 만들어서 담아, 리턴
            Map<String, Object> kakakoInfoMap = new HashMap<>();
            kakakoInfoMap.put("nickname", nickname);
            kakakoInfoMap.put("profileImg", profileImgPath);
            kakakoInfoMap.put("email", email);

            return kakakoInfoMap;

        } catch (Exception e) {
            e.printStackTrace();

        }

        return null;
    }


    //로그아웃 요청
    public void logout(String accessToken) throws Exception {

        String reqUrl = "https://kapi.kakao.com//v1/user/logout"; //중복코드 리팩토링하기

        URL url = new URL(reqUrl);
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();

        //요청 메서드 설정
        conn.setRequestMethod("POST");
        conn.setDoOutput(true);

        //요청 헤더정보 설정
        conn.setRequestProperty("Authorization", "Bearer " + accessToken);//Bearer다음 한 칸 띄고, accessToken

        //읽을 때는 그냥 bufferedRead
        try (BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()))) {

            //응답 상태코드 200이면 성공
            int responseCode = conn.getResponseCode();
            log.info("응답 코드(로그아웃) : " + responseCode);

            //응답데이터를 입력스트림으로부터 읽어내기
            String responseData = br.readLine();
            log.info("logout-response-data: " + responseData);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }


}
