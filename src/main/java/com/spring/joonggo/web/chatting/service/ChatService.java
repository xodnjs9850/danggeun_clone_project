package com.spring.joonggo.web.chatting.service;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.spring.joonggo.web.chatting.domain.ChatMessage;
import com.spring.joonggo.web.chatting.domain.ChatRoom;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Service;

import java.io.ObjectInput;
import java.util.LinkedHashMap;
import java.util.Map;

@Log4j2
@RequiredArgsConstructor
@Service
public class ChatService {

    private final ObjectMapper objectMapper;
    private Map<String, ChatRoom> chatRoom;

    private void init() {
        chatRoom = new LinkedHashMap<>();
    }

//    public List<>


}
