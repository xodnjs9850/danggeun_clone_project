package com.spring.joonggo.web.comments.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.util.Date;

@Getter
@Setter
@ToString
public class Comment {

    private int commentNo;              //댓글 번호
    private String commentContent;      //댓글 내용
    private Date commentCreatedDate;    //댓글 작성시간
    private int boardNo;                //게시판 번호
    private String userId;              //작성자 아이디
    private String userNickName;        //작성자 닉네임


}
