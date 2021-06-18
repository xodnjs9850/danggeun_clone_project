package com.spring.joonggo.web.comments.api;

import com.spring.joonggo.web.comments.domain.Comment;
import com.spring.joonggo.web.comments.service.CommentService;
import com.spring.joonggo.web.common.paging.Criteria;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@RestController
@Log4j2
@CrossOrigin
@RequiredArgsConstructor
@RequestMapping("/api/comment")
public class CommentApiController {


    //RequestMapping으로 URL 분리해야 함

    private final CommentService commentService;

    //댓글 목록 조회 요청 처리
    @GetMapping("/{bno}/{page}")
    public ResponseEntity<Map<String, Object>> getList(
            @PathVariable("bno") int boardNo
            , @PathVariable("page") int page
    ) {
        Criteria criteria = new Criteria(page, 10);
        Map<String, Object> commentMap = commentService.getCommentList(boardNo, criteria);
        log.info("CommentList " + boardNo + " GET!!");

        if (commentMap != null) {
            log.info("commentMap 전달 성공!");
            log.info(commentMap.get("count"));
            return new ResponseEntity<>(commentMap, HttpStatus.OK);
        } else {
            //리스트가 없으면 500 에러를 리턴
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    //댓글 등록 처리 요청
    @PostMapping("")//url없이 post보내면 등록되도록
    //비동기로 받으면 json으로 오기 때문에 @RequestBody로 받아야 함
    public ResponseEntity<String> create(@RequestBody Comment comment) {
        log.info("Comment Save POST - " + comment);

        return commentService.register(comment)
                ? new ResponseEntity<>("insertSuccess", HttpStatus.OK)
                : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
    }

    //댓글 수정 요청 처리
    @PutMapping("/{cno}")
    public ResponseEntity<String> modify(
            @PathVariable("cno") int commentNo
            , @RequestBody Comment comment
    ) {
        comment.setCommentNo(commentNo);
        log.info("Comment " + commentNo + " PUT - " + comment);

        return commentService.modify(comment)
                ? new ResponseEntity<>("modSuccess", HttpStatus.OK)
                : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
    }

    //댓글 삭제 요청 처리
    @DeleteMapping("/{cno}")
    public ResponseEntity<String> remove(
        @PathVariable("cno") int commentNo
    ) {
        return commentService.delete(commentNo)
                ? new ResponseEntity<>("delSuccess", HttpStatus.OK)
                : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
    }

}
