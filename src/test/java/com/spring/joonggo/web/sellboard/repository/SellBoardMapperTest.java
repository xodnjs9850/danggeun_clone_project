package com.spring.joonggo.web.sellboard.repository;

import com.spring.joonggo.web.common.paging.Criteria;
import com.spring.joonggo.web.sellboard.domain.SellBoard;

import com.spring.joonggo.web.sellboard.domain.SellCategory;

import com.spring.joonggo.web.sellboard.domain.SellStateFlag;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.ArrayList;
import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class SellBoardMapperTest {

    @Autowired
    private SellBoardMapper sellBoardMapper;

    @Test
    void findAll() {

        List<SellBoard> sellBoardList = new ArrayList<>();
        sellBoardList = sellBoardMapper.findAll(new Criteria(1, 10));
        System.out.println("=====================================================");
        for (SellBoard sellBoard : sellBoardList) {
            System.out.println(sellBoard);
        }
        System.out.println("========================================================");
    }

    @Test
    void getTotalCounter() {
        Criteria criteria = new Criteria();
        criteria.setType("title");
        criteria.setKeyword("고급");

        for (SellBoard searchArticles : sellBoardMapper.findAll(criteria)){
            System.out.println(searchArticles);
        }
    }

    @Test
    void addProduct() {


        /*String productName
            , int sellPrice
            , String productContent
            , String sellArea
            , String sellerId
            , String sellerNick
            , SellCategory sellCategory*/

        for (int i = 0; i <= 2; i++) {
            SellBoard sellBoard = SellBoard.builder()
                    .sellCategory(SellCategory.LIVING)
                    .sellArea("서울특별시")
                    .sellPrice(150000)
                    .sellerId("xodnjs")
                    .sellerNick("야옹이")
                    .productName("침대 매트리스 팝니다.")
                    .productContent("침대 매트리스 팝니다. 아직 쓸만합니다. 생활 얼룩은 있음.")
                    .build();
            sellBoardMapper.addProduct(sellBoard);
        }



//        System.out.println(sellBoard);



    }

    @Test
    void deleteProduct() {
        sellBoardMapper.deleteProduct(2);
    }

    @Test
    void modifyProduct() {

        System.out.println("================================================");
        SellBoard sellBoard = new SellBoard();
        sellBoard.setSellPrice(7000000);
        sellBoard.setProductContent("페라리 자전거 살 사람 구함. 네고 절대 안됨");
        sellBoard.setProductName("페롸리~ 고급진 자전차~~");
        sellBoard.setSellArea("부산광역시 해운대~~ 변겨 2");
        sellBoard.setProductNum(4);
//        sellBoardMapper.modifyProduct(sellBoard);

    }

    @Test
    void intoContent() {

        System.out.println("=================================================");
        SellBoard sellBoard = new SellBoard();
        sellBoard = sellBoardMapper.intoContent(2);
        System.out.println(sellBoard);
        System.out.println("=========================================================");

    }

    @Test
    void modifyState() {

        sellBoardMapper.modifyState(4, SellStateFlag.SALE);

    }
}