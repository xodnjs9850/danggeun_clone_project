package com.spring.joonggo.web.nboard.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.util.Date;

//DTO역할
@Getter
@Setter
@ToString
public class DummyNBoard {

    private int boardNo; //게시글 번호
    private String userId; //게시글 작성자 아이디
    private String userNickName; //게시글 작성자 닉네임
    private String Title; //게시글 제목
    private String content; //게시글 내용
    private int views; //게시글 조회수
    private int recommend; //게시글 추천수
    private Date postDate; //작성일자
    private Category category;  //게시글 카테고리

}
