package com.spring.joonggo.web.chatting.controller;

import com.spring.joonggo.web.chatting.domain.ChatMessage;
import com.spring.joonggo.web.user.domain.User;
import lombok.extern.log4j.Log4j2;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.Payload;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;

import org.springframework.messaging.simp.SimpMessageHeaderAccessor;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
@Log4j2
public class ChatController {

    /*
    /app로 시작하는 대상이 있는 클라이언트에서 보낸 모든 메시지는 @MessageMapping 어노테이션이 달린
    메서드로 라우팅 됨. 예를 들어 /app/chat.sendMessage 인 메세지는 sendMessage()로 라우팅 되며
    /app/chat.addUser인 메시지는 addUser()로 라우팅됨.
    */

    @GetMapping("/chatting")
    public String chatting() {
        log.info("GET 요청");
        return "chatting/chat";
    }

    @MessageMapping("/chat.sendMessage")
    @SendTo("/topic/public")
    public ChatMessage sendMessage(@Payload ChatMessage chatMessage) {
        return chatMessage;
    }

    @MessageMapping("/chat.addUser")
    @SendTo("/topic/public")
    public ChatMessage addUser(@Payload ChatMessage chatMessage, SimpMessageHeaderAccessor headerAccessor) {
        headerAccessor.getSessionAttributes().put("username", chatMessage.getSender());
        return chatMessage;
    }
}