package com.spring.joonggo.web.common.paging;

import com.spring.joonggo.web.nboard.domain.Category;
import com.spring.joonggo.web.sellboard.domain.SellCategory;
import lombok.Getter;
import lombok.ToString;
import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

@Getter @ToString
public class PageMaker {

    //한 화면에 배치할 페이지 넘버 수
    private static final int PAGE_COUNT = 5;

    private int beginPage;          //시작페이지 번호
    private int endPage;            //끝페이지 번호
    private boolean prev, next;     //이전, 다음 버튼 활성화 여부

    private Criteria criteria;      //현재 요청 페이지 정보
    private int totalCount;         //현재 총 게시물 수

    public PageMaker(Criteria criteria, int totalCount) {
        this.criteria = criteria;
        this.totalCount = totalCount;

        //끝 페이지를 계산
        // (현재 페이지 넘버 / 한 화면에 보여줄 페이지 수)의 올림값 * 한 화면에 보여줄 페이지 수
        // (6(현재 페이지 넘버) / 5(한 화면에 보여줄 페이지 수)) = 1.2
        // 1.2를 올리면 2가 된다. 2 * 5(한 화면에 보여줄 페이지 수)를 하면 끝 페이지 번호가 10이라는걸 알 수 있다.
        this.endPage = (int)(Math.ceil( (double) criteria.getPage()/PAGE_COUNT) * PAGE_COUNT);
        //ceil은 리턴값이 double이기 때문에 내부값을 double로 바꿔주고 int타입인 endPage에 저장해주기 위해서 전체를 int로 바꿔준다.

        //시작 페이지 계산
        this.beginPage = endPage - PAGE_COUNT + 1;

        /*
         - 페이지 마지막 구간 끝페이지 보정
         : 총 게시물 수가 284개이고 한 화면당 10페이지씩 보여주고 있다면
           마지막 구간은 21  - 30 이 아니라 21 - 29가 되어야 한다.
           따라서 마지막 구간에서 endPage 보정이 필요!
          - 보정 공식: (총 게시물 수 / 한 페이지당 보여줄 게시물 수)의 올림값
            284(총 게시물 수) / 10(amount : 한 페이지당 보여줄 게시물 수) = 28.4
            28.4의 올림값인 29가 endPage가 된다.
         */
        int realEnd = (int) Math.ceil((double)totalCount / criteria.getAmount());

        //보정은 마지막 페이지 구간에서만 일어나야 함
        if (realEnd <= endPage) {
            this.endPage = realEnd;
        }

        //이전 버튼 활성화 여부
        this.prev = this.beginPage > 1;

        //다음 버튼 활성화 여부
        this.next = this.endPage < realEnd;

    }

    //요청 파라미터를 쉽게 만들어주는 메서드
    public String makeParam(int page) {
        UriComponents build = UriComponentsBuilder.newInstance()
                .queryParam("page", page)
                .queryParam("type", criteria.getType())
                .queryParam("keyword", criteria.getKeyword())
                .queryParam("amount", criteria.getAmount())
                .queryParam("category", criteria.getCategory())
                .build();

        return build.toString();
    }

    public String makeParam(int page, int amount) {
        UriComponents build = UriComponentsBuilder.newInstance()
                .queryParam("page", page)
                .queryParam("type", criteria.getType())
                .queryParam("keyword", criteria.getKeyword())
                .queryParam("amount", amount)
                .queryParam("category", criteria.getCategory())
                .build();

        return build.toString();
    }

    //카테고리 makeParam
    public String makeParam(int page, int amount, Category category) {
        UriComponents build = UriComponentsBuilder.newInstance()
                .queryParam("page", page)
                .queryParam("type", criteria.getType())
                .queryParam("keyword", criteria.getKeyword())
                .queryParam("amount", amount)
                .queryParam("category", category)
                .build();

        return build.toString();
    }

    // 판매 게시판 카테고리
    public String makeParam(int page, int amount, SellCategory sellCategory) {
        UriComponents build = UriComponentsBuilder.newInstance()
                .queryParam("page", page)
                .queryParam("type", criteria.getType())
                .queryParam("keyword", criteria.getKeyword())
                .queryParam("amount", amount)
                .queryParam("sellCategory", sellCategory)
                .build();

        return build.toString();
    }


}
