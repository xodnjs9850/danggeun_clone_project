package com.spring.joonggo.web.sellboard.service;

import com.spring.joonggo.web.common.paging.Criteria;
import com.spring.joonggo.web.common.upload.FileList;
import com.spring.joonggo.web.sellboard.domain.DummyBoard;
import com.spring.joonggo.web.sellboard.domain.SellBoard;

import com.spring.joonggo.web.sellboard.domain.SellStateFlag;

import com.spring.joonggo.web.sellboard.repository.SellBoardMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class SellBoardService {

    @Autowired
    private final SellBoardMapper sellBoardMapper;

    // 게시물 검색
    public List<SellBoard> findAll(Criteria criteria) {

        List<SellBoard> sellBoards = sellBoardMapper.findAll(criteria);

        for (SellBoard sellBoard : sellBoards) {
            List<String> loadImgList = loadImg(sellBoard.getProductNum());

            long regTime = sellBoard.getCreateDate().getTime();//getTime을 쓰면 시간을 밀리초로 가져옴
            //현재시간 읽어오기 (밀리초)
            long now = System.currentTimeMillis();
            //3분이내(밀리초)면 신규게시글
            if (now - regTime < 60 * 3 * 1000) {
                sellBoard.setNewSellBoard(true);
            }
            if (loadImgList.size() != 0) {
                sellBoard.setMainImgPath(loadImgList.get(0));
            }
        }

        return sellBoards;
    }

    // 게시물 추가
    @Transactional
    public void addProduct(SellBoard sellBoard, FileList fileList) {
        sellBoardMapper.addProduct(sellBoard);
        sellBoardMapper.addFile(fileList);
    }

    // 이미지 경로 가져오기
    public List<String> loadImg(int productNum) {
        return sellBoardMapper.getFilePaths(productNum);
    }

    // 게시물 삭제
    public void deleteProduct(int productNum) {
        sellBoardMapper.deleteProduct(productNum);
    }

    // 게시물 수정
    public void modifyProduct(int productNum, DummyBoard dummyBoard) {
        System.out.println("====================================================");
        System.out.println(productNum);

        dummyBoard.setProductNum(productNum);
        sellBoardMapper.modifyProduct(productNum, dummyBoard);
    }

    // 게시물 상세보기
    public SellBoard intoContent(int productNum) {
        sellBoardMapper.addViews(productNum);
        return sellBoardMapper.intoContent(productNum);
    }

    // 게시물 총 수 확인
    public int getTotal(Criteria criteria) {
        return sellBoardMapper.getTotalCounter(criteria);
    }

    // 상태 변경 기능
    public void modifyState(int productNum, SellStateFlag stateFlag) {
        sellBoardMapper.modifyState(productNum, stateFlag);
    }

//    @Transactional // 트랜잭션 처리 자동화
//    public void addList(SellBoard sellBoard, FileList fileList) {
//        sellBoardMapper.addFile(sellBoard, fileList);
//
//        /*// 첨부파일이 존재한다면 추가 쿼리 동작
//        List<String> filePathList = sellBoard.getFilePathList();
//        if (filePathList != null){
//            for (String path : filePathList) {
////                sellBoardMapper.addFile(path);
//            }
//        }*/
//    }

    // 파일 로드 기능

}
