package com.spring.joonggo.web.chatting.domain;


import com.spring.joonggo.web.chatting.service.ChatService;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.springframework.web.socket.WebSocketSession;

import java.util.HashSet;
import java.util.Set;

@Getter @Setter
@ToString
public class ChatRoom {

    private String roomNum;
    private String roomName;
    private Set<WebSocketSession> sessions = new HashSet<>();

    @Builder
    private ChatRoom(String roomNum, String roomName) {
        this.roomNum = roomNum;
        this.roomName = roomName;
    }

    private void handleActions(WebSocketSession session, ChatMessage chatMessage, ChatService chatService) {
        if (chatMessage.getType().equals(MessageType.JOIN)) {
            sessions.add(session);
            chatMessage.setContent(chatMessage.getSender() + "님이 입장했습니다.");
        }
        sendMessage(chatMessage, chatService);
    }

    private <T> void sendMessage(T message, ChatService chatService) {

//       sessions.parallelStream().forEach(sessions  -> chatService.);

    }

}
