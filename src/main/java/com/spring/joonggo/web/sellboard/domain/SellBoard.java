package com.spring.joonggo.web.sellboard.domain;

import lombok.*;

import java.util.Date;
import java.util.List;

@Getter @Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class SellBoard {

    private static int sequence;

    private int productNum;  //상품 번호
    private String productName; //상품 이름
    private int sellPrice; // 판매 금액
    private String productContent; // 상품내용
    private String sellArea; // 판매 지역
    private Date createDate; // 생성일자
    private int viewCount; //조회수
    private String sellerId; // 판매자 ID
    private String sellerNick; // 판매자 닉네임
    private String buyerId; // 구매자 ID
    private String buyerNick; // 구매자 닉네임
    private SellCategory sellCategory; // 카테고리
    private SellStateFlag stateFlag; // 판매 상태

    // 첨부파일 경로 리스트
    private List<String> filePathList;

    //메인이미지경로
    private String mainImgPath;

    private boolean newSellBoard;

//    public SellBoard() {
//        this.productNum = sequence++;
//    }
//
//    public SellBoard(String productName
//            , int sellPrice
//            , String productContent
//            , String sellArea
//            , String sellerId
//            , String sellerNick
//            , SellCategory sellCategory) {
//        this();
//        this.productName = productName;
//        this.sellPrice = sellPrice;
//        this.productContent = productContent;
//        this.sellArea = sellArea;
//        this.sellerId = sellerId;
//        this.sellerNick = sellerNick;
//        this.sellCategory = sellCategory;
//        this.stateFlag = SellStateFlag.SALE;
//
//
//    }

}