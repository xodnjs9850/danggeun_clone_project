package com.spring.joonggo.web.common.paging;

import com.spring.joonggo.web.nboard.domain.Category;
import com.spring.joonggo.web.sellboard.domain.SellCategory;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Criteria {

    private int page;       //페이지 넘버
    private int amount;     //한 페이지당 게시물 수

    private String type;    //검색 조건
    private String keyword; //검색어

    private Category category; //일반 게시판 카테고리

    private SellCategory sellCategory; // 판매 게시판 카테고리


    public Criteria() {
//        this.page = 1;
//        this.amount = 10;
        this(1, 10);//아래의 생성자로 연결되므로 한줄로 처리 가능
    }

    public Criteria(int page, int amount) {
        this.page = page;
        this.amount = amount;
    }

    public void setPage(int page) {
        if (page <= 0) {
            this.page = 1;
            return;
        }
        this.page = page;
    }

    public void setAmount(int amount) {
        if (amount <= 0 || amount > 100) {
            this.amount = 10;
            return;
        }
        this.amount = amount;
    }
}
