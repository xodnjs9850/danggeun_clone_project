package com.spring.joonggo.web.comments.repository;

import com.spring.joonggo.web.comments.domain.Comment;
import com.spring.joonggo.web.common.paging.Criteria;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface CommentMapper {

    //댓글 입력
    int save(Comment comment);

    //댓글 수정
    int update(Comment comment);

    //댓글 삭제
    int delete(int commentNo);

    //단일 댓글 조회
    Comment read(int commentNo);

    //특정 게시글 댓글 목록 조회
    List<Comment> getCommentList(@Param("bno") int boardNo
                                , @Param("cri") Criteria cri);

    //특정 게시글의 댓글 총 개수 조회
    int getCommentCount(int boardNo);

    //특정 작성자의 댓글 목록 조회
    List<Comment> getUserComment(@Param("uid") String userId
                               , @Param("cri") Criteria cri);

    //특정 작성자의 댓글 총 개수 조회
    int getUserCommentCount(String userId);
}
