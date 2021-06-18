package com.spring.joonggo.web.comments.service;

import com.spring.joonggo.web.comments.domain.Comment;
import com.spring.joonggo.web.comments.repository.CommentMapper;
import com.spring.joonggo.web.common.paging.Criteria;
import com.spring.joonggo.web.common.paging.PageMaker;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class CommentService {

    private final CommentMapper commentMapper;

    private static final int SUCCESS = 1;

    //댓글 등록 서비스
    public boolean register(Comment comment) {
        return commentMapper.save(comment) == SUCCESS;
    }

    //댓글 삭제 서비스
    public boolean delete(int commentNo) {
        return commentMapper.delete(commentNo) == SUCCESS;
    }

    //댓글 수정 서비스
    public boolean modify(Comment comment) {
        return commentMapper.update(comment) == SUCCESS;
    }

    public Comment read(int commentNo) {
        return commentMapper.read(commentNo);
    }

    //특정 게시글 댓글 목록 조회 서비스
    //리턴 결과물을 두가지로 만듦. (댓글 배열과 총 댓글 수)
    public Map<String, Object> getCommentList(int boardNo, Criteria criteria) {
        Map<String, Object> commentMap = new HashMap<>();
        commentMap.put("commentList", commentMapper.getCommentList(boardNo, criteria));
        int count = commentMapper.getCommentCount(boardNo);
        commentMap.put("count", count);
        commentMap.put("pageInfo", new PageMaker(criteria, count));
        return commentMap;
    }

    //특정 유저의 댓글 목록 조회 서비스
    public Map<String, Object> getUserCommentList(String userId, Criteria criteria) {
        Map<String, Object> commentMap = new HashMap<>();
        commentMap.put("commentList", commentMapper.getUserComment(userId, criteria));
        int count = commentMapper.getUserCommentCount(userId);
        commentMap.put("count", count);
        commentMap.put("pageInfo", new PageMaker(criteria, count));
        return commentMap;
    }


}
