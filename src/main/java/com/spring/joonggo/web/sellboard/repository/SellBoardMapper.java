package com.spring.joonggo.web.sellboard.repository;

import com.spring.joonggo.web.common.paging.Criteria;
import com.spring.joonggo.web.common.upload.FileList;
import com.spring.joonggo.web.sellboard.domain.DummyBoard;
import com.spring.joonggo.web.sellboard.domain.SellBoard;

import com.spring.joonggo.web.sellboard.domain.SellStateFlag;

import com.spring.joonggo.web.user.domain.User;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface SellBoardMapper {

    // 판매 게시물 전체 검색(페이징없는 버전)
//    List<SellBoard> findAll(Criteria criteria);

    // 검색 퀴리 추가버전
    List<SellBoard> findAll(Criteria criteria);

    // 총 게시물 수 조회
    int getTotalCounter(Criteria criteria);

    // 판매 게시물 추가 기능
    void addProduct(SellBoard sellBoard, FileList fileList);

    void addProduct(SellBoard sellBoard);

    // 판매 게시물 삭제 기능
    void deleteProduct(int productNum);

    // 게시물 수정
    void modifyProduct(int productNum, DummyBoard dummyBoard);

    // 게시물 상세보기
    SellBoard intoContent(int productNum);

    // 게시물 판매 상태 변경
    void modifyState(int productNum, SellStateFlag stateFlag);

    // 조회수 상승
    void addViews(int productNum);

    // 파일첨부 기능
    void addFile(FileList fileList);

    // 게시글 첨부파일 경로 얻기
    List<String> getFilePaths(int productNum);

}
