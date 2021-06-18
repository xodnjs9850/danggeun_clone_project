package com.spring.joonggo.web.comments.repository;

import com.spring.joonggo.web.comments.domain.Comment;
import com.spring.joonggo.web.common.paging.Criteria;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class CommentMapperTest {

    @Autowired
    CommentMapper commentMapper;

    @Test
    @DisplayName("입력받은 Comment 데이터를 DB에 정상적으로 저장해야 한다.")
    void insertTest() {
        Comment comment = new Comment();
        comment.setBoardNo(1);
        comment.setUserId("가나다");
        comment.setUserNickName("테스트 작성자");
        comment.setCommentContent("테스트용 댓글입니다.");

        commentMapper.save(comment);
    }

    @Test
    @DisplayName("여러 댓글들을 DB에 정상적으로 저장해야 한다.")
    void bulkInsertTest() {
        for (int i = 100; i < 130; i++) {
            Comment comment = new Comment();
            comment.setBoardNo(101);
            comment.setUserId("사용자" + i);
            comment.setUserNickName("닉네임" + i);
            comment.setCommentContent("댓글 내용 " + i);

            commentMapper.save(comment);
        }
    }

    @Test
    @DisplayName("특정 댓글이 DB에서 정상적으로 삭제되어야 한다.")
    void deleteTest() {
        commentMapper.delete(2);
    }

    @Test
    @DisplayName("특정 댓글의 데이터를 변경하여 DB에 저장해야 한다.")
    void modifyTest() {
        Comment comment = new Comment();
        comment.setCommentNo(3);
        comment.setCommentContent("변경된 댓글내용입니다.");

        commentMapper.update(comment);

    }

    @Test
    @DisplayName("특정 댓글 1개를 조회할 수 있어야 한다.")
    void readTest() {
        Comment findComment = commentMapper.read(3);

        System.out.println("=====================================");
        System.out.println(findComment);
        System.out.println("=====================================");
    }

    @Test
    @DisplayName("특정 게시물의 댓글 목록을 조회할 수 있어야 한다.")
    void getCommentTest() {
        Criteria cri = new Criteria();
        cri.setPage(1);
        cri.setAmount(10);

        List<Comment> commentList = commentMapper.getCommentList(1, cri);

        System.out.println("========================");
        for (Comment comment : commentList) {
            System.out.println(comment);
        }
        System.out.println("==============================");
    }

    @Test
    @DisplayName("특정 게시글의 댓글 수를 조회할 수 있어야 한다.")
    void getCountTest1() {

        int count = commentMapper.getCommentCount(1);
        System.out.println(count);
    }

    @Test
    @DisplayName("특정 유저의 댓글 목록을 조회할 수 있어야 한다.")
    void getUserCommentTest() {

        Criteria cri = new Criteria();
        cri.setPage(1);
        cri.setAmount(10);

        List<Comment> commentList = commentMapper.getUserComment("가나다", cri);

        System.out.println("========================");
        for (Comment comment : commentList) {
            System.out.println(comment);
        }
        System.out.println("==============================");
    }

    @Test
    @DisplayName("특정 유저의 댓글 수를 조회할 수 있어야 한다.")
    void getCountTest2() {
        int count = commentMapper.getUserCommentCount("가나다");
        System.out.println("해당 유저의 댓글 수 : " +count);
    }

}