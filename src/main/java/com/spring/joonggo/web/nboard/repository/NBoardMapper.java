package com.spring.joonggo.web.nboard.repository;

import com.spring.joonggo.web.common.paging.Criteria;
import com.spring.joonggo.web.nboard.domain.DummyNBoard;
import com.spring.joonggo.web.nboard.domain.NBoard;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface NBoardMapper {

    // 게시글 저장 기능
    void save(NBoard nBoard);

    // 게시글 삭제 기능
    void remove(int boardNo);

    // 게시글 조회 기능
    NBoard findOne(int boardNo);

    // 게시글 수정 기능
    void change(DummyNBoard dummyNBoard);

    // 전체 게시글 조회 기능(페이징 기능)
    List<NBoard> findAll();

    // 전체 게시글 조회 기능(페이징 + 검색 기능)
    List<NBoard> getSearchBoards(Criteria criteria);

    // 총 게시물 수 조회
    int getTotalBoardCount(Criteria criteria);

    // 게시글 추천 기능
    void plusRec(int boardNo);

    // 조회수 증가 기능
    void plusViews(int boardNo);

}
