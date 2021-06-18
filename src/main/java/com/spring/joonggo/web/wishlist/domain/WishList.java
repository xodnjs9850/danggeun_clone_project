package com.spring.joonggo.web.wishlist.domain;

import lombok.*;

@Getter @Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class WishList {

    /*wishlist_no NUMBER(5) PRIMARY KEY,
    user_id VARCHAR2(20) NOT NULL, -- 아이디
    user_nickname VARCHAR2(20) NOT NULL, -- 닉네임
    goods_no NUMBER(5) NOT NULL, -- 상품번호
    goods_tile VARCHAR2(100), -- 상품 이름
    wishlist_created_date DATE DEFAULT SYSDATE*/

    private static int sequence;
    private int productNum;
    private String userId;
    private String userNick;
    private String productName;

}
