package com.spring.joonggo.web.chatting.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter
@ToString
public class ChatMessage {

    private MessageType type;
    private String content;
    private String sender;
    private String roomNum;

}