package com.spring.joonggo.web.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.messaging.simp.config.MessageBrokerRegistry;
import org.springframework.web.socket.config.annotation.EnableWebSocketMessageBroker;
import org.springframework.web.socket.config.annotation.StompEndpointRegistry;
import org.springframework.web.socket.config.annotation.WebSocketMessageBrokerConfigurer;

@Configuration
@EnableWebSocketMessageBroker
// WebSocket 서버를 활성화

public class WebSocketConfig implements WebSocketMessageBrokerConfigurer {
    // 웹 소켓 연결을 구성하기 위한 메서드를 구현하고 제공
    /*
        기본 동작 방식
        : WebSocket을 이용 서버와의 정기적인 HTTP 연결을 설정
         Upgrade헤더를 전송하여 양방향 웹 소켓 연결로 업그레이드함

         Upgrade헤더
         : HTTP 1.1 (전용) Upgrade 헤더를 사용하여 이미 설정된 클라이언트 / 서버 연결을 다른 프로토콜
         (동일한 전송 프로토콜을 통해 )로 업그레이드 할 수 있음
          HTTP 또는 HTTPS 연결을 WebSocket으로 업그레이드하는 데 사용
    */

    @Override
    public void registerStompEndpoints(StompEndpointRegistry registry)
    // 클라이언트가 웹 소켓 서버에 연결하는 데 사용할 웹 소켓 엔드 포인트를 등록
    {
        registry.addEndpoint("/ws").withSockJS();
        // SockJS는 웹 소켓을 지원하지 않는 브라우저에 폴백 옵션을 활성화하는 데 사용
        // Fallback : 어떤 기능이 약해지거나 제대로 동작하지 않을 때, 이에 대처하는 기능 또는 동작
    }


    @Override
    public void configureMessageBroker(MessageBrokerRegistry registry) {
        /*
         한 클라이언트에서 다른 클라이언트로 메시지를 라우팅 하는데 사용될 메시지 브로커를 구성
         메시지 브로커 : 송신자의 이전 메시지 프로토콜로부터
         메시지를 수신자의 이전 메시지 프로토콜로 변환하는 중간 컴퓨터 프로그램 모듈
        */

        registry.setApplicationDestinationPrefixes("/app");
        //  /app으로 시작되는 메시지가 message-handling methods으로 라우팅 되어야 한다는 것을 명시

        registry.enableSimpleBroker("/topic");
        /*
        /topic으로 시작되는 메시지가 메시지 브로커로 라우팅 되도록 정의
          메시지 브로커는 연결된 모든 클라이언트에게 메시지를 broadcast
        */
    }

}