package com.spring.joonggo.web.nboard.service;

import com.spring.joonggo.web.common.paging.Criteria;
import com.spring.joonggo.web.nboard.domain.DummyNBoard;
import com.spring.joonggo.web.nboard.domain.NBoard;
import com.spring.joonggo.web.nboard.repository.NBoardMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class NBoardService {

    private final NBoardMapper nBoardMapper;

    // 게시글 저장 기능
    public void register(NBoard nBoard) {
        nBoardMapper.save(nBoard);
    }

    // 게시글 목록을 받아오는 기능 (내림차순)
    public List<NBoard> getBoardList(Criteria criteria) {
        List<NBoard> boardlist = nBoardMapper.getSearchBoards(criteria);
        for (NBoard board : boardlist) {
            //각 게시물들의 등록시간 읽어오기 (밀리초)
            long regTime = board.getPostDate().getTime();//getTime을 쓰면 시간을 밀리초로 가져옴
            //현재시간 읽어오기 (밀리초)
            long now = System.currentTimeMillis();
            //3분이내(밀리초)면 신규게시글
            if (now - regTime < 60 * 3 * 1000) {
                board.setNewBoard(true);
            }
        }
        return boardlist;
    }

    // 총 게시물 수 확인
    public int getTotal(Criteria criteria) {
        return nBoardMapper.getTotalBoardCount(criteria);
    }

    // 게시글 삭제 기능
    public void delete(int boardNo) {
        nBoardMapper.remove(boardNo);
    }

    // 게시글 수정 기능
    public void modify(int boardNo, DummyNBoard dummyNBoard) {
        dummyNBoard.setBoardNo(boardNo);
        nBoardMapper.change(dummyNBoard);
    }

    // 게시글 조회 기능
    public NBoard viewDetail(int boardNo, boolean viewFlag) {
        if (viewFlag) nBoardMapper.plusViews(boardNo);
        return nBoardMapper.findOne(boardNo);
    }

    // 게시글 추천 기능
    public void plusRecommend(int boardNo) {
        nBoardMapper.plusRec(boardNo);
    }



}
