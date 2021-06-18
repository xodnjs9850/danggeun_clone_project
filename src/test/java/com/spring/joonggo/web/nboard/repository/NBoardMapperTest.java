package com.spring.joonggo.web.nboard.repository;

import com.spring.joonggo.web.common.paging.Criteria;
import com.spring.joonggo.web.nboard.domain.Category;
import com.spring.joonggo.web.nboard.domain.DummyNBoard;
import com.spring.joonggo.web.nboard.domain.NBoard;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class NBoardMapperTest {

    @Autowired
    private NBoardMapper nBoardMapper;

    @Test
    @DisplayName("DB에 게시글이 정상적으로 저장되어야 한다.")
    void saveTest() {
        NBoard nb = new NBoard();
        nb.setTitle("테스트 게시글 제목입니다.");
        nb.setContent("테스트용 컨텐츠입니다.");
        nb.setUserId("테스트용 아이디1입니다.");
        nb.setUserNickName("테스트용 닉네임1입니다.");
        nb.setCategory(Category.ISSUE);

        nBoardMapper.save(nb);

    }

    @Test
    @DisplayName("DB에서 해당 게시글이 정상적으로 삭제되어야 한다.")
    void deleteTest() {
        nBoardMapper.remove(1);
    }

    @Test
    @DisplayName("특정 게시글이 정상적으로 변경, 저장되어야 한다.")
    void changeTest() {
        DummyNBoard nb = new DummyNBoard();

        nb.setBoardNo(7);

        nb.setTitle("변경된 제목입니다.");
        nb.setContent("변경된 컨텐츠입니다.");
        nb.setUserId("변경 아이디");
        nb.setUserNickName("변경 닉네임");

        nb.setCategory(Category.ISSUE);
        nBoardMapper.change(nb);
    }

    @Test
    @DisplayName("특정 게시글이 정상적으로 조회되어야 한다.")
    void findOneTest() {
        NBoard one = nBoardMapper.findOne(2);
        System.out.println("=================================");
        System.out.println(one);
    }

    @Test
    @DisplayName("")
    void bulkInsert() {
        for (int i = 0; i < 100; i++) {
            NBoard nb = new NBoard();
            nb.setTitle(i + "번 테스트 게시글 제목입니다.");
            nb.setContent(i + "테스트용 컨텐츠입니다." + i);
            nb.setUserId("테스트용 아이디" + i + "입니다.");
            nb.setUserNickName("테스트용 닉네임" + i + "입니다.");

            nb.setCategory(Category.ETC);

            nBoardMapper.save(nb);
        }
    }

    @Test
    @DisplayName("게시글 목록이 정상적으로 조회되어야 한다.")
    void findAllTest() {
        System.out.println("========================================");
        Criteria criteria = new Criteria(2, 30);
        for (NBoard nBoard :  nBoardMapper.getSearchBoards(criteria)) {
            System.out.println(nBoard);
        }
        System.out.println("========================================");
    }

    @Test
    @DisplayName("재목으로 검색된 게시물 리스트를 반환해야 한다.")
    void searchByTitleTest() {
        Criteria criteria = new Criteria();
        criteria.setPage(1);
        criteria.setType("title");
        criteria.setKeyword("2");
        criteria.setAmount(20);

        System.out.println("=======================================");
        List<NBoard> list = nBoardMapper.getSearchBoards(criteria);
        for (NBoard b : list) {
            System.out.println(b);
        }
        System.out.println("=======================================");

    }


    @Test
    @DisplayName("카테고리로 검색된 게시물 리스트를 반환해야 한다.")
    void searchByCategoryTest() {
        Criteria criteria = new Criteria();
        criteria.setPage(1);
        criteria.setAmount(10);
        criteria.setCategory(Category.ISSUE);
        criteria.setType("title");
        criteria.setKeyword("변경");

        System.out.println("=======================================");
        List<NBoard> list = nBoardMapper.getSearchBoards(criteria);
        for (NBoard b : list) {
            System.out.println(b);
        }
        System.out.println("=======================================");
    }



}